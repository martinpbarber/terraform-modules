variable "cluster_name" {
    description = "Name of EKS cluster"
    type        = string
    default     = "eks"
}

variable "cluster_version" {
    description = "EKS cluster version"
    type        = string
    default     = "1.12"
}

variable "subnet_ids" {
    description = "EKS cluster subnets"
    type        = list(string)
    default     = ["subnet-8f24bdd4", "subnet-e834b68d"]
}
