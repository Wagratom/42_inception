• Este projeto precisa ser feito em uma máquina virtual.

• Todos os arquivos necessários para a configuração do seu projeto devem ser
colocados em um srcs pasta.

• Um Makefile também é necessário e deve estar localizado na raiz do seu diretório.
Isto deve configurar todo o seu aplicativo (ou seja, ele deve criar as imagens do
Docker usando docker-compose.yml).

* Você tem que usar o docker compose.
* Cada imagem do Docker deve ter o mesmo nome de seu serviço correspondente.
* Cada serviço deve ser executado em um contêiner dedicado.
* Você também precisa escrever seus próprios Dockerfiles, um por serviço.
* Os Dockerfiles devem ser chamado em seu docker-compose.yml por seu Makefile.

** Você então tem que configurar:
- [x] Um contêiner Docker que contém NGINX apenas com TLSv1.2 ou TLSv1.3.
instalei o nginx e a openssl (ver porque precisa da openssl)
