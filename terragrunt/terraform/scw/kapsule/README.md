## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | = 1.0.7 |
| <a name="requirement_scaleway"></a> [scaleway](#requirement\_scaleway) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_scaleway"></a> [scaleway](#provider\_scaleway) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [scaleway_domain_record.wilcard_lb_record](https://registry.terraform.io/providers/scaleway/scaleway/2.2.0/docs/resources/domain_record) | resource |
| [scaleway_domain_zone.wttj](https://registry.terraform.io/providers/scaleway/scaleway/2.2.0/docs/resources/domain_zone) | resource |
| [scaleway_instance_placement_group.availability_group](https://registry.terraform.io/providers/scaleway/scaleway/2.2.0/docs/resources/instance_placement_group) | resource |
| [scaleway_k8s_cluster.kapsule](https://registry.terraform.io/providers/scaleway/scaleway/2.2.0/docs/resources/k8s_cluster) | resource |
| [scaleway_k8s_pool.app_node_pool](https://registry.terraform.io/providers/scaleway/scaleway/2.2.0/docs/resources/k8s_pool) | resource |
| [scaleway_lb_ip.reserved_lb_ip](https://registry.terraform.io/providers/scaleway/scaleway/2.2.0/docs/resources/lb_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_instance_type"></a> [app\_instance\_type](#input\_app\_instance\_type) | Type of instance to be used in app node pool | `string` | n/a | yes |
| <a name="input_app_node_pool_size"></a> [app\_node\_pool\_size](#input\_app\_node\_pool\_size) | Number of nodes in app node pool | `number` | n/a | yes |
| <a name="input_dns"></a> [dns](#input\_dns) | Domain where DNS zone and records should be created | `string` | n/a | yes |
| <a name="input_kapsule_auto_upgrade_start_day"></a> [kapsule\_auto\_upgrade\_start\_day](#input\_kapsule\_auto\_upgrade\_start\_day) | Day when Kapsule may auto-upgrade Kubernetes (minor version only) | `string` | `"tuesday"` | no |
| <a name="input_kapsule_auto_upgrade_start_hour"></a> [kapsule\_auto\_upgrade\_start\_hour](#input\_kapsule\_auto\_upgrade\_start\_hour) | Hour when when Kapsule may auto-upgrade Kubernetes (minor version only) | `number` | `3` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Kubernetes version | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the environment | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | Scaleway profile | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Scaleway region | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Scaleway zone | `string` | n/a | yes |

## Outputs

No outputs.
