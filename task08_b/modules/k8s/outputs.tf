output "lb_ip" {
  description = "Load Balancer IP of the AKS app service"
  value       = data.kubernetes_service.app.status[0].load_balancer[0].ingress[0].ip
}