# System Installation

The full BV-BRC system comprises a set of interconnected services. In this document we will summarize the services and their installation and configuration requirements.

The description is laid out in a top-down manner; however, during an actual installation performing the service installs in a bottom to top manner will allow incremental testing and validation of the services.

## Component Inventory

### Web Client.

The primary interface to the BV-BRC is the end user's web browser. This of course requires no configuration on our part; however we mention it because the web client is the platform which hosts the Javascript code comprising the BV-BRC web application.

### Web Server

The BV-BRC web server is a Node.js application using the Express middleware library. It is used to serve the javascript files and static assets used by the BV-BRC web application, as well as providing a set of routes implementing a set of core web application-related services.

The code for the web server is found at github here: https://github.com/BV-BRC/BV-BRC-Web

#### Dependencies

- Email server. The web application needs access to a mail server to send out user notifications

### Data API Service

The Data API provides access to the underlying Solr database, adding functionality atop the Solr query interface and enforcing data privacy rules.

The source code for the data API is found at github here: https://github.com/BV-BRC/BV-BRC-API

### User Management Service

The user service manages the BV-BRC user database. It provides REST endpoints for user registration, authentication, and profile updates.

The source code is available at github at https://github.com/BV-BRC/BV-BRC-UserManagement

### Workspace Service

The workspace service implements the BV-BRC user workspace, providing storage and access for flat files.

The code for the Workspace is available here: https://github.com/BV-BRC/Workspace. The workspace service requires the configuration of a BV-BRC dev container.

### Shock Service

The Shock service provides the underlying file store API for the Workspace.

### Application Service

The application service implements the API that provides access to the BV-BRC backend computational infrastructure. It comprises a web service that exposes task creation and monitoring, and an application scheduler that manages the batch execution of computational tasks.

### Slurm scheduler

The scheduling of tasks on the BV-BRC computational cluster is managed by an off the shelf Slurm scheduler installation. This is used by the application service to manage the distribution of jobs onto the cluster, and enables detailed job accounting and fair share access to resources.

### Other standalone services

There are several other services that perform on-demand computations. Their installation and configuration is fairly similar:

- Compare regions
- Minhash (genome comparison)
- Legacy authentication

### MongoDB

Several of the BV-BRC services uses a MongoDB database as backing store:

- Workspace. Requires an older version of MongoDB due to the deprecation of the Perl interface to MongoDB by the MongoDB vendor
- Shock.
- User Management Service

### MySQL

The Application Service uses a MySQL database as backing store. In addition, the standard deployment of the Slurm scheduler uses a MySQL database as the backing store for its job accounting system.
