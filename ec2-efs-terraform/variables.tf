variable "ami" {
    description = "Image ID used to launch the EC2 instance"
}

variable "instance_type" {
    description = "The instance size to be launched"
}

variable "subnet" {
    description = "Subnet ID of the instance and EFS"
}

variable "key" {
    description = "The key name to be used for the instance"
}

variable "security_groups" {
    description = "Security Groups of the instance and EFS"
    type = list
}

variable "mount_dir" {
    description = "Directory where to mount the EFS into the EC2 instance"
    type = string
    default = "/mnt/efs"
}

variable "region" {
    description = "AWS Region for the instance and EFS"
}

variable "enable_efs" {
    description = "Variable used to logically handle the use (or not) of EFS persistence on the EC2 Instance"
}

variable "instance_name" {
    description = "Name tag value to assign to the EC2 Instance"
}

variable "fs_name" {
    description = "Name tag value to assign to the EFS File System"
    type = string
    default = "YOUR-EFS"
}

variable "fs_perf_mode" {
    description = "Performance Mode to assign to the EFS File System"
    type = string
    default = "generalPurpose"
}
