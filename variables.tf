variable "location_maps" {
  description = <<EOT
Map of location_maps, attributes below
Required:
    - map_name
    - configuration (block):
        - style (required)
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    map_name    = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    configuration = object({
      style = string
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.location_maps : (
        length(v.map_name) >= 1 && length(v.map_name) <= 100
      )
    ])
    error_message = "must be between 1 and 100 characters"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

