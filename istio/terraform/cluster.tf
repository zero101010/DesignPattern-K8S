resource "google_container_cluster" "primary" {

  name               =  var.project_name
  location           = var.region
  initial_node_count = var.node_count

  master_auth {
    username = ""
    password = ""

  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    machine_type = "e2-standard-4"

    metadata = {
      disable-legacy-endpoints = "true"
    }
     labels = {
      app = var.project_name
    }

    tags = ["app", var.project_name]

  }
  network_policy {
    enabled = true
  }

  timeouts {
    create = "50m"
    update = "50m"
  }
  provisioner "local-exec" {
    command = <<EOT
      gcloud container clusters get-credentials $PROJECT_NAME --zone $REGION --project $PROJECT_ID
      istioctl install -y
      echo -------------- Enable side Car--------------------
      kubectl label namespace default istio-injection=enabled
      echo -------------- Enable Addons--------------------
      kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.10/samples/addons/grafana.yaml
      kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.10/samples/addons/prometheus.yaml
      kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.10/samples/addons/kiali.yaml
      kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.10/samples/addons/jaeger.yaml
      echo -------------- Enable Fortio--------------------
      kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.10/samples/httpbin/sample-client/fortio-deploy.yaml
  EOT
    environment = {
      PROJECT_NAME = var.project_name
      PROJECT_ID = var.project_id
      REGION: var.region
    }
  }
}

