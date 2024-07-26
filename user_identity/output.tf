output "user_assigned_identity_id" {
  value = [for k,v in var.useridentity : azurerm_user_assigned_identity.this[k].id]
}