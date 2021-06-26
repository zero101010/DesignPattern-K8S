# K8s Cluster create (+knative)

``git clone https://git.mcontigo.com/devops/k8s``

``cd k8s/knative``
- Before run terraform is necessary add the credentials of gcloud, and change the name to `service_account.json`, after is only necessary update the name of project in `provider.tf`and change the `variables.tf` if you can

``terraform init``

`terraform apply -f nginx-canary-istio`


### Tipos de Loadbalancer
- Round Robin: Tenta mandar a mesma quantidade de solicitações de forma igualitária
- Random: Que manda a solicitação de forma aleatória
- Least Request: Sempre envia a solicitação para a serviço que menos teve solicitação