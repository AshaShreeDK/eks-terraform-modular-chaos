variable "cluster_name" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "keypair" {
  type = string
}

variable "name" {
  type = string
}

/* Public Node Group */

variable "public_nodes_capacity" {
  type = string
}

variable "public_nodes_type" {
  type = string
}

variable "public_nodes_min" {
  type = number
}

variable "public_nodes_max" {
  type = number
}

variable "public_nodes_des" {
  type = number
}

variable "public_nodes_labels" {
  type = map(string)
}

/* Private Node Group */

variable "private_nodes_capacity" {
  type = string
}

variable "private_nodes_type" {
  type = string
}

variable "private_nodes_min" {
  type = number
}

variable "private_nodes_max" {
  type = number
}

variable "private_nodes_des" {
  type = number
}

variable "private_nodes_labels" {
  type = map(string)
}

