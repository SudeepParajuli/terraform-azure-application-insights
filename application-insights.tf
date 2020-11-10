resource azurerm_application_insights application_insights {
  name = format("%s%s%03d",
    substr(
      replace(module.naming.application_insights.name, "-", ""),
      module.naming.application_insights.max_length - 4
    ),
    substr(var.info.environment, 0, 1),
    var.info.sequence
  )
 
  resource_group_name = var.resource_group
  location            = var.region

  application_type = var.application_type

  daily_data_cap_in_gb                  = var.daily_data_cap
  daily_data_cap_notifications_disabled = var.data_cap_notifications_disabled

  retention_in_days   = var.retention_days
  sampling_percentage = var.sampling_percentage
  disable_ip_masking  = var.disable_ip_masking

  tags = local.tags
}
