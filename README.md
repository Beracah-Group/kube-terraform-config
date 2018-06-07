# kube-terraform-config
Using Terraform to manage Kubernetes resources

In addition to explaining the benefits of using Terraform to manage Kubernetes resources versus the Kubernetes CLI, 
this post also walks through using new Kubernetes provider to interact with Kubernetes resources (pods, replication controllers, and services) 
and enabling operators to control the lifecycle of Kubernetes resources using infrastructure as code.

Why?

Terraform uses the same declarative syntax to provision the lower underlying infrastructure (compute, networking, and storage) and scheduling (application) layer.
Terraform provides full lifecycle management of Kubernetes resources including creation and deletion of pods, replication controllers, and services.
Unlike the kubectl CLI, Terraform will wait for services to become ready before creating dependent resources. e.g Terraform will wait until a service is provisioned so it can add the service's IP to a load balancer.

- The easiest way to configure the Kubernetes provider is to create a configuration file at ~/.kube/config. Terraform will automatically load that configuration during its run.
- create main.tf 
- Terraform init
- schedule a simple application
- provision a service
- Terraform plan
- Terraform apply
- use curl to verify app is running

UPDATING APP 
Over time the need to deploy a new version of your application comes up. The easiest way to perform an upgrade when you deploy a new version is to change image field in the config accordingly.
terraform plan
terraform apply
