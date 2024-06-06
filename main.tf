variable "GroupId_1" {}
variable "Description_1" {}
variable "GroupId_2" {}
variable "Description_2" {}
variable "GroupId_3" {}
variable "Description_3" {}
variable "GroupId_4" {}
variable "Description_4" {}
variable "GroupId_5" {}
variable "Description_5" {}
variable "GroupId_6" {}
variable "Description_6" {}

resource "aws_security_group" "sg" {
  count       = 6
  name        = var["GroupId_${count.index + 1}"]
  description = var["Description_${count.index + 1}"]

  # Add any additional security group rules or configurations here
}

output "security_groups" {
  value = [
    { id = 1, GroupId = var.GroupId_1, Description = var.Description_1 },
    { id = 2, GroupId = var.GroupId_2, Description = var.Description_2 },
    { id = 3, GroupId = var.GroupId_3, Description = var.Description_3 },
    { id = 3, GroupId = var.GroupId_4, Description = var.Description_4 },
    { id = 3, GroupId = var.GroupId_5, Description = var.Description_5 },
    { id = 3, GroupId = var.GroupId_6, Description = var.Description_6 }
  ]
}