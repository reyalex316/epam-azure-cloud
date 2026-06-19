name_prefix             = "cmaz-ph0p7o3b-mod6"
location                = "centralus"
key_vault_name          = "cmaz-ph0p7o3b-mod6-kv"
key_vault_rg_name       = "cmaz-ph0p7o3b-mod6-kv-rg"
sql_admin_username      = "sqladmin"
sql_sku                 = "S2"
kv_secret_username_name = "sql-admin-name"
kv_secret_password_name = "sql-admin-password"
firewall_rule_name      = "allow-verification-ip"
allowed_ip_address      = "18.153.146.156"
asp_sku                 = "P0v3"
dotnet_version          = "8.0"

tags = {
  Creator = "alejandro_villarreal@epam.com"
}