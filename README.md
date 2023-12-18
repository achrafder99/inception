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
#### nginx
NGINX (pronounced "engine-x") is a popular open-source web server, reverse proxy server, and load balancer. Originally created to solve the C10k problem (handling 10,000+ simultaneous connections), NGINX is known for its high performance, stability, and efficiency in handling concurrent connections.

It's commonly used to serve web content, host applications, and manage traffic within a network. NGINX's architecture is event-driven and asynchronous, making it capable of handling a large number of requests efficiently. Its versatility also extends to serving as a reverse proxy, directing client requests to appropriate backend servers, and as a load balancer to distribute incoming traffic across multiple servers.

NGINX is favored for its lightweight nature, low resource consumption, and ability to handle tasks like serving static content, caching, SSL termination, and more, making it a valuable tool in modern web infrastructure
#### TLS 
TLS (Transport Layer Security) in Nginx refers to the protocol used to secure communication between a client (like a web browser) and the server. It ensures that the data transmitted between them remains encrypted and secure, preventing eavesdropping or tampering.

In Nginx, TLS is implemented through SSL/TLS protocols, which encrypt the data and establish a secure connection. Nginx can be configured to handle TLS by setting up SSL certificates, specifying encryption algorithms, enabling security features like Perfect Forward Secrecy (PFS), and managing various security parameters to enhance the security of the communication.

Configuring TLS in Nginx involves setting up SSL certificates, defining protocols and ciphers, and managing other security-related settings in the server block configuration. This ensures that the server communicates securely with clients over HTTPS, providing data confidentiality and integrity.

#### 1. pull debian or alpine (use the penultimate stable version)
`FROM DEBIAN:bullseye`
#### 2. update the packages and install it
`RUN apt-get update && apt-get install nginx -y`
#### 3. copy the config file from your host machine to the container
`COPY /conf/nginx.conf /etc/nginx/nginx.conf`
#### 4. run to container in forgound not in background
`CMD ["nginx"]`

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
	}}}
