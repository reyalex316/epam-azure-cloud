resource_groups = {
  rg1 = {
    name     = "cmaz-ph0p7o3b-mod5-rg-01"
    location = "swedencentral"
  }
  rg2 = {
    name     = "cmaz-ph0p7o3b-mod5-rg-02"
    location = "polandcentral"
  }
  rg3 = {
    name     = "cmaz-ph0p7o3b-mod5-rg-03"
    location = "centralus"
  }
}

app_service_plans = {
  asp1 = {
    name         = "cmaz-ph0p7o3b-mod5-asp-01"
    rg_key       = "rg1"
    sku_name     = "S1"
    worker_count = 2
  }
  asp2 = {
    name         = "cmaz-ph0p7o3b-mod5-asp-02"
    rg_key       = "rg2"
    sku_name     = "S1"
    worker_count = 1
  }
}

app_services = {
  app1 = {
    name    = "cmaz-ph0p7o3b-mod5-app-01"
    rg_key  = "rg1"
    asp_key = "asp1"
  }
  app2 = {
    name    = "cmaz-ph0p7o3b-mod5-app-02"
    rg_key  = "rg2"
    asp_key = "asp2"
  }
}

traffic_manager = {
  name           = "cmaz-ph0p7o3b-mod5-traf"
  rg_key         = "rg3"
  routing_method = "Performance"
}

allow_ip_rule_name    = "allow-ip"
allow_tm_rule_name    = "allow-tm"
verification_agent_ip = "18.153.146.156"

tags = {
  Creator = "alejandro_villarreal@epam.com"
}