# Provisioning an Nginx server with Terraform
## Overview of Project
This exercise is to utilise **terraform** to provision an **nginx server**. Nginx server can be provisioned on Mac, Windows, or Linux. For this exercise, we will provision the nginx server on Windows. <p>
### Pre-requisite 
Running this exercise on Windows 11, Mac, or Linux is a straightforward approach. However, running this on Windows 10 machine is not. One needs to use the [Windows Subsystem for Linux (WSL2)](https://docs.microsoft.com/en-us/windows/wsl/install-win10) before starting this exercise.<p>
## Install and Start Docker
We will have to [install docker for Windows](https://docs.docker.com/docker-for-windows/install), start the Docker Desktop. To start the Docker app:
- Search for Docker Desktop in the search results or Start menu.<p>
![image](https://github.com/JonesKwameOsei/Terraform-Docker-Nginx/assets/81886509/18658e53-4265-4b25-a7fa-e7e3e20f7742)
- Open Docker: Click on the **open icon** to open Docker. Here, the **Whale icon** in the status bar stays steady indicating Docker Desktop is up-and-running. <p>
![image](https://github.com/JonesKwameOsei/Terraform-Docker-Nginx/assets/81886509/7496bfde-eed0-4619-88e8-49f921a26539) <p>
**NB**: For other operating systems, install **Docker Engine** for [Linux distro](https://docs.docker.com/engine/install/) and Docker [Destop for Mac](https://docs.docker.com/docker-for-mac/install/) to follow this project. To start Docker on Mac, run:
```
open -a Docker
```
### Create a Working Directorory
We will create a directory to house the congirations for the infrastructure that we will want **Terraform** to create and manage for us. This is an important step because, **Terraform** leverages this directory to store required **plugins**, **modules** and information about the infrastructure it will create when the configuration is initialised amd applied. Feel free to name your directory any name tou want. We will create the directory with the command, mkdir. 

```
mkdir learn-terraform-docker-container
```
run, ls, to ensure the directory has been created. 
```
ls
```
![image](https://github.com/JonesKwameOsei/Terraform-Docker-Nginx/assets/81886509/f07582e9-6be0-4249-8837-f0a6636efc7e)<p>
Now, we will navigate into the the working directory by running:
```
cd learn-terraform-docker-container
```
### Create Terraform Configuration Files
1. In the working directory, we will create the first configuration file called **provider.tf**. This configuration entails the specified provider, in this case **Docker**. A provider is simply **a plugin** thet **Terraform** uses to create and manage resources. The docker provider is configured below:
```
# Setting a docker provider plugin for Terraform
//-----------------------------------------------

terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}
```
2. Next, we will create a variable configuration with a file named **variables.tf**. In order not to hard-code the values of the resources, we can include variables to make the configuration more flexible. **Terraform variables** also enables configuration to be re-usable and adds a layer of security to some sensitive information.
```
# Setting variables for the container and image name; ports to be run on
//-----------------------------------------------------------------------

variable "container_name" {
    description = "The name of the Docker container."
    type = string
    default     = "tutorial-app"
}

variable "image_name" {
    description = "The name of the Docker Image"
    type = string
    default = "nginx"
}

variable "internal_port" {
    description = "The port that application is listening on internally."
    type = number
    default = 80
}

variable "external_port" {
    description = "The port that the application is listening on external."
    type = number
    default = 8080
}
```
3. Create **main.tf** configuration file: This file encapsulates the components of the infrastructure to be built.
```
# Defining the components for the Docker
//--------------------------------------

resource "docker_image" "nginx" {
    name = var.image_name
    keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name = var.container_name

  ports {
    internal = var.internal_port
    external = var.external_port
  }
}
```
4. Finally, we will create **an output** file: This file is used to present useful information. We can also utilise the **Terraform outputs** to connect the project with other parts of the infrastructure, or with other **Terraform projects**.<p>
**NB**: In a production environment, we can replace a sensitive credential orinformation with the **sensitive flag**.
```
# Adding configurations to define outputs for the docker container and the container image
//----------------------------------------------------------------------------------------

output "container_id" {
    description = "The ID of the Docker container."
    value = docker_container.nginx.id
}

output "image_id" {
    description = "The ID of the Docker image."
    value = docker_image.nginx.id
}
```
![image](https://github.com/JonesKwameOsei/Terraform-Docker-Nginx/assets/81886509/b7aee776-5c8d-4a91-97eb-5741149f06cd) <p>

### Initialise the Terraform Configuration
Here, we will initialise the project, which will enable **Terraform** download a plugin that allows **Terraform** communicate with **Docker**. Before we initialise the configuration, let us confirm the files in the working directory to be compared with the files after initialisation by running:
```
ls
```
![image](https://github.com/JonesKwameOsei/Terraform-Docker-Nginx/assets/81886509/800570b0-437c-4dc8-887b-104f7856c7ac) <p>

To initialise, run:
```
terraform init
```
Since the plugins are in hidden files in the directory, we will run:
```
ls -a
```
![image](https://github.com/JonesKwameOsei/Terraform-Docker-Nginx/assets/81886509/b43ac648-83be-496e-856a-6cc64dbda636) <p>



