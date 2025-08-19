variable "project" {
    default = "roboshop"
}

variable "environment" {
    default = "dev"
}

variable "zone_name" {
    type      = string
    default   = "sree84s.site"
    description = "description"
}

variable "zone_id" {
    type        = string
    default     = "Z0897598ZW3D3944XUN0"
    description = " description "
}
# variable "ami_id" {
#     type   = string
#     default = "ami-09c813fb71547fc4f"
#     description = "AMI ID of the EC2 instance"
# }