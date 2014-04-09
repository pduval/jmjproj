from pyramid.response import Response
from pyramid.view import view_config
from pyramid.httpexceptions import HTTPMovedPermanently
from sqlalchemy.exc import DBAPIError

from .models import (
    DBSession,
    CompteRendu,
    )
import datetime


@view_config(route_name="home", renderer='jmproj:templates/all_cr.mako')
def liste_comptes_rendus(request):
    try:
        compte_rendus = DBSession.query(CompteRendu).order_by("date_ecriture")
        projets = [row[0] for row in DBSession.query(CompteRendu).with_entities(CompteRendu.projet).distinct().all()]
        projet = request.params.get("projet", "")
        cr_prefix =request.params.get("cr_prefix","")
        if projet:
            compte_rendus = compte_rendus.filter_by(projet=projet);
        if cr_prefix:
            compte_rendus = compte_rendus.filter(CompteRendu.compte_rendu.startswith(cr_prefix.strip()))
        return {
            "comptes_rendus":compte_rendus,
            "total":compte_rendus.count(),
            "projet":projet,
            "cr_prefix":cr_prefix,
            "project":"jmproj",
            "projets":projets
            }
    except DBAPIError:
        return Response(conn_err_msg, content_type='text/plain', status_int=500)

@view_config(name='add', request_method="POST", renderer='jmproj:templates/all_cr.mako')
def add(request):
    cr = request.params.get("compte_rendu",None)
    projet = request.params.get("projet",None)
    nouveau_cr = CompteRendu(compte_rendu=cr, projet=projet,date_ecriture=datetime.datetime.utcnow())
    DBSession.add(nouveau_cr)
    DBSession.commit()
    return HTTPMovedPermanently(location="/")
    
conn_err_msg = """\
Pyramid is having a problem using your SQL database.  The problem
might be caused by one of the following things:

1.  You may need to run the "initialize_jmproj_db" script
    to initialize your database tables.  Check your virtual 
    environment's "bin" directory for this script and try to run it.

2.  Your database server may not be running.  Check that the
    database server referred to by the "sqlalchemy.url" setting in
    your "development.ini" file is running.

After you fix the problem, please restart the Pyramid application to
try it again.
"""

