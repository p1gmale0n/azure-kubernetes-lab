## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name\_prefix | The prefix for the resources created in the specified Azure Resource Group. | string | n/a | yes |
| admin\_username | The username of the local administrator to be created on the Kubernetes cluster. | string | `"azureuser"` | no |
| agents\_count | The number of Agents that should exist in the Agent Pool. | string | `"2"` | no |
| agents\_size | The default virtual machine size for the Kubernetes agents. | string | `"Standard_F2"` | no |
| kubernetes\_version | Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time \(but won't auto-upgrade\). | string | `""` | no |
| location | The location for the AKS deployment. | string | `"eastus"` | no |
| log\_analytics\_workspace\_sku | The SKU \(pricing level\) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018. | string | `"PerGB2018"` | no |
| log\_retention\_in\_days | The retention period for the logs in days. | string | `"30"` | no |
| public\_ssh\_key | A custom ssh key to control access to the AKS cluster.  If no public ssh key is set through variables, a newly generated public key will be used and the private key will be saved in a private\_ssh\_key file. | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| client\_certificate | Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster. |
| client\_key | Base64 encoded private key used by clients to authenticate to the Kubernetes cluster. |
| cluster\_ca\_certificate | Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster. |
| host | The Kubernetes cluster server host. |
| location | The location where the Managed Kubernetes Cluster was created. |
| node\_resource\_group | The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. |
| password | A password or token used to authenticate to the Kubernetes cluster. |
| username | A username used to authenticate to the Kubernetes cluster. |

