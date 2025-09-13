locals {
  # Locations of where the flows are defined
  inbound_msg_flow_filepath = "${path.module}/flows/inbound-msg.yaml"
  digital_bot_flow_filepath = "${path.module}/flows/digital-bot.yaml"
}

resource "genesyscloud_flow" "inbound_message_flow" {
  filepath = local.inbound_msg_flow_filepath

  # A unique has created to determine when the flow's YAML file changes
  file_content_hash = filesha256(local.inbound_msg_flow_filepath)

  # This is how you can configure your flow definition
  substitutions = {
    bot_flow_name = genesyscloud_flow.digital_bot_flow.name
  }
}

resource "genesyscloud_flow" "digital_bot_flow" {
  filepath = local.digital_bot_flow_filepath
  file_content_hash = filesha256(local.digital_bot_flow_filepath)
  substitutions = {
    book_purchase_queue = var.book_purchase_queue_name
  }
}
