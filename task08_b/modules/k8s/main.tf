
# Kubernetes YAML manifests (from kubectl TF provider) for k8s-templates
# To additionally tell Terraform to wait till a successful Kubernetes resource creation you may use the wait_for block in kubectl TF resources:
# Click to expand example for wait_for blocks
# ## Block for deployment manifest
# wait_for {
#   field {
#     key   = "status.availableReplicas"
#     value = "1"
#   }
# }

# ## Block for service manifest
# wait_for {
#   field {
#     key        = "status.loadBalancer.ingress.[0].ip"
#     value      = "^(\\d+(\\.|$)){4}"
#     value_type = "regex"
#   }
# }
# Data source to access information about deployed Kubernetes service to get LoadBalancer IP address (from kubernetes TF provider)
# To avoid issues with the undefined providers, explicitly declare kubectl, and kubernetes required_providers blocks in module file versions.tf