create database factoria_jamones;
use factoria_jamones;

CREATE TABLE `raza` (
  `id_raza` integer,
  `desc_raza` varchar(100),
  PRIMARY KEY (`id_raza`)
);

CREATE TABLE `matadero` (
  `id_matadero` integer,
  `desc_matadero` varchar(100),
  PRIMARY KEY (`id_matadero`)
);

CREATE TABLE `alimentacion` (
  `id_alimentacion` integer,
  `desc_alimentacion` varchar(100),
  PRIMARY KEY (`id_alimentacion`)
);

CREATE TABLE `tipo_pesada_entrada` (
  `id_tipo_pesada_entrada` integer,
  `desc_tipo_pesada_entrada` varchar(100),
  PRIMARY KEY (`id_tipo_pesada_entrada`)
);

CREATE TABLE `partida` (
  `id_partida` integer,
  `no_partida` varchar(100),
  `añada` integer,
  `id_raza` integer,
  `id_alimentacion` integer,
  `acido_oleico` double,
  `acido_palmitico` double,
  `acido_estearico` double,
  `acido_linoleico` double,
  `peso_varios` double,
  `peso_vientres` double,
  `peso_cerdos` double,
  `peso_neto_canal` double,
  `nacimiento` varchar(100),
  `id_matadero` integer,
  `no_animales` integer,
  `id_tipo_pesada_entrada` integer,
  `fecha_entrada` varchar(100),
  PRIMARY KEY (`id_partida`),
  FOREIGN KEY (`id_raza`) REFERENCES `raza`(`id_raza`),
  FOREIGN KEY (`id_matadero`) REFERENCES `matadero`(`id_matadero`),
  FOREIGN KEY (`id_tipo_pesada_entrada`) REFERENCES `tipo_pesada_entrada`(`id_tipo_pesada_entrada`),
  FOREIGN KEY (`id_alimentacion`) REFERENCES `alimentacion`(`id_alimentacion`)
);


CREATE TABLE `tipo_pesada_salida` (
  `id_tipo_pesada_salida` integer,
  `desc_tipo_pesada_salida` varchar(100),
  PRIMARY KEY (`id_tipo_pesada_salida`)
);

CREATE TABLE `estado_salida` (
  `id_estado_salida` integer,
  `desc_estado_salida` varchar(100),
  PRIMARY KEY (`id_estado_salida`)
);

CREATE TABLE `tipo_pieza` (
  `id_tipo_pieza` integer,
  `desc_tipo_pieza` varchar(100),
  PRIMARY KEY (`id_tipo_pieza`)
);

CREATE TABLE `pieza` (
  `id_pieza` integer,
  `id_tipo_pieza` integer,
  `id_partida` integer,
  `no_serie` integer,
  `peso_entrada` double, 
  `peso_salida` double, 
  `fecha_salida` varchar(100),
  `id_tipo_pesada_salida` integer,
  `id_estado_salida` integer,
  PRIMARY KEY (`id_pieza`),
  FOREIGN KEY (`id_tipo_pesada_salida`) REFERENCES `tipo_pesada_salida`(`id_tipo_pesada_salida`),
  FOREIGN KEY (`id_estado_salida`) REFERENCES `estado_salida`(`id_estado_salida`),
  FOREIGN KEY (`id_partida`) REFERENCES `partida`(`id_partida`) ON DELETE CASCADE,
  FOREIGN KEY (`id_tipo_pieza`) REFERENCES `tipo_pieza`(`id_tipo_pieza`)
);




