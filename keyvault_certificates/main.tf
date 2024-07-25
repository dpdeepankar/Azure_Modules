resource "azurerm_key_vault_certificate" "this" {
    for_each = var.kv-cert

    name = each.value.name
    key_vault_id = each.value.key_vault_id

    certificate_policy {
      issuer_parameters {
        name = "Self"
      }
      key_properties {
        key_size = 2048
        key_type = "RSA"
        exportable = true
        reuse_key = true
      }
    
      secret_properties {
        content_type = "application/x-pkcs12"
      }
    }

}