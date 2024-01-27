provider "aws" {
    region = "ap-south-1"
   access_key = "AKIAW3MEFODSCWT5SFT2"
   secret_key = "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" 
}


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

