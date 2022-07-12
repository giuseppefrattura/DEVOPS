variable "user_names" {
    description = "nomi per utenti"
    type = list(string)
    default = [ "neo","trinity", "morpheus" ]
  
}

resource "aws_iam_user" "example" {
    name = var.user_names[count.index]
    #name = "neo.${count.index}"
    count = 3
}