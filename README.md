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
- ![image](https://github.com/JonesKwameOsei/Terraform-Docker-Nginx/assets/81886509/7496bfde-eed0-4619-88e8-49f921a26539)<p>
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

