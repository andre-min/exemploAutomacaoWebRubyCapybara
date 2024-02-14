#language: pt

Funcionalidade: Uso de cupons no Checkout

    Como um usuário da Starbugs, Eu quero poder aplicar cupons de desconto na página de checkout
    Para que eu possa obter reduções no preço de produtos, aumentando a satisfação com a minha experiência de compra.


Contexto: 
    Dado que iniciei a compra do item:
        |name    |Café com Leite|
        |price   |R$ 19,99      |
        |delivery| R$ 10,00     |
        |total   | R$ 29,99     |

#Documentação para automatizado os testes 

Cenário: Aplicar desconto de 20%

    Quando aplico o seguinte cupom: "MEUCAFE"
    Então o valor da compra deve ser atualizado para "R$ 25,99"

#Documentação para os Devs
# Cenário: Aplicar desconto de 20% 
#     Dado que estou na página de Checkout
#         E o item que está no meu carrinho é o café com leite no valor R$ 19,99
#         E que a taxa de entrega é de R$ 10,00
#         E o valor total é de R$ 29,99
#         E tenho um cupon com 20% de desconto "MEUCAFE"
#     Quando aplico esse cupom de desconto
#     Então o desconto de 20% deve ser aplicado apenas no valor do café com Leite
#         E o valor final da compra deve ser atualizado para R$ 25,99


#Documentação para automatizado os testes 
Cenário: Cupom Expirado

    Quando aplico o seguinte cupom: "PROMO20"
    Então devo ver a notificação: "Cupom expirado!"
        E o valor final da compra deve permanecer o mesmo


#Documentação para os Devs
# Cenário: Cupom Expirado
#     Dado que estou na página de Checkout
#         E o item que está no meu carrinho é o café com leite no valor R$ 19,99
#         E que a taxa de entrega é de R$ 10,00
#         E o valor total é de R$ 29,99
#         E tenho um cupom que está expirado "PROMO20"
#     Quando aplico esse cupom de desconto
#     Então devo ver a seguinte notificação "Cupom expirado!"
#         E o valor final deve permanecer o mesmo



Cenário: Cupom Inválido

    Quando aplico o seguinte cupom: "PROMO100"
    Então devo ver a notificação: "Cupom inválido!"
        E o valor final da compra deve permanecer o mesmo

#Documentação para os Devs
# Cenário: Cupom Inválido
#     Dado que estou na página de Checkout
#         E o item que está no meu carrinho é o café com leite no valor R$ 19,99
#         E que a taxa de entrega é de R$ 10,00
#         E o valor total é de R$ 29,99
#         E tenho um cupom com o código inválido
#     Quando aplico esse cupom de desconto
#     Então deve ver a seguinte notificação "Cupom inválido!"
#         E o valor final deve permanecer o mesmo


#Para os cenários cupom expirado/Cupom inválido, podemos utilizar o esquema de cenário. Segue o exemplo.
@ddt 
Esquema do Cenário: Tentativa de aplicar desconto

    Quando aplico o seguinte cupom: "<cupom>"
    Então devo ver a notificação: "<saida>"
        E o valor final da compra deve permanecer o mesmo

Exemplos:

| cupom    | saida           |
| PROMO20  | Cupom expirado! |
| PROMO100 | Cupom inválido! |