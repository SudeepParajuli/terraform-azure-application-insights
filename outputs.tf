output name {
  description = "Generated name for the application insights resource."
  value       = azurerm_application_insights.application_insights.name
}

output id {
  description = "The ID of the application insights resource."
  value       =  azurerm_application_insights.application_insights.id
}

output app_id {
  description = "The app ID associated with application insights."
  value       = azurerm_application_insights.application_insights.app_id
}

output instrumentation_key {
  description = "The instrumentation key for application insights."
  value       = azurerm_application_insights.application_insights.instrumentation_key
}

output connection_string {
  description = "The connection string for application insights."
  value       = azurerm_application_insights.application_insights.connection_string
}
