variable "region-challenge1" {
  description = "Deployment VPC region in AWS"
  type        = string
  default     = "us-east-1"
}

variable "workload" {
  description = ""
  type        = string
  default     = "challenge-1"
}

variable "environment" {
  description = ""
  type        = string
  default     = "development"
}

variable "owner" {
  description = ""
  type        = string
  default     = "Andres Mauricio Sanchez Gonzalez"
}

variable "availability-zone-challenge1" {
  description = "Availability zones to chellenge 1"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "default-CIDR-challenge1" {
  description = "Default CIDR value"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public-CIDR-subnets-challenge1" {
  description = "CIDR values for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/26", "10.0.1.64/26"]
}

variable "private-CIDR-subnets-challenge1" {
  description = "CIDR values for private subnets"
  type        = list(string)
  default     = ["10.0.1.128/26", "10.0.1.192/26"]
}

variable "sg-public-ingress-rules-challenge1" {
  description = "Ingress rules definitions challenge1"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_block  = string
    description = string
  }))
  default = [{
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_block  = "0.0.0.0/0"
    description = "ssh access to public subnet ec2 instances"
    },
    {
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_block  = "0.0.0.0/0"
      description = "Plain http"
    },
    {
      from_port   = 8
      to_port     = 0
      protocol    = "icmp"
      cidr_block  = "10.0.1.0/26"
      description = "Allow ping from public subnet"
    }
  ]
}

variable "ec2-type-challenge1" {
  description = "ec2 instance type to deploy ec2 instances"
  type        = string
  default     = "t2.micro"
}

variable "ec2-ami-challenge1" {
  description = "ami to set to every ec2 instances"
  type        = string
  default     = "ami-08c40ec9ead489470"
}

variable "enabled" {
  description = ""
  type        = string
  default     = true
}

variable "key-spec" {
  description = ""
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}

variable "rotation-enabled" {
  description = ""
  type        = string
  default     = true
}

variable "alias" {
  description = ""
  type        = string
  default     = "kms-challenge1"
}