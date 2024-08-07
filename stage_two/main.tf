provider "aws" {
  region     = "us-east-1"
  access_key = var.accesskey
  secret_key = var.securitykey
 
}

resource "aws_security_group" "serv_secg" {
  name        = "serv_secg"
  description = "Security group for the EC2 instances"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "serv_secg"
  }
}


resource "aws_instance" "serverA1" {
  ami           = "ami-0cd59ecaf368e5ccf"
  security_groups = [aws_security_group.serv_secg.name]
  instance_type = "t2.micro"

  tags = {
    Name = "yolos1"
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.public_ip},' playbook.yml"
  }
}

resource "aws_instance" "serverB2" {
  ami           = "ami-0cd59ecaf368e5ccf"
  security_groups = [aws_security_group.serv_secg.name]
  instance_type = "t2.micro"

  tags = {
    Name = "yolos2"
  }

  provisioner "remote-exec" {
    inline= [
        "sudo apt-get update -y",
        "sudo apt-get install -y python3-pip",
        "sudo pip3 install ansible"
    ]

    connection {
        type        = "ssh"
        user        = "ubuntu"
        private_key = file(var.id_rsa)
        host        = self.public_ip
    }
  }
}

output "serverB2_ip" {
    value = aws_instance.serverB2.public_ip
}


