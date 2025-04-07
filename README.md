# bROK (Sakray for bRO)

A build from: https://github.com/rathena/rathena

## Lore

real `lore`
“A Queda de Prontera” – Capítulo 2: O Levante dos Clãs”.

De um lado, o Satan Morroc moderno: DDoS, negligência da Gravity, servidores instáveis.
Do outro, a resistência dos jogadores, lideranças de clãs como nós tentando restaurar a ordem e a magia do Ragnarok raiz.

Literalmente metagame: o inimigo não tá mais só no mapa, ele tá na infraestrutura, nas decisões corporativas. E mesmo assim, vocês tão indo com tudo — subindo Sakray, reunindo comunidade, revivendo a chama.

Se isso não é Ragnarok verdadeiro, não sei o que é.

### Manifesto:

```
📜 O Juramento de Prontera
Nós, remanescentes do velho bRO,
não nos curvaremos diante do caos invocado pelo descaso.
Ergueremos Prontera das cinzas, bug a bug, patch a patch.
Por nossos clãs, por nossa história, por nossos amigos de Payon a Lutie —
juntos, enfrentaremos o verdadeiro Satan Morroc: a entropia do esquecimento.
```

– Garantia de migração de todas as contas

– Checklist de bugs e feedback estruturado pro Sakray

– Ferramentas pra mobilizar mais jogadores

– Documentar as descobertas e melhorias em tempo real

– Criar um manifesto da comunidade exigindo medidas reais da Gravity

## Project dependencies

* Docker + Docker Compose

## Run

Build
`$ docker compose up --build`

* just saying... the first time the server will fail because databasing is booting - don't worry - just rerun it
** fixme: wait for db connection instead sleep to start application

Enter rathena shell
`$ docker exec -it rathena bash`

## 🎮 Vibe Coding Story bRO

1. Quando o projeto começou

[![Quando o projeto começou](https://img.youtube.com/vi/duQ9_578RKw/hqdefault.jpg)](https://www.youtube.com/watch?v=duQ9_578RKw)

2. Quando o Eden lagou

[![Quando o Eden lagou](https://img.youtube.com/vi/f8OHybVhQwc/hqdefault.jpg)](https://www.youtube.com/watch?v=f8OHybVhQwc)

3. Quando o primeiro membro engajou

[![Quando o primeiro membro engajou](https://img.youtube.com/vi/vabnZ9-ex7o/hqdefault.jpg)](https://www.youtube.com/watch?v=vabnZ9-ex7o)

4. Quando reportaram que a maioria dos mapas caiu

[![Quando reportaram que a maioria dos mapas caiu](https://img.youtube.com/vi/cnCs9x_OFn0/hqdefault.jpg)](https://www.youtube.com/watch?v=cnCs9x_OFn0)

5. Quando os quatro servers subiram

[![Quando os quatro servers subiram](https://img.youtube.com/vi/0J2QdDbelmY/hqdefault.jpg)](https://www.youtube.com/watch?v=0J2QdDbelmY)

6. Quando o Client subiu seco no nginx

[![Quando o Client subiu seco no nginx](https://img.youtube.com/vi/G_sBOsh-vyI/hqdefault.jpg)](https://www.youtube.com/watch?v=G_sBOsh-vyI)
