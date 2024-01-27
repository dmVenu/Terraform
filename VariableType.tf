

resource "aws_instance" "dev" {
   ami = "ami-00952f27cf14db9cd"
   instance_type = "t2.micro"
   key_name = "Terraformkeys"
  
  connection {
   type = "ssh"
   user = "ec2-user"
   private_key = file("./Terraformkeys.pem")
   host = self.public_ip
  }

  provisioner "remote-exec" {
   inline = [ 
      "sudo amazon-linux-extras install ngnix1",
      "sudo systemctl start ngnix" ]
  }
}

