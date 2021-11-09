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