variable info {
  type = object({
    project     = string
    environment = string
    sequence    = number
  })
}

variable tags {
  type = map(string)
}

variable region {
  type = string
}

variable daily_data_cap {
  type = number
}

variable api_keys {
  type = list(object({
    name        = string
    permissions = string
  }))
}
