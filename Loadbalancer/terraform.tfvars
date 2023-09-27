
azurerm_lb = {
lb1 ={
lbname ="chanchal-loadbalancer"
location = "West Europe"
rgname  = "CKRG"
pipname = "ckpip"
vnetname = "CHANCHALVENT1"
vmname1 = "chanchalvm"
vmname2 = "chanchalvm2"
frontendipname = "ckpublicipaddress"
backendpoolname = "CKBackEndAddressPool"
backendaddresspoolname = "ckbackendaddresspooladdress1"
backendaddresspoolname2 = "ckbackendaddresspooladdress2"
lbrule = "LBRule1"
}
}