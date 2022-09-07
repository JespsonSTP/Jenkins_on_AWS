module "autoscaling" {
  source      = "./modules/autoscaling"          
  namespace   = var.namespace                    
}
 
module "networking" {
  source    = "./modules/networking"             
  namespace = var.namespace                   
}