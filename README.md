## Project Overview: Docker-based System Infrastructure
This project dives deep into system administration using Docker, challenging individuals to set up a robust infrastructure within a virtual machine environment. From configuring NGINX with strict TLS protocols to orchestrating WordPress, php-fpm, and MariaDB containers, participants build Docker images, employ volumes for databases and website files, and establish network connections between containers. Comprising mandatory and bonus tasks, it emphasizes adherence to best practices, secure configuration without publicly exposed credentials, and optional advanced services like Redis cache and an FTP server. The project’s success hinges on meticulous implementation of Dockerfiles, networking, and environment variable usage, culminating in a fully functional and secure system. This GitHub repository showcases the mastery of Docker orchestration and system administration skills.

## What is A docker and how its work 
Docker is a platform that enables developers to build, package, and deploy applications within containers. Containers are a form of lightweight, portable, and self-sufficient units that encapsulate software and its dependencies, ensuring consistency across different environments.
<ul>
<li>Docker Engine</li> At its core is the Docker Engine, which manages the containers. It consists of a server (daemon) and a REST API, allowing users to interact with Docker. The Docker client communicates with the Docker daemon via commands.

<li>Images</li> Containers are created based on Docker images. Images are templates that contain everything needed to run an application: the code, runtime, system tools, libraries, and settings. Images are built from Dockerfiles, which are text files containing instructions to assemble an image.

<li>Containers</li> When you run an image, it becomes a container. Containers are instances of images that can be started, stopped, moved, and deleted. They run in isolation from each other and share the resources of the host machine.

<li>Dockerfile</li> This is a text file that contains instructions for building a Docker image. It includes commands to specify the base image, install dependencies, copy files, set environment variables, and define what happens when the container starts.

<li>Registry</li> Docker images can be stored in registries like Docker Hub, a public repository, or private registries. These registries allow users to share and distribute their images.

<li>Networking and Volumes</li> Docker provides networking capabilities to connect containers and allows data to persist beyond the lifecycle of a container using volumes.
</ul>

## What is a container 
In the world of Docker, a container is like a self-contained box for your application. It packages up your code, runtime environment, system tools, and settings into a single unit that can run on any Linux system, regardless of the underlying infrastructure.

Here's a breakdown of what a Docker container is and what it does:

<ul>
  <li>Isolation:</li>
Containerized applications are isolated from each other and the host system. This means they don't share resources or interfere with each other, making them more secure and predictable.

<li>Portability:</li>
Containers are lightweight and portable, meaning they can be easily moved between different environments, like laptops, servers, and cloud platforms, without needing modifications.

<li>Standardization:</li>
Docker containers are based on standardized images, which are pre-built packages containing everything needed to run a specific application. This simplifies development and deployment, as you don't need to manually configure the environment each time.

<li>Efficiency:</li>
Containers share the underlying operating system kernel with the host system, which makes them more efficient than virtual machines. They start up faster and consume fewer resources, making them ideal for microservices and cloud-native applications.
</ul>

## What is a volume

A Docker volume is a persistent data storage mechanism used in Docker containers. It enables data to persist beyond the lifespan of a container. When a Docker container is removed, any data that was created or modified within the container's filesystem is usually lost. However, Docker volumes provide a way to store and manage data separately from the container itself.

<ul>
<li>Volumes can be used to</li>
Persist Data: Docker volumes allow you to store data generated or used by containers, such as databases, configuration files, logs, or any other data that needs to persist even if the container is stopped or deleted.

<li>Share Data Between Containers</li>
Volumes can be shared among multiple containers, enabling them to access and modify the same data.

<li>Backup and Restore</li> They facilitate easy backup and restoration of container data by separating it from the container instance.

<li>Performance Improvement</li>Volumes can be more efficient than using bind mounts (where a specific directory on the host is mounted into a container) because they're managed by Docker and can offer better performance.

Docker volumes can be managed using Docker commands or specified in a Docker Compose file to define and control data persistence for containers. They can be either anonymous (automatically created by Docker) or named (user-defined). Additionally, various volume drivers exist, allowing you to store data in different types of external storage systems like local directories, cloud storage, network storage, and more.
</ul>
<div>
<h1>This Exemple show you how volume can save us</h1>
<img src="https://i.stack.imgur.com/qYlWg.png"/>
</div>

## Docker Networks Overview
Docker networks are virtualized environments that enable communication and interaction between Docker containers. They facilitate isolation, security, and efficient data exchange among containers, either on the same host or across multiple hosts.

<ul>
There are different types of Docker networks:

<li>Bridge Network</li> This is the default network created when you install Docker. It allows containers to communicate on the same Docker daemon host. Each container in a bridge network gets its own IP address.

