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
  ec2instance = yamldecode(file("${path.module}/ec2instancefolder/ec2-instance.yaml"))
  ec2instance_list = [
    for value in local.ec2instance.ec2instanceconfiguration: {
        name=value.tagname
        instance_type=value.instancetype
      }
    ]
}

resource "aws_instance""ec2instance_example"{
    for_each = { for instance in local.ec2instance_list: "${instance.instancetype}" => instance }
    ami=data.aws_ami.amz_linux2.id
    instance_type = each.value.instancetype
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id]
    tags = {
        name=each.value.tagname
    }
}
