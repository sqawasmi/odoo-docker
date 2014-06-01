Docker build for Odoo (OpenERP)
================================

This repository provides Dockerfile for Odoo (formerly OpenERP) with SSH access.

### Status
This build still "work in progress".

Built images are uploaded to [index.docker.io][1]

### Usage:

 - Install Docker: [http://docs.docker.io/][2]
 - Execute
 `docker run -d --name odoo -p 2222:22 -p 8069:8069 shaker/odoo`
 - Browse [http://&lt;your server ip address&gt;:8069/][3]
 - Stop and start again
   - `docker stop odoo`
   - `docker start odoo`
 - `root` password is `odoo`

  [1]: https://index.docker.io/u/shaker/
  [2]: http://docs.docker.io/en/latest/ "docs.docker.io"
  [3]: http://127.0.0.1:8069/
