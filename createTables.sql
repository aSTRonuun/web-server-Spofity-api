create table turne(
	id_turne serial primary key,
	data date,
	descricao varchar(100)
);

create table artista(
	id_artista serial primary key,
	sobre varchar(100),
	id_turne integer references turne(id_turne),
	nome varchar(50),
	qtd_ouvintes integer
)

create table album(
	id_album serial primary key,
	qtd_musica serial,
	titulo varchar(50),
	duracao_total numeric,
	descricao varchar(100),
	id_artista integer references artista(id_artista)
);

alter table album add id_musica integer;
alter table album add constraint fk_id_musica foreign key(id_musica)
references musica(id_musica);

create table artistas_musica(
	id_artistas_musicas serial primary key,
	nome_artista varchar(50)
);

create table musica(
	id_musica serial primary key,
	titulo varchar(50),
	duracao numeric,
	genero varchar(20),
	id_album integer references album(id_album),
	id_artista_musicas integer references artistas_musica(id_artistas_musicas)
);

create table podcaster(
	id_podcaster serial primary key,
	name varchar(50),
	qtd_ouvintes int
);

create table podcast(
	id_podcast serial primary key,
	descricao varchar(150),
	titulo varchar(50),
	id_episodio integer,
	id_podcaster integer references podcaster(id_podcaster)
);

alter table podcast add constraint fk_id_episodio
foreign key(id_episodio) references episodio(id_episodio);

create table episodio(
	id_episodio serial primary key,
	descricao varchar(150),
	duracao numeric,
	lancando_em date,
	titulo varchar(50),
	id_podcast integer references podcast(id_podcast)
);

create table audio_playlist(
	id_playlist serial primary key,
	adicionado_em date,
	id_musica integer references musica(id_musica),
	id_episodio integer references episodio(id_episodio)
);

create table playlist(
	id_playlist serial primary key,
	descricao varchar(100),
	autor varchar(50),
	duracao_total numeric,
	curtidas integer,
	qtd_musicas integer,
	id_audio_playlist integer references audio_playlist(id_playlist)
);

create table biblioteca(
	id_biblioteca serial primary key,
	qtd_podcasts integer,
	qtd_playlist integer,
	qtd_albuns integer,
	id_album integer references album(id_album),
	id_playlist integer references playlist(id_playlist),
	id_podcast integer references podcast(id_podcast),
	id_artistas integer references artista(id_artista)
);

create table ouvintes(
	id_user serial primary key,
	nome varchar(50),
	tipo_conta boolean,
	email varchar(50),
	senha varchar(50),
	data_nasc date,
	pais varchar(50),
	id_biblioteca integer references biblioteca(id_biblioteca)
);