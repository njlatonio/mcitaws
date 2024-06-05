resource "aws_instance""myec2m"{
    ami=data.aws_ami.amz_linux2.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id]
    count = 2
    tags = {
        name="count-demo-${count.index}"
    }
}

# Creating an ec2 instance via yaml
locals{
  ec2instance = yamldecode(file("${path.module}/ec2instancefolder"))
  ec2instance_list = [
    for value in local.ec2instance: {
        name=value.name
        instance_type=value.instance_type
      }
    ]
}

resource "aws_instance""ec2instance_example"{
    for_each = { for value in local.ec2instance_list: value.name => value }
    ami=data.aws_ami.amz_linux2.id
    instance_type = each.value.instance_type
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id]
    tags = {
        name=each.value.name
    }
}