<li>Host Network</li>Using this mode, a container shares the network namespace with the host. It doesn't get its own isolated network stack and uses the host's network directly.

<li>Overlay Network</li> It facilitates communication between containers across multiple Docker daemon hosts. It's used in Docker Swarm mode to enable communication among containers running on different hosts.

<li>Macvlan Network</li> This type of network assigns a MAC address to each container, making it appear as a physical device on the network, allowing containers to behave like physical devices on the network.

<li>Custom Networks</li> Users can create custom networks with specific configurations like subnet, gateway, etc., for better control over container communication and network behavior.
</ul>

<img src="https://media.licdn.com/dms/image/C4D12AQFgagv9ZJHwrw/article-cover_image-shrink_720_1280/0/1593688043720?e=1707955200&v=beta&t=iy7NVfVvCKA3YeXTIsny5G6KsGv1cbf_F8HMLemWhhw"/>

## Understanding Dockerfiles and dockercompose
Docker can build images automatically by reading the instructions from a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. This page describes the commands you can use in a Dockerfile.

Overview
The Dockerfile supports the following instructions:

Instruction	Description
| Instruction    | Description                               |
|----------------|-------------------------------------------|
| `ARG`        | Use build-time variables.                  |
| `CMD`        | Specify default commands.                  |
| `COPY`       | Copy files and directories.                |
| `ENTRYPOINT` | Specify default executable.                |
| `ENV`        | Set environment variables.                 |
| `EXPOSE`     | Describe which ports your app is listening on. |
| `FROM`       | Create a new build stage from a base image.|
| `HEALTHCHECK`| Check a container's health on startup.     |
| `LABEL`      | Add metadata to an image.                  |
| `MAINTAINER` | Specify the author of an image.            |
| `ONBUILD`    | Specify instructions for image usage in a build. |
| `RUN`        | Execute build commands.                    |
| `SHELL`      | Set the default shell of an image.         |
| `STOPSIGNAL` | Specify system call signal for container exit. |
| `USER`       | Set user and group ID.                     |
| `VOLUME`     | Create volume mounts.                      |
| `WORKDIR`    | Change working directory.                  |

## Exemple Running the Node.js Application with Docker

To run this Node.js application using Docker, follow these steps:

1. Ensure you have Docker installed on your machine.

2. Create a `Dockerfile` in the root directory of your Node.js application and paste the following content:

```dockerfile
# Use the official Node.js 14 image as the base image
FROM node:14

# Create and set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Expose a port that the application will run on
EXPOSE 3000

# Define the command to start the application
CMD ["node", "app.js"]
```
## Docker Compose Explanation and Example
#### What is Docker Compose?
Docker Compose is a tool used to define and manage multi-container Docker applications. It allows you to describe the configuration of your application's services, networks, and volumes in a single file. With Docker Compose, you can easily create and manage complex applications by defining their relationships and dependencies in a YAML file (docker-compose.yml).

How Does Docker Compose Work?
1. YAML Configuration File
Docker Compose uses a YAML file (docker-compose.yml) to define the services, networks, and volumes required for your application. Let's break down the components:

<ul>
  
<li>Services</li>
Services are the different containers that compose your application. Each service can be defined with its image, ports, environment variables, volumes, and other settings.

<li>Networks</li>
Networks allow containers to communicate with each other. You can define custom networks for your services to connect and interact.

<li>Volumes</li>
Volumes provide persistent storage for your containers. They allow data to persist even if the containers are stopped or removed.
</ul>

Here's an example of a docker-compose.yml file for a simple web application using Docker Compose:
version: '3.8'

```
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html
    networks:
      - my-network

networks:
  my-network:
    driver: bridge
```
## Explain most command that used in docker
`docker version` Display Docker version information
`docker info`  Display system-wide information about Docker
`docker login` Log in to a Docker registry
`docker logout` Log out from a Docker registry
`docker search <image_name>` Search for an image in Docker Hub
`docker pull <image_name>` Pull an image from a registry
`docker push <image_name>`Push an image to a registry

