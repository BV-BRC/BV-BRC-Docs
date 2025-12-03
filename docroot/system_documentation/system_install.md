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

# Detailed Installation Notes

Since the BV-BRC system includes a number of services each running on its own host and port and possibly having associated authentication information, it is useful to keep a spreadsheet with this information at hand while configuring the hosts and while configuring the services that utilize them. 

## MySQL

The current production BV-BRC installation uses the [Percona](https://www.percona.com/mysql/software) build of MySQL. It is best to consult with a MySQL expert to configure the system for optimal memory and disk configuration. Our installation is version 8.0.35 on a 768GB system with SSD drives. 

Best practice is to configure password-protected grants for the databases configured for the services. We will discuss the particular databases in the appropriate sections (application service and Slurm scheduler).

## MongoDB

Due to issues with the Perl authentication support for MongoDB, we are currently required to run two different versions of the MongoDB server.

The Shock system is using Percona Mongo version 5.0.17.

The Workspace and User Management services use Mongo version 3.4.23.

We run each of these databases with a 3-host replicated server, and daily backups using Linux LVM snapshots.

