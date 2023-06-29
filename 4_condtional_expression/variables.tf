variable "istest" {
  type = bool
  default = true
  
}

variable "instance_name" {
    type = list(string)
    default = [ "dev", "prod" ]
}

variable "image_id" {
    type = string
    default = "ami-057752b3f1d6c4d6c"
}