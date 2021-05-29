provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "master" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"
  key_name = "awskey2"
  vpc_security_group_ids = ["sg-00e7a07b110e973b5"]


}


resource "null_resource" "setup_master1242" {
provisioner "local-exec" {
    command ="/bin/bash /root/terrafom/ss.sh ${aws_instance.sagar.public_ip} awskey2.pem "

 }
provisioner "local-exec" {
    command = "/usr/local/bin/ansible-playbook master.yml"
}
}
