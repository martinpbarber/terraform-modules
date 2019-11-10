module "instance" {
    source = "../../../../modules/aws/ec2/instance"

    ami_id        = data.aws_ami.ami.id
    instance_type = "t2.micro"

    name = var.name
}

data "aws_ami" "ami" {
    most_recent = true
    owners      = ["099720109477"] # Canonical

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name   = "architecture"
        values = ["x86_64"]
    }

    filter {
        name   = "image-type"
        values = ["machine"]
    }

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }
}
