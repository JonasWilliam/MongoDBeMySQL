# MongoDBeMySQL
Atividades com MongoDB e Mysql

inserindo JSONS no banco: 

Cliente 1:_______________________________
{
    "cliente": {
       "nome": "Jonas William",
        "endereco": "rua dos bobos",
        "numeroCasa": "333",
        "Complemento": "ao lado do mercadinho 123"
},
    "pedido":{
        "item1": "x-tudo",
        "item2": "coca cola lata"
        }
}
Cliente 2: _______________________________
{
    "cliente": {
       "nome": "Fernanda",
        "endereco": "rua das bobas",
        "numeroCasa": "123",
        "Complemento": "ao lado do mercadinho 321"
},
    "pedido":{
        "item1": "x-salada",
	"qtdItem1":5
        "item2": "coca cola lata"
        }
}
Cliente 3: _______________________________

{
    "cliente": {
       "nome": "Seu Jorge",
        "endereco": "rua das burguesinhas",
        "numeroCasa": "132",
        "Complemento": "ao lado do bar do Zeca pagodinho"
},
    "pedido":{
        "item1": "Litrão Skol",
	"qtdItem1":24
        }
}
Cliente 4: _______________________________
{
    "cliente": {
       "nome": "James Bond",
        "endereco": "rua Cassino Royale",
        "numeroCasa": "007",
        "Complemento": "sem complemento"
},
    "pedido":{
        "item1": "Redbull Lata",
	"qtdItem1":7
        "item2": "Danone 1L"
	"qtdItem2":2
 	"item3": "Pizza congelada, sabor: 4 queijos"
	"qtdItem3":1
        }
}

Atualização (alterando quantidades item1 do James Bonde)

db.getCollection('pedidos').update(
   // query 
    {
        "cliente.nome" : "James Bond"
    },

    // update 
    {$set:
            {
                "qtdItem1":10
                }
    },

    // options 
    {
        "multi" : false,  // update only one document 
        "upsert" : false  // insert a new document, if no existing document match the query 
    }

Consulta Limitando em 4:

db.getCollection('pedidos').find({}).limit(4)

Consultando filtrando todos os nomes nos pedidos.

db.getCollection('pedidos').find({}, {"cliente.nome" : 1, "_id": 1})

Deletando uma consulta:

db.Consultas.remove({"cliente.nome" : "James Bond"}).

Ordenando Consulta de A-Z:

db.getCollection('pedidos').find().sort({"cliente.nome: 1})

Pulando documentos:

db.getCollection('pedidos').find({}).skip(2)

Buscando com 2 Seletores:

db.getCollection('pedidos').find({$or : [{"pedido.item1" : "x-tudo"}, {"pedido.item1" : "x-salada"}] })


______________________________________________Atividade MYSQL__________________________________________

create table estados 
( id int unsigned not null auto_increment, 
nome varchar(50), populacao int,siglas enum('RR', 'AP', 'AM', 'PA','AC','RO','TO','MA','PI','CE'
,'RN','PB','PE','AL','SE','BA','MT','DF','GO','MS','MG','ES','RJ','SP','PR'
,'SC','RS') not null, regioes enum('NORTE','SUL','NORDESTE','CENTRO OESTE','SUDESTE') not null,
UNIQUE KEY(nome), primary key(id)
);

select * from estados;
drop table estados;
insert into 
	estados (nome,siglas,regioes,populacao) 
values 
    ("Paraná","PR","SUL",7022),
	("Roraima","RR","NORTE",1022),
    ("Amapá","AP","NORTE",1100),
     ("Paraíba","PB","NORDESTE",102254),
    ("pernambuco","PE","NORDESTE",102233),
    ("Goiás","GO","CENTRO OESTE",9999),
    ("Distrito Federal","DF","CENTRO OESTE",14022),
    ("São Paulo","SP","SUDESTE",999999),
      ("Rio de Janeiro","RJ","SUDESTE",102222),
    ("Espírito Santo","ES","SUDESTE",102222),
    ("Santa Catarina","SC","SUL",80226);
    
    select * from estados order by siglas;
    
    select * from estados order by regioes desc;
    
	select sum(populacao) as total from estados;
    
   select avg(populacao) as media from estados; 
   
   select nome, regioes, group_concat(nome ,"  ", regioes) as Nome_Estados from estados
group by nome
order by id
