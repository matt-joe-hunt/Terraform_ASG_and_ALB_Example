output "asg_sg" {
    value = aws_security_group.asg_sg.id
    description = "Id of the Security Group created in this module for the ASG"
}

output "alb_sg" {
    value = aws_security_group.alb_sg.id
    description = "Id of the Security Group created in this module for the ALB"
}