variable "usernumber" {
  type = number
}

variable "elb_name" {
  type = string
}

variable "iamuserlist" {
  type    = list(any)
  default = ["Vasu", "Vasudha", "Venu", "Venu"]
}

variable "timeout" {
  type = number

}

variable "istest" {}

