resource "aws_instance""myec2m"{
    ami=data.aws_ami.amz_linux2.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.vpc-ssh.id,aws_security_group.vpc-web.id]
    count = 2
    tags = {
        name="count-demo-${count.index}"
    }
}
