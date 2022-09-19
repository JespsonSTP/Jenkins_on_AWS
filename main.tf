module "networking" {
  source        = "./modules/networking" 
  public_cidrs  = var.public_cidrs            
  private_cidrs = var.private_cidrs 
  my_ip         = var.my_ip          
  namespace     = var.namespace                   
}

module "servers" {
  source        = "./modules/servers" 
  linux_data_volume_size = var.linux_data_volume_size
  linux_root_volume_size = var.linux_root_volume_size
  aws_key_pair           = var.instance_type
  instance_type          = var.instance_type
  vpc                    = module.networking.vpc
  pub_subnet             = module.networking.pub_subnet
  priv_subnet            = module.networking.priv_subnet
  sg                     = module.networking.sg    
  namespace              = var.namespace                   
}

module "autoscaling" {
  source        = "./modules/autoscaling" 
  vpc                    = module.networking.vpc
  pub_subnet             = module.networking.pub_subnet
  sg                     = module.networking.sg 
  jenkins_master         = module.servers.jenkins_master  
  namespace              = var.namespace                   
}





