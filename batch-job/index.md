## Problema
- Quando precisamos executar um pod somente uma vez, sem ser necessário delimitar um tempo ou ocorrencia sem ter que ficar lidando com reestart ou com o replicaset

## Solução
- utilizar o batch job
- Um detalhe importante é que o restartPolicy in um job é obrigatório e pode ser somente `Never`ou `OnFailure`, diferentemente dos pods comum que o padrão é `Always`


