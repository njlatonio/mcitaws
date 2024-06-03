variable "aws_access_key"{
}
variable "aws_secret_access_key"{
}

variable "aws_region" {
    description = "Region in which AWS Resources to be created"
    type = string
    default ="us-east-1"
}
variable "instance_type"{
    description="EC2 Instance type"
    type =string
    default="t3.micro"
}

variable "db_username"{
}
variable "db_password"{
}
