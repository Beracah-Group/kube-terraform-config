# kube-terraform-config
Using Terraform to manage Kubernetes resources

In addition to explaining the benefits of using Terraform to manage Kubernetes resources versus the Kubernetes CLI, 
this post also walks through using new Kubernetes provider to interact with Kubernetes resources (pods, replication controllers, and services) 
and enabling operators to control the lifecycle of Kubernetes resources using infrastructure as code.

Why?

Terraform uses the same declarative syntax to provision the lower underlying infrastructure (compute, networking, and storage) and scheduling (application) layer.
Terraform provides full lifecycle management of Kubernetes resources including creation and deletion of pods, replication controllers, and services.
Unlike the kubectl CLI, Terraform will wait for services to become ready before creating dependent resources. e.g Terraform will wait until a service is provisioned so it can add the service's IP to a load balancer.
