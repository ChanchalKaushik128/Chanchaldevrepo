subnet = {
  subnet1 = {
    subname  = "AzureBastionSubnet"
    poolname = ["10.0.1.0/24"]
    rgname   = "CKRG"
    vnetname = "CHANCHALVENT1"
  },
  subnet2 = {
    subname  = "backend"
    poolname = ["10.0.2.0/24"]
    rgname   = "CKRG"
    vnetname = "CHANCHALVENT1"
  },
  subnet3 = {
    subname  = "AzureBastionSubnet"
    poolname = ["10.1.1.0/24"]
    rgname   = "CKRG1"
   vnetname = "CHANCHALVENT2"
  },
  subnet4 = {
    subname  = "database"
    poolname = ["10.1.2.0/24"]
    rgname   = "CKRG1"
  vnetname = "CHANCHALVENT2"
  },
}