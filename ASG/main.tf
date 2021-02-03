data "aws_ssm_parameter" "linuxAmi" {
  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_launch_template" "template" {
  name_prefix   = "template"
  image_id      = data.aws_ssm_parameter.linuxAmi.value
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.asg_sg]
}

resource "aws_autoscaling_group" "asg" {
  availability_zones = ["eu-west-1a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = aws_launch_template.template.id
    version = "$Latest"
  }
}