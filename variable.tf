variable "sg_port" {
  description = "Port traffic enable"
  type = list(string)
  default = [22,80,443]
}
