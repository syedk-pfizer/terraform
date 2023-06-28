variable "image_id" {
    type = string
    default = "ami-057752b3f1d6c4d6c"
}

variable "list_var" {
    type = list(string)
    default = [ "t2.micro", "t2.medium" ]

}

variable "map_var" {
    type = map(map(string))
    default = {
      "ap-south-1" = {
        "instancetype" = "t2.micro",
        "ami": "ami-057752b3f1d6c4d6c"
      },
      "us-west-1" = {
        "instancetype" = "t2.micro",
        "ami": "ami-057752b3f1d6c4d6c"
      }
    }
    
}