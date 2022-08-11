# python_webapp

**Setting up an Infrastructure**

Our main aim here is to set up an Infrastructure on a cloud provider using IaC tool.
In this case, I’ve used AWS as cloud provider, Terraform as IaC tool, AWS Cloudwatch as Monitoring tool, Docker for Python application containerization.

**DESCRIPTION**
•	We need to first Create EC2 Instance on AWS.

•	For an Instance to be created, we have to write Terraform files such as main.tf, securitygroup.tf, createinstance.tf, provider.tf, variables.tf, elb.tf, cloudwatch.tf. These files will contain our code that we want to create, supporting variables, inbound and outbound traffic, regions, load balancers, metric alarm.

•	Create an Access Key and Secret Key

    o	IAM>>Users>>Choose User name>>Security Credentials>>Click Create access key. An Access Key and Secret Key would be auto-generated. Save these in local machine for furture reference while launch of Instance.
    
•	Create a Key Pair (using ssh-keygen)

•	Using Terraform commands, launch an EC2 instance. Commands to be used are: terraform init, terraform plan, terraform validate, terraform apply.

•	On AWS, we can see that two instances will be automatically created.

**Connect the Linux instance:**
•	After launching instance: can connect to it and use it the way would need in local machine.

•	Before connecting to instance >>> get the public DNS name of the instance using the Amazon EC2 console>>>Select the instance and locate Public DNS.

•	Using SSH (Secure Shell) we can connect to the instance.

**Installations:**
1.	On each server, install git (If not already present).
2.	On each server, install Docker
3.	In order to install Python, Dockerfile has been written. (Dockerfiles enable you to create your own images. A Dockerfile describes the software that makes up an image. Dockerfiles contain a set of instructions that specify what environment to use and which commands to run).

**Conceptual Path**
•	requirements.txt file stores the dependencies and plugins, which is given in Dockerfile to run the application.

•	Backend functional coding can be seen in app.py file.

**In this case, I’ve run the give Python-Helloworld application using Dockerization.**

**Implementation**

•	Docker Build
docker image build -t manisharayudu12/python:0.0.1 .

•	Docker Run
docker run -d -p 8000:80 manisharayudu12/python:0.0.1

**Output**

The tool listens to the port 8000 and exposes a http endpoint and returns the docker containers running locally containing information from each container.
http://<your_server_public_DNS>:8000 OR Use: curl http://<your_server_public_DNS>:8000

Below, I’ve included the screenshot of my output.

![Output](https://user-images.githubusercontent.com/83665305/184226452-e14a6be2-5ee5-4e40-99fa-36e18bb55c13.jpeg)

![Output1](https://user-images.githubusercontent.com/83665305/184226560-543670f5-204b-4609-b7db-003548d5e1c0.jpeg)








