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

The Scenario: We will use Nginx server to host Arcana(html5) web app and emulete it to a docker container and push it to a container registery (docker hub). We need Nginx installed to our machine and we need the code that builds our image (dockerfile)
1- We install Docker to our Local Machine https://www.docker.com/products/docker-desktop/

2- DockerDesktop we pull Nginx image to our local : - docker pull nginx

3- We create a container with using docker desktop (or you can use given commands below) https://thispointer.com/how-to-create-run-a-docker-container-from-an-image/
    && docker images
    && docker ps
    && docker run my-app:1.0 {write image name or id} / && docker run -it centos {i:interactive to keep stdin open, t: allocate a terminal
    && docker stop 
    && docker rm / rmi
    && docker build -t my-app:1.0 . {build an image named my-app tag:1.0 "." for adding all files}
    && docker exec -it {docker-id} /bin/sh {or /bin/bash} : get in the container/vm

4- We clone Arcana from https://github.com/zce/html5up repo to our local machine.

5- In Arcana folder we create a Dockerfile
    && FROM nginx:latest                          #we will edit this running Nginx image
    && WORKDIR /app                               #we specify our working dir in container
    && COPY . ./                                  #copy everything into the current current directory of the container
    && RUN rm /usr/share/nginx/html/index.html    #we replace Arcane index.html with standart Nginx index.html file.
    && RUN mv index.html /usr/share/nginx/html    #
    && COPY . /usr/share/nginx/html               #We copy all other objects(banners, CSS, javascriptfiles etc)
    && RUN service nginx restart
    && ENTRYPOINT ["nginx", "-g", "daemon off;"]  #run ngnix server background

6- Build the image : && docker build -t arcana:dev .

7- Goto DockeGunb and create a repo(that repo creates push image code)

8- Login docker via terminal in local : & docker login {enter credentials)

9- Add a tag to your image && docker tag {image ID/name} dhemir/arcana:lts

10- Push your tagged image && docker push dhemir/arcana:lts

The Scenario-2: We will setup in AzureDevOps a Pipeline that automates this creating Arcana container.

1- Create a new repo in Azure : Arcana and clone it to our local

2- Copy all Arcana files to this local folder.

3- Push all these files to repo in main branch.

4- Create(or run) your AgentVM in AzurePortal && cd myagent && ./run.sh {run the agent)

5- Check your Agent from the list ProjectSettings > AgentPools {demo agent running}

6- Goto VsCode and create a new branch && git checkout -b features/pipeline

7- in Features branch create a new file .azuredevops/pipeline.yml and push to AzureRepo.
https://github.com/bfsabah/Nginx-Docker-Azure-CICD/blob/6442e201a587be786e5700f9220362fa28e0dc27/pipeline.yml#L1-L47

8- AzureDevOps > Create a new PipeLine >select Azure Repos >select Arcana Repo >select Existing Azure Pipelines YAML file.

9- pipeline.yml file automatically appears in screen. You can edit, save and RUN pipeline from here.

10- You can use build agent to edit your pipeline.yml

11- Goto AgentVm and install Docker in it. (do not forget to add user to dockergroup in AgentVM)

12- Come back to Pipeline, we have to fill Container Registry ( ProjectSettings > Service Connections> CreateNew > DockerHub

13: https://index.docker.io/v1/ - DockerUsername - DockerPassword - docker credentials

14- Come back to Pipelines and fill the Container Credentials.

15- As tags we use : $(Build.BuildId) for Automatically create Semantic Versioning.
