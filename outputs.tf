output name {
  description = "Generated name of the application insights."
  value       = azurerm_application_insights.application_insights.name
}

output id {
  description = "The ID of the application insights."
  value       =  azurerm_application_insights.application_insights.id
}

output app_id {
  description = "The app ID associated with application insights."
  value       = azurerm_application_insights.application_insights.app_id
}

output instrumentation_key {
  description = "The instrumentation key for application insights."
  value       = azurerm_application_insights.application_insights.instrumentation_key

  sensitive = true
}

output connection_string {
  description = "The connection string for application insights."
  value       = azurerm_application_insights.application_insights.connection_string

  sensitive = true
}

output api_keys {
  description = "The API keys created for application insights."
  value       = azurerm_application_insights_api_key.api_key[*]

  sensitive = true
}
