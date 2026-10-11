resource "google_iap_tunnel_instance_iam_member" "iap_tunnel_instance_iam_members" {
  for_each = var.iap_tunnel_instance_iam_members

  instance = each.value.instance
  member   = each.value.member
  role     = each.value.role
  project  = each.value.project
  zone     = each.value.zone

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

