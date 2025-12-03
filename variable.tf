variable "ami" {
  description = "Amazon machine image"
  type = string
  default = "ami-0e58b56aa4d64231b"
}

variable "type" {
  description = "Instance type"
  type = string
  default = "t2.micro"
}

variable "key" {
  description = "Secure remote access"
  type = string
  default = "jill1"
}
variable "sg_port" {
  description = "Port traffic enable"
  type = list(string)
  default = [22,80,443]
}
