### Acessand DNS interno K8S

- nesse projeto utilizei o nginx e o rancher para testar como poderia fazer a comunicação entre ambos utilizando o dns interno do K8S

- Após executar ambos com o comando `kubectl apply -f diretorio` executei o seguinte comando `kubectl exec -it rancher-8db856bbd-9zb52  -- cat /etc/resolv.conf`, onde rancher-8db856bbd-9zb52 é o nome do meu pod. O resultado foi :
```
nameserver 10.96.0.10
search default.svc.cluster.local svc.cluster.local cluster.local
options ndots:5
```

Após isso entrei no container do nginx usando o comando `kubectl exec -it nome-pod -- sh` e rodei um curl como no exemplo a seguir ` curl nginx-service.default.svc.cluster.local`, usando o nome do serviço para acessar o dns interno da aplicação