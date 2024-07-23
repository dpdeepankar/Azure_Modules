resource "azurerm_key_vault_key" "kv-key" {
  for_each = var.keyvaultkey

  name = each.value.name    #the name of the Key Vault Key. Changing this forces a new resource to be created.
  key_vault_id = each.value.key_vault_id    #The ID of the Key Vault where the Key should be created. Changing this forces a new resource to be created.
  key_type = coalesce(each.value.key_type,"RSA-HSM")    #  Specifies the Key Type to use for this Key Vault Key. Possible values are EC (Elliptic Curve), EC-HSM, RSA and RSA-HSM. Changing this forces a new resource to be created.
  key_size = coalesce(each.value.key_size,2048)   #Specifies the Size of the RSA key to create in bytes.This field is required if key_type is RSA or RSA-HSM. Changing this forces a new resource to be created.
  curve = each.value.key_type == "EC" ? each.value.curve : null    #Specifies the curve to use when creating an EC key. Possible values are P-256, P-256K, P-384, and P-521. This field will be required in a future release if key_type is EC or EC-HSM. The API will default to P-256 if nothing is specified. Changing this forces a new resource to be created.
  key_opts = ["decrypt","encrypt","sign","unwrapKey","verify","wrapKey"]    #A list of JSON web key operations

  rotation_policy {
    expire_after = "P90D"
    notify_before_expiry = "P29D"
    automatic {
      time_before_expiry = "P30D"
    }
  }


}