CREATE TABLE avances
  (
    id_avance   INTEGER NOT NULL ,
    nombre      VARCHAR2 (35) ,
    descripcion VARCHAR2 (1000) ,
    archivo BLOB ,
    proyecto_id_proyecto INTEGER NOT NULL
  ) ;
ALTER TABLE avances ADD CONSTRAINT avances_PK PRIMARY KEY ( id_avance ) ;


CREATE TABLE equipo
  (
    usuario_DNI          INTEGER NOT NULL ,
    proyecto_id_proyecto INTEGER NOT NULL
  ) ;


CREATE TABLE eventos
  (
    id_evento   INTEGER NOT NULL ,
    nombre      VARCHAR2 (35) ,
    descripcion VARCHAR2 (1000) ,
    f_inicio    DATE ,
    f_final     DATE ,
    rol_codigo  INTEGER NOT NULL
  ) ;
ALTER TABLE eventos ADD CONSTRAINT eventos_PK PRIMARY KEY ( id_evento ) ;


CREATE TABLE proyecto
  (
    id_proyecto INTEGER NOT NULL ,
    nombre      VARCHAR2 (50)
  ) ;
ALTER TABLE proyecto ADD CONSTRAINT proyecto_PK PRIMARY KEY ( id_proyecto ) ;


CREATE TABLE rol
  (
    codigo      INTEGER NOT NULL ,
    nombre      VARCHAR2 (35) ,
    responsable VARCHAR2 (35) ,
    clave       VARCHAR2 (35) ,
    usuario_DNI INTEGER NOT NULL
  ) ;
ALTER TABLE rol ADD CONSTRAINT rol_PK PRIMARY KEY ( codigo ) ;


CREATE TABLE usuario
  (
    DNI             INTEGER NOT NULL ,
    nombre          VARCHAR2 (35) ,
    apellido        VARCHAR2 (35) ,
    fechaNacimiento DATE ,
    programa        VARCHAR2 (35) ,
    Tema            VARCHAR2 (35) ,
    clave           VARCHAR2 (35)
  ) ;
ALTER TABLE usuario ADD CONSTRAINT usuario_PK PRIMARY KEY ( DNI ) ;


ALTER TABLE avances ADD CONSTRAINT avances_proyecto_FK FOREIGN KEY ( proyecto_id_proyecto ) REFERENCES proyecto ( id_proyecto ) ;

ALTER TABLE equipo ADD CONSTRAINT equipo_proyecto_FK FOREIGN KEY ( proyecto_id_proyecto ) REFERENCES proyecto ( id_proyecto ) ;

ALTER TABLE equipo ADD CONSTRAINT equipo_usuario_FK FOREIGN KEY ( usuario_DNI ) REFERENCES usuario ( DNI ) ;

ALTER TABLE eventos ADD CONSTRAINT eventos_rol_FK FOREIGN KEY ( rol_codigo ) REFERENCES rol ( codigo ) ;

ALTER TABLE rol ADD CONSTRAINT rol_usuario_FK FOREIGN KEY ( usuario_DNI ) REFERENCES usuario ( DNI ) ;
