# INCEPTION: Dockerized Web Application Setup

This project sets up a full-stack Dockerized environment with multiple services including Nginx, WordPress, MariaDB, Redis, FTP, Adminer, cAdvisor, and more. The goal is to provide a simple yet flexible solution for building and managing web applications using Docker containers.

### Project Structure

- **Nginx**: Serves as a reverse proxy to route incoming traffic securely to the appropriate services.
- **MariaDB**: The database server for the WordPress site.
- **WordPress**: The content management system (CMS) powering the website.
- **Adminer**: A lightweight database management tool for MariaDB.
- **Redis**: A caching service to boost performance.
- **FTP**: A file transfer protocol service for easy file management.
- **cAdvisor**: A container monitoring tool to track performance metrics.
- **MyWeb**: A custom web app running on a specific port.

### Prerequisites

Before getting started, ensure that you have the following installed:

- Docker (v20.10 or higher)
- Docker Compose (v1.29 or higher)

### Setup Instructions

1. **Clone the repository**  
   Clone the repository to your local machine.

   ```bash
   git clone <repository_url>
   cd <repository_directory>
   ```
2. **Configure environment variables**
Create a .env file with the necessary values. This file will contain values such as database credentials, site details, and user information:
DOMAIN_NAME=yourdomain.com
STATE=YourState
LOCALITY=YourCity
ORG=YourOrganization
COUNTRY=YourCountry
DB_NAME=yourdbname
DB_USER=yourdbuser
DB_PASS=yourdbpassword
ADMIN_USERNAME=youradminusername
ADMIN_MAIL=youremail@example.com
USER_USERNAME=yourusername
USER_MAIL=youruseremail@example.com
WEBSITE_NAME=yourwebsite
ADMIN_PASS=youradminpassword
USER_PASS=youruserpassword
FTP_USER=yourftpuser
FTP_PASS=yourftppassword

3. **Build and start the containers**
Run Docker Compose to build and start all the services.
```bash
  make
```
or 
```bash
  make deamon
```
4. **Access your services**

- **Nginx**: Access the website via https://yourdomain.com (replace with your actual domain name).
- **Adminer**: Manage your MariaDB database at http://localhost:8080.
- **FTP**: Use your FTP credentials to access the server via FTP on port 21.
- **cAdvisor**: Monitor container metrics at http://localhost:8080.

### Services Overview
- **Nginx**: Acts as a reverse proxy and load balancer, routing traffic to WordPress or other services based on configuration.
- **MariaDB**: The relational database management system used by WordPress.
- **WordPress**: The platform for creating and managing the website.
- **Adminer**: A simple and easy-to-use database management tool for MariaDB.
- **Redis**: A fast, in-memory data store used to improve WordPress performance through caching.
- **FTP**: Allows you to manage files on the server.
- **cAdvisor**: Provides detailed statistics about container performance, helping to monitor resource usage.
- **MyWeb**: A custom web app running on port 8070.


### Volumes
This project uses Docker volumes for data persistence:

- **wordpress_data**: Stores the WordPress data.
- **mariadb_data**: Stores the MariaDB data.
- **adminer_data**: Stores the Adminer data.
- 
## Networking
The containers are connected via a Docker bridge network named inception to ensure secure communication between them.
