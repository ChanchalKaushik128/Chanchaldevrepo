azurerm_window_virtual_machine = {
  VM1 = {
    nicname    = "cknic"
    location   = "West Europe"
    rgname     = "ckrg"
    subname    = "backend"
    vnetname   = "CHANCHALVENT1"
    vmname     = "chanchalvm"
    kvname     = "ckvault11"
    kvusername = "ckusername"
    kvpass     = "ckpassword"
    pipname    = "ckpip"
    sizetype   = "Standard_F2"


  },
  VM2 = {
    nicname    = "cknic1"
    location   = "West Europe"
    rgname     = "ckrg"
    subname    = "backend"
    vnetname   = "CHANCHALVENT1"
    vmname     = "chanchalvm2"
    kvname     = "ckvault11"
    kvusername = "ckusername"
    kvpass     = "ckpassword"
    pipname    = "ckpip1"
    sizetype   = "Standard_F2"

  }
}
