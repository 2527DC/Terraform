data "aws_ami" "ubuntu_search" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output "ubuntu_search_ami_id" {
  value = data.aws_ami.ubuntu_search.id
}
