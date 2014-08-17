#!/usr/bin/python
import os
virtenv = os.environ['OPENSHIFT_PYTHON_DIR'] + '/virtenv/'
virtualenv = os.path.join(virtenv, 'bin/activate_this.py')
try:
    execfile(virtualenv, dict(__file__=virtualenv))
except IOError:
    pass
#
# IMPORTANT: Put any additional includes below this line.  If placed above this
# line, it's possible required libraries won't be in your searchable path
#
import sys

sys.path.append(os.path.join(os.environ['OPENSHIFT_REPO_DIR'], "jmproj"))
from jmproj import create_application
db_host = os.environ["OPENSHIFT_POSTGRESQL_DB_HOST"]
db_port = os.environ["OPENSHIFT_POSTGRESQL_DB_PORT"]
db_user = os.environ["OPENSHIFT_POSTGRESQL_DB_USERNAME"]
db_pwd = os.environ["OPENSHIFT_POSTGRESQL_DB_PASSWORD"]
db_url = os.environ["OPENSHIFT_POSTGRESQL_DB_URL"]
settings = {
    "sqlalchemy.url":"postgresql://{0}:{1}@{2}:{3}/{4}".format(db_user, db_pwd, db_host, db_port, u"projets")
    }


application = create_application(settings)
#
# Below for testing only
#
if __name__ == '__main__':
    from wsgiref.simple_server import make_server
    httpd = make_server('localhost', 8051, application)
    # Wait for a single request, serve it and quit.
    httpd.handle_request()