## Steps to Build and Run a Docker Container
###### Step 1: Install Docker
Ensure Docker is installed on your system. You can download it from the official [Docker website](https://www.docker.com/products/docker-desktop/)
### 1. Update Package Manager
Ensure your package manager is up to date:
```bash
sudo apt-get update  # For Ubuntu/Debian
sudo yum update      # For CentOS/Fedora
```

### 2. Install Dependencies
```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release  # For Ubuntu/Debian
sudo yum install -y \
    yum-utils \
    device-mapper-persistent-data \
    lvm2  # For CentOS/Fedora
```
### 3. Add Docker Repository Key
```
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
### 4. Add Docker Repository
```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
### 5. Install Docker Engine
```
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io  # For Ubuntu/Debian
sudo yum install docker-ce docker-ce-cli containerd.io       # For CentOS/Fedora
```
### 6. Verify Installation
```
sudo docker run hello-world
```
### 7. Manage Docker as a Non-root User (Optional)
```
sudo usermod -aG docker $USER
```

### build a ready made image 
  ```
  # pull image of nginx
  docker pull nginx
  ```
### run nginx image
  ``` # run the image
  docker nginx -d -p 8080:8080 --name mynginx nginx
  ```
`docker run` Command to run a container.
`-d` Runs the container in detached mode (in the background).
`-p 8080:80`: Maps port 8080 on your local machine to port 80 inside the container. This allows accessing Nginx from localhost:8080.
`--name mynginx`: Assigns a name "mynginx" to your container.
`nginx`: The name of the image to use for creating the container.
## Steps to create volumes 

`docker volume create my_volume`
Replace my_volume with the desired name for your volume. This command will create a Docker volume with the specified name.
`docker volume ls`
You should see your newly created volume in the list.


## Use the Volume in a Container
When running a container, you can specify the volume using the `-v` flag followed by the volume name and the path where it should be mounted inside the container.

For example, to run a container using the nginx image and mount the `my_volume` volume to the `/usr/share/nginx/html` directory within the container, you can use the following command:
`docker run -d -v my_volume:/usr/share/nginx/html --name my_nginx nginx`
This command will start a container using the Nginx image and link the specified volume to the `/usr/share/nginx/html` directory in the container. Any data written to that directory in the container will be stored in the `my_volume` volume on your host machine.

Remember, volumes persist data even if the container is removed, making them useful for storing and sharing persistent data between containers.

## Create a Custom Network
`docker network create my_network`
Replace my_network with your desired network name.

### Run Containers on the Custom Network
To run containers on the created network, use the --network flag followed by the network name when starting a container.

For example, let's say you have two containers - nginx1 and nginx2 - and you want them to communicate on the my_network network. You can start these containers on the same network using the following commands:

##### Start `nginx1` container on the network
` docker run -d --network my_network --name nginx1 nginx`
Start `nginx2` container on the same network:
` docker run -d --network my_network --name nginx2 nginx` 
Now both ` nginx1`  and ` nginx2`  are connected to the my_network network.
##### Verify Connectivity
Containers on the same network can communicate with each other using their container names as hostnames. To test connectivity, you can access one container from another using its hostname within the network.

For example, if you want to access `nginx1` from `nginx2`, you can do so using:
`docker exec -it nginx2 ping nginx1`

# MANDATORY PART
### nginx
NGINX (pronounced "engine-x") is a popular open-source web server, reverse proxy server, and load balancer. Originally created to solve the C10k problem (handling 10,000+ simultaneous connections), NGINX is known for its high performance, stability, and efficiency in handling concurrent connections.

It's commonly used to serve web content, host applications, and manage traffic within a network. NGINX's architecture is event-driven and asynchronous, making it capable of handling a large number of requests efficiently. Its versatility also extends to serving as a reverse proxy, directing client requests to appropriate backend servers, and as a load balancer to distribute incoming traffic across multiple servers.

NGINX is favored for its lightweight nature, low resource consumption, and ability to handle tasks like serving static content, caching, SSL termination, and more, making it a valuable tool in modern web infrastructure
#### TLS 
TLS (Transport Layer Security) in Nginx refers to the protocol used to secure communication between a client (like a web browser) and the server. It ensures that the data transmitted between them remains encrypted and secure, preventing eavesdropping or tampering.

In Nginx, TLS is implemented through SSL/TLS protocols, which encrypt the data and establish a secure connection. Nginx can be configured to handle TLS by setting up SSL certificates, specifying encryption algorithms, enabling security features like Perfect Forward Secrecy (PFS), and managing various security parameters to enhance the security of the communication.

Configuring TLS in Nginx involves setting up SSL certificates, defining protocols and ciphers, and managing other security-related settings in the server block configuration. This ensures that the server communicates securely with clients over HTTPS, providing data confidentiality and integrity.

#### 1. pull debian or alpine (use the penultimate stable version)
```Dockerfile
FROM debian:bullseye
```
#### 2. update the packages and install it
```Dockerfile
RUN apt-get update && apt install -y nginx && apt install openssl
```
#### 3. copy the config file from your host machine to the container
```Dockerfile
COPY /conf/nginx.conf /etc/nginx/nginx.conf
```
#### 4. run to container in forgound not in background
```Dockerfile
CMD ["nginx"]
```
#### config file 
```
user www-data;
daemon off;

events
{
}

http
{
	include mime.types;
	server {
		listen 443 ssl default_server;
		listen [::]:443 ssl default_server;

		ssl_certificate /etc/nginx/ssl/cert.crt;
		ssl_certificate_key /etc/nginx/ssl/cert.key;

		ssl_protocols TLSv1.2;
		ssl_ciphers 'TLS_AES_128_GCM_SHA256:TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384';
		ssl_prefer_server_ciphers off;


		root /var/www/html;

		index index.php index.html index.htm index.nginx-debian.html;

		server_name adardour.42.fr;

		location / {

			try_files $uri $uri/ /index.php?$args;
		}

		location ~ \.php$ {
			fastcgi_split_path_info ^(.+\.php)(/.+)$;
			fastcgi_pass wordpress:9000; 
			fastcgi_index index.php;
			include fastcgi_params;
			fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
			fastcgi_param SCRIPT_NAME $fastcgi_script_name;
		}
		location ~* \.(css|js)$ {
			access_log off;
			expires max;
		}

		location /adminer {
			include proxy_params;
    		proxy_pass http://adminer:8000;
    	}
		location /boom {
			include proxy_params;
    		proxy_pass http://boom:3000;
    	}
		location ~ /\.ht {
			deny all;
		}
	}
}
```

## Running Nginx in Foreground Mode for Logging
If you want to keep track of all logs within your container and run Nginx in foreground mode, you have two options:

#### 1. Modify the Nginx Configuration File
In your Nginx configuration file (usually nginx.conf), add the line `daemon off;` to keep Nginx running in the foreground. Remove this line if it's already present.
#### 2. Using Docker CMD
Alternatively, you can run Nginx with the `-g "daemon off;"` argument using Docker's CMD in your Dockerfile. This command starts Nginx in foreground mode.
`CMD ["nginx", "-g", "daemon off;"]`

## install ssl 
inside your tools directery create a file with extention `.sh` cause we want to execute it while the container is running
add this line to the file `openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/cert.key -out /etc/nginx/ssl/cert.crt -subj "/C=MA/ST=State/L=kh/O=Organization/OU=Organizational Unit/CN=adardour"`
That line is a command used with OpenSSL, a tool for generating SSL certificates.
`openssl`: This is the command itself, invoking the OpenSSL tool.
`req`: This subcommand is used for certificate requests and management.
`-x509`: This flag specifies that a self-signed certificate will be generated rather than a certificate signing request (CSR).
`-nodes`: This flag indicates that the private key shouldn't be encrypted with a passphrase. This means that if someone gets access to the key, they can use it without needing a password.
`-days` 365: This sets the expiration period for the certificate. In this case, it's set to 365 days, meaning the certificate will be valid for one year.
`-newkey rsa:2048`: This part instructs OpenSSL to generate a new RSA key pair with a key size of 2048 bits.
`-keyout /etc/nginx/ssl/cert.key`: Here, it specifies the output file where the generated private key (cert.key) will be saved. This path is /etc/nginx/ssl/, so the key file will be saved in that directory.
`-out /etc/nginx/ssl/cert.crt`: This specifies the output file for the self-signed certificate (cert.crt). It will also be saved in the /etc/nginx/ssl/ directory.
`-subj "/C=MA/ST=State/L=kh/O=Organization/OU=Organizational Unit/CN=username"`: This part sets the subject of the certificate. It contains information about the entity the certificate is being issued for. Here's what each abbreviation stands for:
`/C=MA`: Country code (C) is set to Morocco (MA is the ISO 3166-1 alpha-2 country code for Morocco).
`/ST=State`: State or province name (ST) is set to a placeholder value ("State").
`/L=kh`: Locality or city name (L) is set to "kh" (which might be a placeholder, typically this would be the city name).
`/O=Organization`: Organization name (O) is set to "Organization" (another placeholder).
`/OU=Organizational Unit`: Organizational unit name (OU) is set to "Organizational Unit" (yet another placeholder).
`/CN=username`: Common Name (CN) is set to "adardour". Commonly, this would be the domain name of the entity the certificate is being issued for (e.g., example.com).

##### after that add this lines to your Dockerfile
```Dockerfile
RUN mkdir -p /etc/nginx/ssl
```
```Dockerfile
COPY /tools/script.sh . 
```
```Dockerfile
RUN chmod +x ./script.sh \
```
```Dockerfile
RUN ./script.sh
```
# Run the container 
```bash
docker build -t nginx .
```
`-t` for giving tagname to the image, `.` the dot is for where your Dockfile file is located
```bash
docker -d -p 443:443 --name nginx nginx
```
### php-fpm + wordpress
PHP-FPM (PHP FastCGI Process Manager) is a highly efficient and flexible PHP FastCGI (Common Gateway Interface) implementation. It's a process manager used to manage PHP processes in a web server environment to handle PHP requests.

Traditionally, web servers like Apache used to embed PHP interpreter modules directly into their processes, which could sometimes lead to inefficiencies in handling PHP requests. PHP-FPM, on the other hand, separates the PHP processing from the web server, allowing for better resource management and scalability.

It works by creating a pool of PHP worker processes that can handle incoming PHP requests. These processes are managed by PHP-FPM based on configuration settings like the number of child processes, handling of requests, timeouts, and more.

PHP-FPM improves server performance by:

Efficient Process Management: It manages PHP processes separately, allowing better control over their lifecycle and resources.

Customizable Configuration: Administrators can configure settings like the number of child processes, process priorities, and resource allocation based on server requirements.

Isolation: By separating PHP handling from the web server, it helps in isolating potential issues, enhancing security and stability.

PHP-FPM is commonly used in conjunction with web servers like Nginx, Apache, or other FastCGI-compatible web servers to handle PHP requests efficiently in a production environment.

again pull the debian using keyword `FROM`
install php+fpm + download wp-cli for downloading wordpress
```
RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    gnupg \
    lsb-release \
    wget \
    unzip \
    git

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN apt-get update && apt-get install -y \
    php7.4-fpm \
    php7.4-common \
    php7.4-cli \
    php7.4-curl \
    php7.4-gd \
    php7.4-json \
    php7.4-mbstring \
    php7.4-mysql \
    php7.4-xml \
    php7.4-zip \
    default-mysql-client \
    php7.4-redis

RUN mkdir -p  /run/php

RUN chown www-data:www-data /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html

RUN chmod -R 755 /var/www/html

COPY ./conf/wp_conf.php .

COPY ./tools/script.sh .

RUN chmod +x ./script.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN  chmod +x wp-cli.phar

RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

CMD ["./script.sh"]
```
in your www.conf config file change line 36 to this line `listen = 9000`
This configuration is crucial when you're setting up PHP-FPM to work with a web server (like Nginx or Apache) in a containerized environment. The web server communicates with PHP-FPM through this port (9000 in this case) to process PHP files and generate dynamic content for WordPress

# Download wordpress and install it automaticlly
```bash
wp core download --allow-root
wp core install \
    --url="${URL}" \
    --title="${TITTLE}" \
    --admin_user="${MYSQL_USER}" \
    --admin_password="${MYSQL_PASSWORD}" \
    --admin_email="${EMAIL}" \
    --skip-email \
    --allow-root
```
# generate wp-config.php file using wp-cli
```bash
$ wp config create --dbname="${DATABASES_NAME}" --dbuser="${USER}" --dbpass="${USER_PASSWORD}" --dbhost="${HOST}"
# in dbhost you can use the name of container mariadb in this case --dbhost="mariadb"
Success: Generated 'wp-config.php' file.

# Enable WP_DEBUG and WP_DEBUG_LOG
$ wp config create --dbname=testing --dbuser=wp --dbpass=securepswd --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
PHP
Success: Generated 'wp-config.php' file.

# Avoid disclosing password to bash history by reading from password.txt
# Using --prompt=dbpass will prompt for the 'dbpass' argument
$ wp config create --dbname=testing --dbuser=wp --prompt=dbpass < password.txt
Success: Generated 'wp-config.php' file.
```
# Running php in forgound
```bash
php-fpm7.4 -F
```
# Build and run the container
```bash
docker build -t wordpress .
```
```bash
docker run -d -p 9000:9000 --name wordpress
```
# Mariadb
Install MariaDB in your virtual machine without using Docker. Navigate to `/etc/mysql/mariadb.conf.d` and look for a file named `50-server.cnf`, then copy it inside your project. This file contains all the configurations necessary for MariaDB to run. However, you'll need to modify one setting in your `50-server.cnf` config file. Change line 27 to read as follows: `bind-address = 0.0.0.0`. This change will allow it to listen to all incoming requests, including requests from all IP addresses.

```Dockerfile
FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/log/mysql/

RUN chmod -R 777 /var/log/mysql/

COPY ./tools/script.sh .
COPY ./tools/init.sql .

RUN chmod +x ./script.sh

CMD ["./script.sh"]
```
again in your 50-server.cnf config file change line 27 to this line `bind-address  = 0.0.0.0` to make listen to all incoming request i mean including all ip addresses
