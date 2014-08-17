from pyramid.config import Configurator
from sqlalchemy import engine_from_config

from .models import (
    DBSession,
    Base,
    )
from .scripts.initializedb import create_db
def create_application(settings):
    engine = engine_from_config(settings, 'sqlalchemy.')
    DBSession.configure(bind=engine)
    Base.metadata.bind = engine
    
    create_db(engine, DBSession)
    
    config = Configurator(settings=settings)
    config.include("pyramid_mako")
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.add_route('home', '/')
    config.scan()
    return config.make_wsgi_app()
    

def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    return create_application(settings)
