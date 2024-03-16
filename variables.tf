# Setting variables for the container and image name; ports to be run on
//-----------------------------------------------------------------------

variable "container_name" {
    description = "The name of the Docker container."
    type = string
    default     = "tutorial-app"
}

variable "image_name" {
    description = "The name of the Docker Image"
    type = string
    default = "nginx"
}

variable "internal_port" {
    description = "The port that application is listening on internally."
    type = number
    default = 80
}

variable "external_port" {
    description = "The port that the application is listening on external."
    type = number
    default = 8000
}



