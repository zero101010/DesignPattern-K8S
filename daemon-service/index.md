## Problema
- Queremos garantir que um pod seja executado somente uma vez em um nó utilizando o daemonset

## Resolução
- É possivel utilizar um serviço dentro de um contexto limitando o pod a executar somente dentro de runners que possuem  `node-selector` escolhidos. Como estamos rodando um DaemonSet que diferete do replicaset como por exemplo:
    - Por padrão o DaemonSet coloca uma instancia de pod em cada nó, isso pode ser comtrolado e lomotado a um subconjunto de nós
    - Pods criados por DaemonSet podem ser executar antes do escalonador iniciar, o que permite que executem antes de qualquer outro pod
    - O Descheduler evitará dispejar pods como esse e o autoscaler do cluster o gerencia separadamente