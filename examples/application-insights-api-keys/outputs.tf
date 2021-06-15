output api_keys {
  description = "The API keys created for application insights."
  value       = module.application_insights.api_keys

  sensitive = true
}
