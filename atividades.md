### LISTA DE ATIVIDADES ###

--- Pod, Deployment, Secret e Configmap

1 Crie um POD com as seguintes características utilizando kubectl:
	nome: ex-1
	image: nginx
	port: 80

2 Crie um POD com as seguintes características utilizando yaml:
	nome: ex-2
	image: nginx:latest
	port: 80

3 Crie um POD com as seguintes características:
		nome: ex-3
		container 1
		image: nginx
		port: 80
	container 2
		image: redis
		port: 6379

4 Liste o nome de todos os pods no namespace default.
	kubectl get po 

5 Liste o nome de todos os pods no namespace default e salvar os nomes no arquivo /tmp/pods.
	kubectl get po > /tmp/pods

6 Utilizando o pod criado no exercício 3 fazer um teste do conexão entre os containers nginx e redis.
	kubectl exec --stdin --tty ex-3 -- /bin/bash
	apt update
	apt install telnet
	telnet ip-pod porta 6379


7 Obtenha todos os detalhes do pod criado no exercício 1 e também direcione a saída do comando para o arquivo /tmp/pod1.
	kubectl describe pod ex-1 > /tmp/pod1

8 Delete o pod criado no exercício 1.
	delete pod ex-1

9 Delete o pod criado no exercício 3 sem nenhum delay.

10 Altere a imagem do pod criado no exercício 2 para nginx:alpine

11 Obtenha a versão do imagem do container do CoreDNS localizado no namespace kube-system e salve em /tmp/core-image.

12 Crie um POD com as seguintes características:
	nome: ex-12
	image: nginx
	port: 80
	
	Após isso obtenha todas as variáveis de ambiente desse container e salve em /tmp/env-12

13 Crie um POD com as seguintes características:
	nome: ex-13
	image: nginx
	port: 80
	env: tier=web
	env: enrironment=dev
	
	Após isso obtenha todas as variáveis de ambiente desse container e salve em /tmp/env-13

14 Crie um POD com as seguintes características:
	nome: ex-14
	image: busybox
	args: sleep 3600

	Obtenha todas as variáveis de ambiente desse container e salve em /tmp/env-14

15 Crie um POD com as seguintes características:
	nome: ex-15
	image: busybox
	args: sleep 3600

16 Delete todos os pods no namespace default

17 Crie um Deployment com as seguintes características:
	nome: deploy-1
	image: nginx
	port: 80
	replicas: 1

18 Consulte o status do Deployment criado anteriormente.

19 Altere a image do deployment para nginx:alpine.

20 Consulte todos os ReplicaSet criados por esse deployment.

21 Altere a image do deployment para nginx:latest e adicione um motivo de causa.

22 Verifique qual imagem o deployment está utilizando e grave em /tmp/deploy-image.

23 Escale esse deployment para 5 replicas utilizando o kubectl.

24 Escale esse deployment para 2 replicas utilizando o kubectl edit.

25 Verifique qual imagem o deployment está utilizando e grave em /tmp/deploy-image-pause.

26 Crie um Deployment com as seguintes características utilizando um yaml:
	nome: deploy-30
	replicas: 5
	container 1
		name: web
		image: nginx 
		port: 80 
		env: tier=web
		env: environment=prod
	container 2
		nome: sleep
		image: busybox
		command: sleep 3600

27 Delete todos deployments no namespace default

28 Criar um ConfiMap com as seguintes características utilizando um yaml:
	nome: env-configs
	IP=10.0.0.1
	SERVER=nginx

29 Verifique o ConfiMap criado.

30 Obtenha todos os dados do ConfiMap criado para /tmp/configmap.

31 Crie um ConfiMap com as seguintes características utilizando o kubectl:
	nome: env-configs-kubectl
	tier=web
	server=homolog

32 Crie um POD com as seguintes características:
	nome: ex-cm-pod1
	image: nginx
	port: 80 
	
	Agora monte o configMap env-configs-kubectl como volume  em /data

33 Altere o pod ex-cm-pod1, agora montando somente o item tier agora com o nome ambiente.conf em /data.

