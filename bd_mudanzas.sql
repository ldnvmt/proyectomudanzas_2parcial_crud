/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     28/10/2021 17:26:07                          */
/*==============================================================*/


drop index RELATIONSHIP_3_FK;

drop index ASESOR_PK;

drop table ASESOR;

drop index CLIENTE_PK;

drop table CLIENTE;

drop index RELATIONSHIP_6_FK;

drop index RELATIONSHIP_8_FK;

drop index DETALLE_FACTURA_PK;

drop table DETALLE_FACTURA;

drop index RELATIONSHIP_5_FK;

drop index FACTURA_PK;

drop table FACTURA;

drop index RELATIONSHIP_1_FK;

drop index INCIDENCIA_PK;

drop table INCIDENCIA;

drop index RELATIONSHIP_2_FK;

drop index SERVICIO_MUDANZA_PK;

drop table SERVICIO_MUDANZA;

drop index TIENDA_PK;

drop table TIENDA;

drop index RELATIONSHIP_7_FK;

drop index VEHICULO_PK;

drop table VEHICULO;

/*==============================================================*/
/* Table: ASESOR                                                */
/*==============================================================*/
create table ASESOR (
   ID_ASESOR            NUMERIC              not null,
   ID_TIENDA            NUMERIC              not null,
   CEDULA_ASESOR        VARCHAR(10)          null,
   NOMBRE_ASESOR        TEXT                 null,
   APELL_ASESOR         TEXT                 null,
   DIRECCION_ASESOR     TEXT                 null,
   TLF_ASESOR           VARCHAR(10)          null,
   FECHA_INGRESO        DATE                 null,
   constraint PK_ASESOR primary key (ID_ASESOR)
);

/*==============================================================*/
/* Index: ASESOR_PK                                             */
/*==============================================================*/
create unique index ASESOR_PK on ASESOR (
ID_ASESOR
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on ASESOR (
ID_TIENDA
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMERIC              not null,
   CEDULA_CLIENTE       VARCHAR(10)          null,
   NOMBRE_CLIENTE       TEXT                 null,
   APELL_CLIENTE        TEXT                 null,
   DIRECCION_CLIENTE    TEXT                 null,
   TLF_CLIENTE          VARCHAR(10)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: DETALLE_FACTURA                                       */
/*==============================================================*/
create table DETALLE_FACTURA (
   ID_FACTURA           NUMERIC              not null,
   NUM_DETALLE          NUMERIC              not null,
   ID_MUDANZA           NUMERIC              not null,
   CANTIDAD_ART         NUMERIC              null,
   PRECIO_UNITARIO      DECIMAL              null,
   MONTO                DECIMAL              null,
   constraint PK_DETALLE_FACTURA primary key (ID_FACTURA, NUM_DETALLE)
);

/*==============================================================*/
/* Index: DETALLE_FACTURA_PK                                    */
/*==============================================================*/
create unique index DETALLE_FACTURA_PK on DETALLE_FACTURA (
ID_FACTURA,
NUM_DETALLE
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on DETALLE_FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on DETALLE_FACTURA (
ID_MUDANZA
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           NUMERIC              not null,
   ID_CLIENTE           NUMERIC              not null,
   SUBTOTAL             DECIMAL              null,
   IVA                  DECIMAL              null,
   TOTAL                DECIMAL              null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on FACTURA (
ID_CLIENTE
);

/*==============================================================*/
/* Table: INCIDENCIA                                            */
/*==============================================================*/
create table INCIDENCIA (
   ID_INCIDENCIA        NUMERIC              not null,
   ID_MUDANZA           NUMERIC              null,
   NOMBRE_INCIDENCIA    TEXT                 null,
   constraint PK_INCIDENCIA primary key (ID_INCIDENCIA)
);

/*==============================================================*/
/* Index: INCIDENCIA_PK                                         */
/*==============================================================*/
create unique index INCIDENCIA_PK on INCIDENCIA (
ID_INCIDENCIA
);

/*==============================================================*/
/* Index: RELATIONSHIP_1_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_1_FK on INCIDENCIA (
ID_MUDANZA
);

/*==============================================================*/
/* Table: SERVICIO_MUDANZA                                      */
/*==============================================================*/
create table SERVICIO_MUDANZA (
   ID_MUDANZA           NUMERIC              not null,
   ID_ASESOR            NUMERIC              not null,
   PESO_MUDANZA         CHAR(10)             null,
   AVALUO_MUDANZA       NUMERIC              null,
   FECHAINICIO_MUDANZA  TIMESTAMP            null,
   FECHAFINAL_MUDANZA   TIMESTAMP            null,
   CIUDAD_MUDANZA       TEXT                 null,
   constraint PK_SERVICIO_MUDANZA primary key (ID_MUDANZA)
);

/*==============================================================*/
/* Index: SERVICIO_MUDANZA_PK                                   */
/*==============================================================*/
create unique index SERVICIO_MUDANZA_PK on SERVICIO_MUDANZA (
ID_MUDANZA
);

/*==============================================================*/
/* Index: RELATIONSHIP_2_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_2_FK on SERVICIO_MUDANZA (
ID_ASESOR
);

/*==============================================================*/
/* Table: TIENDA                                                */
/*==============================================================*/
create table TIENDA (
   ID_TIENDA            NUMERIC              not null,
   DESCRIPCION_TIENDA   TEXT                 null,
   CIUDAD_TIENDA        TEXT                 null,
   constraint PK_TIENDA primary key (ID_TIENDA)
);

/*==============================================================*/
/* Index: TIENDA_PK                                             */
/*==============================================================*/
create unique index TIENDA_PK on TIENDA (
ID_TIENDA
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   ID_VEHICULO          NUMERIC              not null,
   ID_ASESOR            NUMERIC              not null,
   MARCA_VEHICULO       TEXT                 null,
   MODELO_VEHICULO      TEXT                 null,
   constraint PK_VEHICULO primary key (ID_VEHICULO)
);

/*==============================================================*/
/* Index: VEHICULO_PK                                           */
/*==============================================================*/
create unique index VEHICULO_PK on VEHICULO (
ID_VEHICULO
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on VEHICULO (
ID_ASESOR
);

alter table ASESOR
   add constraint FK_ASESOR_RELATIONS_TIENDA foreign key (ID_TIENDA)
      references TIENDA (ID_TIENDA)
      on delete restrict on update restrict;

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_SERVICIO foreign key (ID_MUDANZA)
      references SERVICIO_MUDANZA (ID_MUDANZA)
      on delete restrict on update restrict;

alter table DETALLE_FACTURA
   add constraint FK_DETALLE__RELATIONS_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RELATIONS_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table INCIDENCIA
   add constraint FK_INCIDENC_RELATIONS_SERVICIO foreign key (ID_MUDANZA)
      references SERVICIO_MUDANZA (ID_MUDANZA)
      on delete restrict on update restrict;

alter table SERVICIO_MUDANZA
   add constraint FK_SERVICIO_RELATIONS_ASESOR foreign key (ID_ASESOR)
      references ASESOR (ID_ASESOR)
      on delete restrict on update restrict;

alter table VEHICULO
   add constraint FK_VEHICULO_RELATIONS_ASESOR foreign key (ID_ASESOR)
      references ASESOR (ID_ASESOR)
      on delete restrict on update restrict;

