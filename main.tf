module "networking" {
  source    = "./modules/networking" 
  subnet_cidr = var.subnet_cidr            
  namespace = var.namespace                   
}





