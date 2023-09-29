[![<shironguyen>](https://circleci.com/gh/thanh20080kg/udacity-cdoe-project-4.svg?style=svg)](<https://circleci.com/gh/thanh20080kg/udacity-cdoe-project-4>)

## Project Overview

In this project, I will apply the skills I have acquired in this course to operational a Machine Learning Microservice API. 

I am given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. Read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests the ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

The project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:
* Test the project code using linting
* Complete a Dockerfile to containerize this application
* Deploy your containerized application using Docker and make a prediction
* Improve the log statements in the source code for this application
* Configure Kubernetes and create a Kubernetes cluster
* Deploy a container using Kubernetes and make a prediction
* Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

* Create a virtualenv and activate it
* Run `sudo apt update` to fetch and update packages
* Run `sudo apt-get install python3.7` to install python3.7
* Run `sudo apt-get install python3.7-venv` to install python3.7 venv
* Run `sudo apt-get install python3-pip` to install pip
* Run `sudo apt install make` to install make
* Run `python3.7 -m venv ~/.devops` to create a new environment
* Run `source ~/.devops/bin/activate` to activate environment
* Run `make install` to install the necessary dependencies
* Run `make lint` (pylint app.py files and hadolint Dockerfile) to detect errors in the code.  
* can also run `make all` instead of previous two steps.  

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Run in Kubernetes:  `./run_kubernetes.sh`

### Kubernetes Steps

1. Setup and Configure Docker locally
    * install docker as described in the [link](https://docs.docker.com/engine/install/ubuntu/).
    * Run `./run_docker.sh`
    * Run `docker ps` to check if docker is running.
    * Run `./make_prediction.sh` to make prediction and copy/paste the logging info at terminal to `output_txt_files/docker_out.txt`
2. Setup and Configure Kubernetes locally
    * Run `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`
    * Run `sudo install minikube-linux-amd64 /usr/local/bin/minikube`
    * Run `minikube start` to start minikube
    * Run `kubectl get pods` to see which pods are running.
    * Run `./upload_docker.sh` to create image
    * Run `./run_kubernetes.sh`
    * Run `./make_prediction.sh` to make prediction and copy/paste the logging info at terminal to `output_txt_files/kubernetes_out.txt`
3. Create Flask app in Container
    * Run `./run_docker.sh` to build and start the Flask app container. 
    * Run `./upload_docker.sh` to upload the container to docker hub.   