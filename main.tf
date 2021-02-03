provider "aws" {
  region = var.region-master
}

module "ALB" {
  source = "./ALB"

  environment       = var.environment
  alb_sg            = module.SG.alb_sg
  public_subnetA_id = module.VPC.public_subnetA_id
  public_subnetB_id = module.VPC.public_subnetB_id
  vpc_id            = module.VPC.vpc_id
}

module "ASG" {
  source = "./ASG"

  asg_sg = module.SG.asg_sg

}

module "SG" {
  source  = "./SG"
  alb-sg-name = var.alb-sg-name
  asg-sg-name = var.asg-sg-name
  vpc_id  = module.VPC.vpc_id
}

module "VPC" {
  source   = "./VPC"
  vpc-name = var.vpc-name
}
