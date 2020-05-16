module "rds-mysql" {
  source          = "git::https://chandralekha882:Opcqa123!@github.com/chandralek/modules.git//rds-mysql"
  VPC_ID          = data.terraform_remote_state.VPC.outputs.VPC_ID
  MGMT_VPC_ID     = data.terraform_remote_state.VPC.outputs.MGMT_VPC_ID
  PRIVATE_SUBNETS = data.terraform_remote_state.VPC.outputs.PRIVATE_SUBNETS
  PUBLIC_SUBNETS  = data.terraform_remote_state.VPC.outputs.PUBLIC_SUBNETS
  DBUSER          = var.DBUSER
  DBPASS          = var.DBPASS
  INSTANCE_TYPE   = var.INSTANCE_TYPE
  PROD            = var.PROD
  NONPROD         = var.NONPROD
  TAGS            = var.TAGS
  GIT_USR         = var.GIT_USR
  GIT_PSW         = var.GIT_PSW
  HOSTED_ZONE_ID  = data.terraform_remote_state.route53.outputs.HOSTED_ZONE_ID
  HOSTED_ZONE_NAME= data.terraform_remote_state.route53.outputs.HOSTED_ZONE_NAME
}