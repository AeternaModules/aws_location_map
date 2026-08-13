resource "aws_location_map" "location_maps" {
  for_each = var.location_maps

  map_name    = each.value.map_name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  configuration {
    style = each.value.configuration.style
  }
}

