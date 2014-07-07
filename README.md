Docker build for Odoo (OpenERP)
================================

This repository provides Dockerfile for Odoo (formerly OpenERP) with SSH access.

### Status
This build still "work in progress".

Built images are uploaded to [index.docker.io][1]

### Usage:

 - Install Docker: [http://docs.docker.io/][2]
 - Run a Postgresql server, I'm using [shaker/postgresql][4] Image (Skip this step if you already have a running postgresql server):
 `docker run --name postgres -d shaker/postgresql`
 - Run Odoo (this will auto link the previously created postgresql server, read about docker linking [here][5])
 `docker run --name odoo --link postgres:db -p 8069:8069 -d shaker/odoo`
 - If you have you have a specific configuration for openerp (for example, a different database connection), then you can [mount it into docker][6], lets say your configuration is located under `/home/user/openerp-conf/`, you can run it by:
 `docker run --name odoo -v /home/user/openerp-conf:/etc/openerp -p 8069:8069 -d shaker/odoo`
 - Browse [http://&lt;your server ip address&gt;:8069/][3]
 - Stop and start again
   - `docker stop odoo`
   - `docker start odoo`
 - ssh `root` password is `odoo` - you should change it if you exposed ssh port.

  [1]: https://index.docker.io/u/shaker/
  [2]: http://docs.docker.io/en/latest/ "docs.docker.io"
  [3]: http://127.0.0.1:8069/
  [4]: https://registry.hub.docker.com/u/shaker/postgresql-docker/
  [5]: https://docs.docker.com/userguide/dockerlinks/
  [6]: https://docs.docker.com/userguide/dockervolumes/