34 Altere o pod ex-cm-pod1, remove todos os volumes e exporte o configMap completo como variáveis de ambiente. Após isso execute o comando ENV.

35 Altere o pod ex-cm-pod1, agora exporte somente o valor do item server para variável ENVIRONMENT. Após isso execute o comando ENV.

36 Altere o configMap env-configs-kubectl mude o valor de server para prod e faça essa alteração refletir no pod criado anteriormente.

37 Altere o configMap env-configs-kubectl para imutável.

38 Delete todos os pods e cofigmaps e pods criados anteriormente.

39 Crie uma Secret com as seguintes características utilizando um yaml:
	nome: user-secret
	user=superadmin
	pass=minhasenhasupersegura

40 Verifique a Secret criada.

41 Obtenha os dados da Secret criada para /tmp/secret e descriptografe seus valores em /tmp/decrypt

42 Crie uma Secret com as seguintes características utilizando o kubectl:
	nome: user-secret-kubectl
	user=newuser
	pass=agoraeseguraem

43 Crie um POD com as seguintes características:
	nome: ex-secret-pod1
	image: nginx
	port: 80 

	Agora monte a secret user-secret-kubectl como volume  em /secret

44 Altere o pod ex-secret-pod1, montando somente o item user agora com o nome user.conf em /secret

45 Altere o pod ex-secret-pod1, remove todos os volumes e exporte a secret completa como variáveis de ambiente, após isso execute o comando ENV

46 Altere o pod ex-secret-pod1, agora exporte somente o valor do item pass para variável SENHA, após isso execute o comando ENV

47 Altere a secret user-secret-kubectl e mude o valor de pass para minhanovasenhasegura e faça essa alteração refletir no pod criado anteriormente

48 Altere a secret user-secret-kubectl para imutável

--- ETCD

1 Crie um diretório chamado backup.

2  Crie um backup do ETCD e o salve-o no diretório backup/snaphost.db

3 Verifique a integridade do Backup

4 Crie um pod qualquer

5 Faça o restore do snapshot criado anteriormente e verifique se o pod ainda está criado.

--- Ingress

1 Crie um certificado utilizando o comando, o CN pode ser de sua escolha: 	
	openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes

2 Agora crie uma secrets do tipo TLS utilizando  o certificado crido anteriormente 

3 Crie um pod com o nome de sua escolha utilizando a imagem nginx 

4 Crie um serviço  para o pod criado anteriormente 

5 Crie um ingress utilizando como host o CN do certificado criado no item 2 e que tenho sua rota / apontada para o serviço criado no item 6.

6 Faça o teste de conexão para o ingress utilizando o navegador

7 Suba um initContainer com o Apache em um deployment e faça-o modificar a página inicial quando iniciar

8 Adicione um Ingress para o exercício 7 e valide a alteração do arquivo

9 Delete o pod do exercício 7 e valide se a página ainda continua customizada

--- Miscelânia

1 Crie um namespace

2 Adicione 5 pods nesses namespace com as especificações:
		nome: pod1
		image: nginx
		port: 80

		nome: pod2 
		image: apache
		port: 80

		nome: pod3
		image: redis
		port: 6379

		nome: pod4
		image: alpine

		nome: pod5
		image: nginx
		port: 80

3 Para as aplicações com porta, crie um service

4 Crie uma Network Policy do tipo Ingress que libera a comunicação do pod2, somente para o pod3

5 Crie uma Network Policy do tipo Ingress que libera a comunicação do pod5, somente para o pod4

6 Crie uma Network Policy do tipo Egress que libera a comunicação do pod3 com o pod1

7 Bloqueie toda a entrada e saída de rede desse namespace

8 Remova a Network Policy do exercício 7

9 Crie uma Network Policy do tipo Ingress que bloqueia toda comunicação do pod1

10 Modifique a Network Policy do exercício 4 e permita que pods do kube-system cheguem nele usando um "OR"

11 Crie uma Network Polict do tipo Egress que libera a comunicação do pod2 com o pod1 "AND" ingress-nginx