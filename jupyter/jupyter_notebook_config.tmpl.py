c.Application.log_datefmt = '%Y-%m-%d %H:%M:%S'
c.Application.log_format = '[%(name)s]%(highlevel)s %(message)s'
c.Application.log_level = 30
c.JupyterApp.answer_yes = True
c.NotebookApp.allow_origin = '*'
c.NotebookApp.allow_password_change = False
c.NotebookApp.allow_root = True  # Run in docker
# Uncomment if you did not use nginx for forwarding
# c.NotebookApp.certfile = u'path/to/ssl-cert-file'
# c.NotebookApp.keyfile = u'path/to/ssl-key-file'
c.NotebookApp.password = u'password__hashed'
c.NotebookApp.open_browser = False
c.NotebookApp.ip = '*'
c.NotebookApp.port = 8888  # Update with whatever you want
