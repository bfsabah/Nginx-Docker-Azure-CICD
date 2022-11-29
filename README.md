# Docker Introduction
- What is docker: Docker is a container runtime tool. 

- What is docker used for: Docker is used to containerize modern applications.

- What does containerization mean: Containerization is when you have an application and all of its run time dependecies.

setup inside of an encapsulated lightweight environment that allows for easy deployment, scalability and modifications.

- What is the difference between VM and container? Check this [diagram](https://medium.com/@venkinarayanan/containers-101-8c7562d0d7cd)
Container is more lightweight due to the fact that it requires less components and time to run an entire application versus a VM
that requires multiple different host OS's + binaries and libraries to run an application.

- Why is a container lightweight? Containers are lightweight because they only contain everything that is necessary for the 
application to run. It does not require any other components besides what is needed for the app to build / run.

- Ease of deployment when it comes to applications that are containerized versus bare metal applications: 
Containers can be easily shared amongst everyone --> public registries, private registries, local images etc.)

- Concept of container images: Containers are ran by using a container image, a container image is like a traditional AMI with VM's. Difference between vm images and container images are size --> vm ami's are heavy (more than a couple GB versus container images which are under 1GB)

- What is the point of using containers? The point of containers is to enable faster 
application development through these lightweight containers that house applications. Containers also give consistent results for 
the application runtime.

- How do containers get deployed? and where do they get deployed? A container is ran by a container image which means,
in order to deploy a container you must make an image out of the container. After the image is created, it is then stored
in a registry - (public or private registry). After the image is pushed to a container image registry, then we can take the image
and deploy it onto services such as EKS or AKS (elastic kubernetes services AWS or Azure Kubernetes Service AKS) / or even some
PaaS services on the cloud such as - (azure app service) .

## Installation
- [Windows](https://docs.docker.com/desktop/install/windows-install/)
- [MAC](https://docs.docker.com/desktop/install/mac-install/)


## Docker Documentation
- [documentation](https://docs.docker.com/engine/reference/builder/)

### Service Connection Setup
- Ensure you have made your own dockerhub account
- Ensure you already have docker installed on your own build agent
- [Follow these steps to create service connection](https://www.programmingwithwolfgang.com/build-docker-azure-devops-ci-pipeline/)
