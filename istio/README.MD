- Nesse módulo irei demonstrar a utilização do istio com os seus conceitos visando a melhor compreenção da ferramenta 

Instalar o CLI do istio
- Rodar o comando `istioctl install` para adicionar o profile que vamos usar, como vamos usar o profile default não precisamos passar mais detalhes referentes ao profile( mais informações em `istiocl profile --help`)
- Injetar sidecar com `kubectl label namespace default istio-injection=enabled`

Instalar addons
- Para instalar os addons basta olhar na doc (https://istio.io/latest/docs/setup/getting-started/#dashboard) e clicar em several para ver os que estão disponíveis
- Basta rodar os comandos abaixo para exeuctar os addons:
granfana(`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.10/samples/addons/grafana.yaml`)
prometeus(`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.10/samples/addons/prometheus.yaml`)
kiali(`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.10/samples/addons/kiali.yaml`)
jaeger(`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.10/samples/addons/jaeger.yaml`)

- Depois de instalar tudo vamos tentar utilizar o fortio para enviar tráfego para nossa aplicação então precisamos instalar usando `kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.10/samples/httpbin/sample-client/fortio-deploy.yaml`
- Depois demvemos executar os comandos abaixo para pegar o nome do pode e executar o fortio:
    `export FORTIO_POD=$(kubectl get pods -lapp=fortio -o 'jsonpath={.items[0].metadata.name}')`
    `kubectl exec "$FORTIO_POD" -c fortio -- fortio load -c 2 -qps 0 -t 200s -loglevel warning http://nginx-service:80`