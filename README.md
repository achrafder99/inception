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

``dockerfile
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
CMD ["node", "app.js"]``
