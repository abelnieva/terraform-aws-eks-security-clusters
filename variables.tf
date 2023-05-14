variable "managed_node_groups" {
  type        = map(any)
  description = <<EOF
Node groups configuration
example
  {
    node_group_b = {}
    node_group_a = {
      min_size     = 1
      max_size     = 10
      desired_size = 1

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"

      update_config = {
        max_unavailable_percentage = 33 # or set `max_unavailable`
      }

      tags = {
        ExtraTag = "example"
      }
    }
  }
EOF


}



/* variable "github_repo" {
  type        = string
  description = "Git repo url"
  default     = "https://github.com/abelnieva/eks-security-framework"
} */

variable "cluster_name" {
  type        = string
  description = "Cluster Name"
}
variable "cluster_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.23`)"
  type        = string
  default     = "1.23"
}

variable "region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

#-------------------------------
# EKS Cluster Security Groups
#-------------------------------
variable "cluster_security_group_additional_rules" {
  description = "List of additional security group rules to add to the cluster security group created. Set `source_node_security_group = true` inside rules to set the `node_security_group` as source"
  type        = any
  default     = {}
}


variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR, this parameter is needed to create the VPC"
}

variable "cluster_endpoint_public_access" {
  type        = bool
  description = "Indicates whether or not the EKS public API server endpoint is enabled. Default to EKS resource and it is true"
  default     = false
}

variable "cluster_endpoint_private_access" {
  type        = bool
  description = "Indicates whether or not the EKS private API server endpoint is enabled. Default to EKS resource and it is false"
  default     = true
}


variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
variable "cluster_enabled_log_types" {
  type        = list(string)
  description = "A list of the desired control plane logging to enable"
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "tags" {
  description = "default tags"
  type        = map(any)
  default     = {}
}


variable "dev_teams" {
  description = "dev teams"
  type        = map(any)
  default     = {}
}


variable "repo_apps_url" {
  description = "Repositorio de las aplicaciones "
  type        = string
  default     = "https://github.com/abelnieva/eks-security-framework-apps.git"
}

variable "repo_apps_path" {
  description = "Path en el repositorio de las aplicaciones "
  type        = string
  default     = "./"

}

/*
variable "repo_base_url" {
  description = "Repositorio de configuración base dirección web "
  type        = string
  default     = "https://github.com/abelnieva/eks-security-framework-base.git"
}

variable "repo_base_path" {
  description = "Path en el repositorio de configuración base"
  type        = string
  default     = "./"

} */

variable "ecr_repos_list" {
  description = "Path en el repositorio de configuración base"
  type        = list(any)
  default     = []

}

variable "dns_zones" {
  description = "list of dns zones to be managed by cluster"
  type        = list(any)
  default     = []
}


variable "kubescape_account_id" {
  description = "kubescape account ID"
  type        = string
  default     = ""
}