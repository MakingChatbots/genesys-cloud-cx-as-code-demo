resource "genesyscloud_webdeployments_deployment" "contact_us" {
  name            = "Bookshop Support"
  description     = "Web deployment Bookshop support"
  allow_all_domains = true

  # References the flow resource the Messenger Deployment will use
  flow_id         = genesyscloud_flow.inbound_message_flow.id
  configuration {
    # References the configuration resource above
    id      = genesyscloud_webdeployments_configuration.default.id
    version = genesyscloud_webdeployments_configuration.default.version
  }
}

resource "genesyscloud_webdeployments_configuration" "default" {
  name                  = "Lucas' Bookshop Config"
  description           = "Configuration for Contact Us page"
  languages             = ["en-us"]
  default_language      = "en-us"
  messenger {
    enabled = true
    launcher_button {
      visibility = "On"
    }
  }
}

output "deployment_id" {
  value = genesyscloud_webdeployments_deployment.contact_us.id
}
