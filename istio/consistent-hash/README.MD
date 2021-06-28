# Consistent hash 
- É responsável pelo direcionamento do loadbalancer a partir de um parâmetro, podendo ser salvo no cookie, header, parametro ou storage do navegador, ele serve basicamente para manter o usuário na versão que ele já acessou, ao invés de mudar a página a cada refresh
- Nesse módulo usamos o header "x-user" para setar a criação do hash e manter o user em uma session a cada request