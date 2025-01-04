**Requisitos**

 - Certificado deve ter o nome `certificado.pem`
 - Chave deve ter o nome `privada.key`

**Variáveis**

|Variável|Descrição|
|--|--|
|PORTA_TLS|Porta interna para TLS|
|PORTA_UDP|Porta interna para UDP|
|RTP_INICIO|Porta inicial para o range RTP (não pode conflitar com outras portas)|
|RTP_FIM|Porta final para o range RTP (não pode conflitar com outras portas)|
|TRONCO_HOST|IP do Asterisk com o qual esse container vai ser entroncado|
|TRONCO_PORTA|Porta do Asterisk com o qual esse container vai ser entroncado|
|SBC_OI|Endereço do SBC da Oi|
|NUMERO_OI|Número da OI|

**Build**

```bash
docker build -t asterisk-docker-tls-trunking .
```

**Executar**

```bash
docker-compose up -d
```

**Monitoramento**

```bash
docker exec -it asterisk_5533333333 /usr/bin/sngrep -d lo
```

**Gerar certificado**

```bash
openssl req -x509 -newkey rsa:4096 -keyout ./certs/privada.key -out ./certs/certificado.pem -sha256 -days 3650 -nodes -subj "/C=BR/ST=Ceara/L=Fortaleza/O=Infomarques/OU=Desenvolvimento/CN=asterisk.pabxip.com.br"
```