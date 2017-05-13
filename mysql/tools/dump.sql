CREATE DATABASE IF NOT EXISTS `tetra_track_test`
  DEFAULT CHARACTER SET latin1;

USE `tetra_track_test`;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `ID_EMPRESA`    INT(11)     NOT NULL AUTO_INCREMENT,
  `NOME_FANTASIA` VARCHAR(30) NOT NULL,
  `CNPJ`          VARCHAR(14) NOT NULL,
  `CODIGO_RM`     VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID_EMPRESA`),
  UNIQUE KEY `ID_EMPRESA_UNIQUE` (`ID_EMPRESA`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `ID_CONTRATO`      INT(11)     NOT NULL AUTO_INCREMENT,
  `FK_EMPRESA`       INT(11)     NOT NULL,
  `NUMERO_CONTRATO`  VARCHAR(30) NOT NULL,
  `LOGOMARCA`        VARCHAR(100)         DEFAULT NULL,
  `LATITUDE`         DOUBLE               DEFAULT NULL,
  `LONGITUDE`        DOUBLE               DEFAULT NULL,
  `ZOOM`             DOUBLE               DEFAULT NULL,
  `ATIVO`            TINYINT(1)  NOT NULL DEFAULT '1',
  `QUANTIDADE_LOGIN` INT(11)     NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_CONTRATO`),
  UNIQUE KEY `IDEMPRESA_UNIQUE` (`ID_CONTRATO`),
  KEY `fk_Contrato_Empresa1_idx` (`FK_EMPRESA`),
  CONSTRAINT `fk_Contrato_Empresa1` FOREIGN KEY (`FK_EMPRESA`) REFERENCES `empresa` (`ID_EMPRESA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 25
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_list`
--

DROP TABLE IF EXISTS `event_list`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_list` (
  `id_event_list`  INT(11)      NOT NULL AUTO_INCREMENT,
  `reference_name` VARCHAR(255) NOT NULL,
  `universe`       VARCHAR(255) NOT NULL,
  `target`         VARCHAR(255) NOT NULL,
  `event`          VARCHAR(255) NOT NULL,
  `active`         TINYINT(1)   NOT NULL DEFAULT '1',
  `usable`         TINYINT(1)   NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_event_list`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_queue_settings`
--

DROP TABLE IF EXISTS `event_queue_settings`;
CREATE TABLE `event_queue_settings` (
  `id`          INT(11)      NOT NULL AUTO_INCREMENT,
  `exchange`    VARCHAR(255) NOT NULL,
  `routing`     VARCHAR(255) NOT NULL,
  `queue`       VARCHAR(255) NOT NULL,
  `error_queue` VARCHAR(255) NOT NULL,
  `retry`       INT(11)      NOT NULL,
  `threads`     INT(11)               DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

--
-- Table structure for table `localizacao`
--

DROP TABLE IF EXISTS `localizacao`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localizacao` (
  `ID`                     VARCHAR(30) NOT NULL,
  `TIPO_SISTEMA`           VARCHAR(30) NOT NULL,
  `SISTEMA`                VARCHAR(30) NOT NULL,
  `DATA_CRIACAO`           DATETIME     DEFAULT NULL,
  `DATA_LOCALIZACAO`       DATETIME    NOT NULL,
  `LATITUDE`               DOUBLE       DEFAULT NULL,
  `LONGITUDE`              DOUBLE       DEFAULT NULL,
  `VELOCIDADE`             DOUBLE       DEFAULT NULL,
  `PRECISAO`               DOUBLE       DEFAULT NULL,
  `DIRECAO`                DOUBLE       DEFAULT NULL,
  `ENDERECO`               VARCHAR(255) DEFAULT NULL,
  `FK_USUARIO`             INT(11)      DEFAULT NULL,
  `DESCRICAO_USUARIO`      VARCHAR(140) DEFAULT NULL,
  `FK_CONTRATO`            INT(11)      DEFAULT NULL,
  `FK_RADIO`               INT(11)      DEFAULT NULL,
  `FK_TIPO_USUARIO`        INT(11)      DEFAULT NULL,
  `DESCRICAO_TIPO_USUARIO` VARCHAR(250) DEFAULT NULL,
  `CODIGO_CONTRATO`        VARCHAR(250) DEFAULT NULL,
  `FK_EMPRESA`             INT(11)      DEFAULT NULL,
  `DESCRICAO_EMPRESA`      VARCHAR(250) DEFAULT NULL,
  `FK_SISTEMA`             INT(11)      DEFAULT NULL,
  `DESCRICAO_SISTEMA`      VARCHAR(30)  DEFAULT NULL,
  `FK_TIPO_SISTEMA`        INT(11)      DEFAULT NULL,
  `DESCRICAO_TIPO_SISTEMA` VARCHAR(30)  DEFAULT NULL,
  PRIMARY KEY (`ID`, `SISTEMA`, `TIPO_SISTEMA`, `DATA_LOCALIZACAO`),
  KEY `user_location_index` (`FK_USUARIO`, `FK_CONTRATO`, `DATA_LOCALIZACAO`),
  KEY `user_type_location_index` (`FK_TIPO_USUARIO`, `FK_CONTRATO`, `DATA_LOCALIZACAO`),
  KEY `radio_location_index` (`FK_RADIO`, `FK_CONTRATO`, `DATA_LOCALIZACAO`),
  KEY `velocity_location_index` (`VELOCIDADE`, `FK_CONTRATO`, `DATA_LOCALIZACAO`),
  KEY `enterprise_location_index` (`FK_CONTRATO`, `DATA_LOCALIZACAO`),
  KEY `location_date_index` (`DATA_LOCALIZACAO`),
  KEY `latitude_logitude_location_index` (`LATITUDE`, `LONGITUDE`, `FK_CONTRATO`, `DATA_LOCALIZACAO`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `localizacao`
--

DROP TABLE IF EXISTS `localizacao2`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localizacao2` (
  `ID`                     VARCHAR(30) NOT NULL,
  `TIPO_SISTEMA`           VARCHAR(30) NOT NULL,
  `SISTEMA`                VARCHAR(30) NOT NULL,
  `DATA_CRIACAO`           DATETIME     DEFAULT NULL,
  `DATA_LOCALIZACAO`       DATETIME    NOT NULL,
  `LATITUDE`               DOUBLE       DEFAULT NULL,
  `LONGITUDE`              DOUBLE       DEFAULT NULL,
  `VELOCIDADE`             DOUBLE       DEFAULT NULL,
  `PRECISAO`               DOUBLE       DEFAULT NULL,
  `DIRECAO`                DOUBLE       DEFAULT NULL,
  `ENDERECO`               VARCHAR(255) DEFAULT NULL,
  `FK_USUARIO`             INT(11)      DEFAULT NULL,
  `DESCRICAO_USUARIO`      VARCHAR(140) DEFAULT NULL,
  `FK_CONTRATO`            INT(11)      DEFAULT NULL,
  `FK_RADIO`               INT(11)      DEFAULT NULL,
  `FK_TIPO_USUARIO`        INT(11)      DEFAULT NULL,
  `DESCRICAO_TIPO_USUARIO` VARCHAR(250) DEFAULT NULL,
  `CODIGO_CONTRATO`        VARCHAR(250) DEFAULT NULL,
  `FK_EMPRESA`             INT(11)      DEFAULT NULL,
  `DESCRICAO_EMPRESA`      VARCHAR(250) DEFAULT NULL,
  `FK_SISTEMA`             INT(11)      DEFAULT NULL,
  `DESCRICAO_SISTEMA`      VARCHAR(30)  DEFAULT NULL,
  `FK_TIPO_SISTEMA`        INT(11)      DEFAULT NULL,
  `DESCRICAO_TIPO_SISTEMA` VARCHAR(30)  DEFAULT NULL,
  PRIMARY KEY (`ID`, `SISTEMA`, `TIPO_SISTEMA`, `DATA_LOCALIZACAO`),
  KEY `user_location_index` (`FK_USUARIO`, `FK_CONTRATO`, `DATA_LOCALIZACAO`),
  KEY `user_type_location_index` (`FK_TIPO_USUARIO`, `FK_CONTRATO`, `DATA_LOCALIZACAO`),
  KEY `radio_location_index` (`FK_RADIO`, `FK_CONTRATO`, `DATA_LOCALIZACAO`),
  KEY `velocity_location_index` (`VELOCIDADE`, `FK_CONTRATO`, `DATA_LOCALIZACAO`),
  KEY `enterprise_location_index` (`FK_CONTRATO`, `DATA_LOCALIZACAO`),
  KEY `location_date_index` (`DATA_LOCALIZACAO`),
  KEY `latitude_logitude_location_index` (`LATITUDE`, `LONGITUDE`, `FK_CONTRATO`, `DATA_LOCALIZACAO`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_users_login`
--

DROP TABLE IF EXISTS `log_users_login`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_users_login` (
  `ID_LOG_USERS_LOGIN` INT(11)  NOT NULL AUTO_INCREMENT,
  `DATA_CRIACAO`       DATETIME NOT NULL,
  `USERNAME`           VARCHAR(120)      DEFAULT NULL,
  `IP`                 VARCHAR(20)       DEFAULT NULL,
  `LOGIN`              TINYINT(4)        DEFAULT NULL,
  PRIMARY KEY (`ID_LOG_USERS_LOGIN`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1024
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recursos_beta`
--

DROP TABLE IF EXISTS `recursos_beta`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recursos_beta` (
  `id`          INT(11)      NOT NULL AUTO_INCREMENT,
  `name`        VARCHAR(100) NOT NULL,
  `description` TEXT,
  `active`      TINYINT(4)   NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessao_usuario`
--

DROP TABLE IF EXISTS `sessao_usuario`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessao_usuario` (
  `id`     CHAR(32) NOT NULL,
  `expire` INT(11) DEFAULT NULL,
  `data`   LONGBLOB,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_mensagem`
--

DROP TABLE IF EXISTS `status_mensagem`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_mensagem` (
  `ID_STATUS_MENSAGEM` INT(11)     NOT NULL AUTO_INCREMENT,
  `DESCRICAO`          VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_STATUS_MENSAGEM`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `status_set`
--

DROP TABLE IF EXISTS `status_set`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_set` (
  ID_STATUS_SET                     INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  NOME                              VARCHAR(30)         NOT NULL,
  DESCRICAO_DEFAULT                 VARCHAR(30)         NOT NULL,
  IMAGEM_MAPA_DEFAULT               VARCHAR(100)        NOT NULL,
  IMAGEM_MAPA_INATIVO               VARCHAR(100)        NOT NULL,
  IMAGEM_MAPA_DESCONHECIDO          VARCHAR(100)        NOT NULL,
  TTL_IMAGEM_DESCONHECIDO           INT(11),
  HAS_ALARM_IMAGEM_DESCONHECIDO     TINYINT(1)                   DEFAULT '0',
  HAS_ALARM_IMAGEM_INATIVO          TINYINT(1)                   DEFAULT '0',
  ALARM_MESSAGE_IMAGEM_DESCONHECIDO VARCHAR(500),
  ALARM_MESSAGE_IMAGEM_INATIVO      VARCHAR(500),
  FK_CONTRATO                       INT(11),
  STATUS_TRANSBORDADO               INT(11),
  CONSTRAINT status_set_FK_CONTRATO_contrato FOREIGN KEY (FK_CONTRATO) REFERENCES contrato (ID_CONTRATO)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 28
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

CREATE INDEX status_set_FK_CONTRATO_contrato
  ON status_set (FK_CONTRATO);
--
-- Table structure for table `status_set_itens`
--

DROP TABLE IF EXISTS `status_set_itens`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_set_itens` (
  ID_STATUS_SET_ITEM  INT(11) PRIMARY KEY    NOT NULL AUTO_INCREMENT,
  FK_STATUS_SET       INT(11)                NOT NULL,
  CODIGO              INT(11)                NOT NULL,
  DESCRICAO           VARCHAR(30)            NOT NULL,
  IMAGEM_MAPA         VARCHAR(100)           NOT NULL,
  TTL                 INT(11),
  HAS_ALARM           TINYINT(1) DEFAULT '0' NOT NULL,
  ALARM_MESSAGE       VARCHAR(500),
  FK_CONTRATO         INT(11),
  STATUS_TRANSBORDADO INT(11),
  CONSTRAINT status_set_item_transbordo_status_set_item FOREIGN KEY (STATUS_TRANSBORDADO) REFERENCES status_set_itens (ID_STATUS_SET_ITEM),
  CONSTRAINT status_set_itens_contrato_ibfk FOREIGN KEY (FK_CONTRATO) REFERENCES contrato (ID_CONTRATO),
  CONSTRAINT status_set_itens_ibfk_1 FOREIGN KEY (FK_STATUS_SET) REFERENCES status_set (ID_STATUS_SET)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 57
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

ALTER TABLE `status_set` ADD CONSTRAINT status_set_transbordo_status_set_item FOREIGN KEY (STATUS_TRANSBORDADO) REFERENCES status_set_itens (ID_STATUS_SET_ITEM);
CREATE INDEX status_set_transbordo_status_set_item ON status_set (STATUS_TRANSBORDADO);

--
-- Table structure for table `tbl_migration`
--

DROP TABLE IF EXISTS `tbl_migration`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_migration` (
  `version`    VARCHAR(180) NOT NULL,
  `apply_time` INT(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tiposistema`
--

DROP TABLE IF EXISTS `tiposistema`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposistema` (
  `ID_TIPO_SISTEMA` INT(11)     NOT NULL AUTO_INCREMENT,
  `DESCRICAO`       VARCHAR(30) NOT NULL,
  `CODIGO`          VARCHAR(30) NOT NULL,
  PRIMARY KEY (`ID_TIPO_SISTEMA`),
  UNIQUE KEY `ID_TIPO_SISTEMA_UNIQUE` (`ID_TIPO_SISTEMA`),
  UNIQUE KEY `CODIGO` (`CODIGO`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `sistema`
--

DROP TABLE IF EXISTS `sistema`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sistema` (
  `ID_SISTEMA`      INT(11)     NOT NULL AUTO_INCREMENT,
  `FK_TIPO_SISTEMA` INT(11)     NOT NULL,
  `DESCRICAO`       VARCHAR(30) NOT NULL,
  `CODIGO`          VARCHAR(30) NOT NULL,
  PRIMARY KEY (`ID_SISTEMA`),
  UNIQUE KEY `ID_SISTEMA_UNIQUE` (`ID_SISTEMA`),
  UNIQUE KEY `CODIGO_UNIQUE` (`CODIGO`),
  KEY `fk_Sistema_TipoSistema1_idx` (`FK_TIPO_SISTEMA`),
  CONSTRAINT `fk_Sistema_TipoSistema1` FOREIGN KEY (`FK_TIPO_SISTEMA`) REFERENCES `tiposistema` (`ID_TIPO_SISTEMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radio`
--

DROP TABLE IF EXISTS `radio`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radio` (
  `ID_RADIO`    INT(11)     NOT NULL AUTO_INCREMENT,
  `FK_CONTRATO` INT(11)              DEFAULT NULL,
  `FK_SISTEMA`  INT(11)     NOT NULL,
  `ID`          VARCHAR(30) NOT NULL,
  `MODELO`      VARCHAR(100)         DEFAULT NULL,
  `SERIAL`      VARCHAR(100)         DEFAULT NULL,
  `ATIVO`       TINYINT(1)  NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_RADIO`),
  UNIQUE KEY `ID_RADIO_UNIQUE` (`ID_RADIO`),
  UNIQUE KEY `idx_radio_ID_FK_SISTEMA` (`ID`, `FK_SISTEMA`),
  KEY `fk_Radio_Empresa1_idx` (`FK_CONTRATO`),
  KEY `fk_Radio_Sistema1_idx` (`FK_SISTEMA`),
  CONSTRAINT `fk_Radio_Empresa1` FOREIGN KEY (`FK_CONTRATO`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Radio_Sistema1` FOREIGN KEY (`FK_SISTEMA`) REFERENCES `sistema` (`ID_SISTEMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3102
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `talkgroup`
--

DROP TABLE IF EXISTS `talkgroup`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talkgroup` (
  `ID_TALKGROUP` INT(11)     NOT NULL AUTO_INCREMENT,
  `DESCRICAO`    VARCHAR(12) NOT NULL,
  `ID`           VARCHAR(30) NOT NULL,
  `FK_SISTEMA`   INT(11)     NOT NULL,
  `FK_CONTRATO`  INT(11)     NOT NULL,
  PRIMARY KEY (`ID_TALKGROUP`),
  UNIQUE KEY `ID` (`ID`, `FK_SISTEMA`, `FK_CONTRATO`),
  KEY `FK_CONTRATO` (`FK_CONTRATO`),
  KEY `FK_SISTEMA` (`FK_SISTEMA`),
  CONSTRAINT `talkgroup_ibfk_1` FOREIGN KEY (`FK_CONTRATO`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `talkgroup_ibfk_2` FOREIGN KEY (`FK_SISTEMA`) REFERENCES `sistema` (`ID_SISTEMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipousuario`
--

DROP TABLE IF EXISTS `tipousuario`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipousuario` (
  `ID_TIPO_USUARIO` INT(11)     NOT NULL AUTO_INCREMENT,
  `FK_STATUS_SET`   INT(11)     NOT NULL,
  `DESCRICAO`       VARCHAR(30) NOT NULL,
  `FK_CONTRATO`     INT(11)              DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_USUARIO`),
  UNIQUE KEY `ID_TIPO_UNIQUE` (`ID_TIPO_USUARIO`),
  KEY `FK_STATUS_SET` (`FK_STATUS_SET`),
  KEY `tipousuario_FK_CONTRATO_contrato` (`FK_CONTRATO`),
  CONSTRAINT `tipousuario_FK_CONTRATO_contrato` FOREIGN KEY (`FK_CONTRATO`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `tipousuario_ibfk_1` FOREIGN KEY (`FK_STATUS_SET`) REFERENCES `status_set` (`ID_STATUS_SET`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 32
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_access`
--

DROP TABLE IF EXISTS `usergroups_access`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_access` (
  `id`         BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `element`    INT(3)       NOT NULL,
  `element_id` BIGINT(20)   NOT NULL,
  `module`     VARCHAR(140) NOT NULL,
  `controller` VARCHAR(140) NOT NULL,
  `permission` VARCHAR(7)   NOT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_configuration`
--

DROP TABLE IF EXISTS `usergroups_configuration`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_configuration` (
  `id`          BIGINT(20) NOT NULL AUTO_INCREMENT,
  `rule`        VARCHAR(40)         DEFAULT NULL,
  `value`       VARCHAR(20)         DEFAULT NULL,
  `options`     TEXT,
  `description` TEXT,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_cron`
--

DROP TABLE IF EXISTS `usergroups_cron`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_cron` (
  `id`              BIGINT(20) NOT NULL AUTO_INCREMENT,
  `name`            VARCHAR(40)         DEFAULT NULL,
  `lapse`           INT(6)              DEFAULT NULL,
  `last_occurrence` DATETIME            DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_group`
--

DROP TABLE IF EXISTS `usergroups_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_group` (
  `id`        BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `groupname` VARCHAR(120) NOT NULL,
  `level`     INT(6)                DEFAULT NULL,
  `home`      VARCHAR(120)          DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupname` (`groupname`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_lookup`
--

DROP TABLE IF EXISTS `usergroups_lookup`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_lookup` (
  `id`      BIGINT(20) NOT NULL AUTO_INCREMENT,
  `element` VARCHAR(20)         DEFAULT NULL,
  `value`   INT(5)              DEFAULT NULL,
  `text`    VARCHAR(40)         DEFAULT NULL,
  PRIMARY KEY (`id`)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_user`
--

DROP TABLE IF EXISTS `usergroups_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_user` (
  `id`              BIGINT(20)   NOT NULL AUTO_INCREMENT,
  `group_id`        BIGINT(20)            DEFAULT NULL,
  `username`        VARCHAR(120) NOT NULL,
  `password`        VARCHAR(120)          DEFAULT NULL,
  `email`           VARCHAR(120)          DEFAULT NULL,
  `home`            VARCHAR(120)          DEFAULT NULL,
  `status`          TINYINT(1)   NOT NULL DEFAULT '1',
  `question`        TEXT,
  `answer`          TEXT,
  `creation_date`   DATETIME              DEFAULT NULL,
  `activation_code` VARCHAR(30)           DEFAULT NULL,
  `activation_time` DATETIME              DEFAULT NULL,
  `last_login`      DATETIME              DEFAULT NULL,
  `ban`             DATETIME              DEFAULT NULL,
  `ban_reason`      TEXT,
  `fk_contrato`     INT(11)               DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `group_id_idxfk` (`group_id`),
  KEY `fk_User_Contrato1_idx` (`fk_contrato`),
  CONSTRAINT `fk_User_Contrato1` FOREIGN KEY (`fk_contrato`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usergroups_user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `usergroups_group` (`id`)
    ON DELETE CASCADE
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 39
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `recursos_beta_user`
--

DROP TABLE IF EXISTS `recursos_beta_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recursos_beta_user` (
  `id_recurso_beta` INT(11)    NOT NULL,
  `id_user`         BIGINT(20) NOT NULL,
  `active`          TINYINT(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_recurso_beta`, `id_user`),
  KEY `recursos_beta_user_usergroups_user_FK` (`id_user`),
  CONSTRAINT `recursos_beta_user_recursos_beta_FK` FOREIGN KEY (`id_recurso_beta`) REFERENCES `recursos_beta` (`id`),
  CONSTRAINT `recursos_beta_user_usergroups_user_FK` FOREIGN KEY (`id_user`) REFERENCES `usergroups_user` (`id`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `occurrence_configuration`
--

DROP TABLE IF EXISTS `occurrence_configuration`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occurrence_configuration` (
  `id_occurrence_config`  INT(11)      NOT NULL   AUTO_INCREMENT,
  `id_event_list`         INT(11)      NOT NULL,
  `id_contract`           INT(11)      NOT NULL,
  `id_user_created`       BIGINT(20)   NOT NULL,
  `id_last_user_updated`  BIGINT(20)              DEFAULT NULL,
  `has_alarm`             TINYINT(1)   NOT NULL   DEFAULT '0',
  `username_created`      VARCHAR(255) NOT NULL,
  `date_created`          DATETIME     NOT NULL,
  `last_username_updated` VARCHAR(255)            DEFAULT NULL,
  `last_date_updated`     DATETIME                DEFAULT NULL,
  `active`                TINYINT(1)   NOT NULL   DEFAULT '1',
  `tag_color`             MEDIUMINT(8) UNSIGNED   DEFAULT NULL,
  `auto_ack`              TINYINT(1)   NOT NULL   DEFAULT '0',
  `priority`              MEDIUMINT(9) NOT NULL,
  `title`                 VARCHAR(255) NOT NULL,
  `description`           VARCHAR(255)            DEFAULT NULL,
  PRIMARY KEY (`id_occurrence_config`),
  KEY `occurrence_configuration_event_list_fk` (`id_event_list`),
  KEY `occurrence_configuration_contract_fk` (`id_contract`),
  KEY `occurrence_configuration_user_created_fk` (`id_user_created`),
  KEY `occurrence_configuration_last_user_updated_fk` (`id_last_user_updated`),
  CONSTRAINT `occurrence_configuration_contract_fk` FOREIGN KEY (`id_contract`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `occurrence_configuration_event_list_fk` FOREIGN KEY (`id_event_list`) REFERENCES `event_list` (`id_event_list`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `occurrence_configuration_last_user_updated_fk` FOREIGN KEY (`id_last_user_updated`) REFERENCES `usergroups_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `occurrence_configuration_user_created_fk` FOREIGN KEY (`id_user_created`) REFERENCES `usergroups_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `occurrence_field`
--

DROP TABLE IF EXISTS `occurrence_field`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occurrence_field` (
  `id_occurrence_field`  INT(11)      NOT NULL AUTO_INCREMENT,
  `id_occurrence_config` INT(11)      NOT NULL,
  `id_contract`          INT(11)      NOT NULL,
  `field_id`             VARCHAR(255) NOT NULL,
  `field_label`          VARCHAR(255) NOT NULL,
  `field_type`           VARCHAR(255) NOT NULL,
  `max_length`           INT(11)               DEFAULT NULL,
  `min_value`            FLOAT                 DEFAULT NULL,
  `max_value`            FLOAT                 DEFAULT NULL,
  `required`             TINYINT(1)   NOT NULL DEFAULT '0',
  `active`               TINYINT(1)   NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_occurrence_field`),
  KEY `occurrence_field_occurrence_configuration_fk` (`id_occurrence_config`),
  KEY `occurrence_field_contract_fk` (`id_contract`),
  CONSTRAINT `occurrence_field_contract_fk` FOREIGN KEY (`id_contract`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `occurrence_field_occurrence_configuration_fk` FOREIGN KEY (`id_occurrence_config`) REFERENCES `occurrence_configuration` (`id_occurrence_config`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `occurrence_list_field_items`
--

DROP TABLE IF EXISTS occurrence_list_field_items;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE occurrence_list_field_items (
  `id_occurrence_list_field_items` INT(11)      NOT NULL AUTO_INCREMENT,
  `id_occurrence_field`            INT(11)      NOT NULL,
  `id_contract`                    INT(11)      NOT NULL,
  `field_id`                       VARCHAR(255) NOT NULL,
  `field_label`                    VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_occurrence_list_field_items),
  KEY `occurrence_list_field_occurrence_field_fk` (`id_occurrence_field`),
  KEY `occurrence_list_field_contract_fk` (`id_contract`),
  CONSTRAINT `occurrence_list_field_contract_fk` FOREIGN KEY (`id_contract`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `occurrence_list_field_occurrence_field_fk` FOREIGN KEY (`id_occurrence_field`) REFERENCES `occurrence_field` (`id_occurrence_field`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `ID_USUARIO`      INT(11)     NOT NULL AUTO_INCREMENT,
  `FK_CONTRATO`     INT(11)     NOT NULL,
  `FK_RADIO`        INT(11)              DEFAULT NULL,
  `FK_TIPO_USUARIO` INT(11)     NOT NULL DEFAULT '1',
  `DESCRICAO`       VARCHAR(30) NOT NULL,
  `IMAGEM_MAPA`     VARCHAR(100)         DEFAULT NULL,
  `IMAGEM_PAINEL`   VARCHAR(100)         DEFAULT NULL,
  `OBSERVACAO`      VARCHAR(255)         DEFAULT NULL,
  `TRAJETORIA`      TINYINT(4)  NOT NULL DEFAULT '0',
  `ATIVO`           TINYINT(4)  NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID_USUARIO`),
  UNIQUE KEY `ID_USUARIO_UNIQUE` (`ID_USUARIO`),
  UNIQUE KEY `FK_RADIO_2` (`FK_RADIO`),
  KEY `fk_Utilizador_Empresa1_idx` (`FK_CONTRATO`),
  KEY `fk_Utilizador_Tipo1_idx` (`FK_TIPO_USUARIO`),
  KEY `FK_RADIO` (`FK_RADIO`),
  CONSTRAINT `fk_Utilizador_Empresa1` FOREIGN KEY (`FK_CONTRATO`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilizador_Tipo1` FOREIGN KEY (`FK_TIPO_USUARIO`) REFERENCES `tipousuario` (`ID_TIPO_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`FK_RADIO`) REFERENCES `radio` (`ID_RADIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 2350
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensagens`
--

DROP TABLE IF EXISTS `mensagens`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensagens` (
  `ID_MENSAGEM`       INT(11)      NOT NULL AUTO_INCREMENT,
  `FK_USER`           BIGINT(20)   NOT NULL,
  `USER_ORIGEM`       VARCHAR(120)          DEFAULT NULL,
  `FK_USUARIO`        INT(11)      NOT NULL,
  `MENSAGEM`          VARCHAR(140) NOT NULL,
  `STATUS`            INT(11)      NOT NULL,
  `DATA_CRIACAO`      DATETIME     NOT NULL,
  `CHECK_RECEBIDO`    TINYINT(4)   NOT NULL DEFAULT '0',
  `CHECK_LIDO`        TINYINT(4)   NOT NULL DEFAULT '0',
  `DATA_ENVIADO`      DATETIME              DEFAULT NULL,
  `DATA_RECEBIDO`     DATETIME              DEFAULT NULL,
  `DATA_LIDO`         DATETIME              DEFAULT NULL,
  `DATA_ERRO`         DATETIME              DEFAULT NULL,
  `FK_CONTRATO`       INT(11)               DEFAULT NULL,
  `DESCRICAO_USUARIO` VARCHAR(30)  NOT NULL,
  `FK_RADIO`          INT(11)               DEFAULT NULL,
  PRIMARY KEY (`ID_MENSAGEM`),
  KEY `STATUS` (`STATUS`),
  KEY `FK_USUARIO` (`FK_USUARIO`),
  KEY `FK_USER` (`FK_USER`),
  KEY `mensagens_contrato_ibfk` (`FK_CONTRATO`),
  KEY `mensagens_fk_radio_idx` (`FK_RADIO`),
  CONSTRAINT `mensagens_contrato_ibfk` FOREIGN KEY (`FK_CONTRATO`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mensagens_ibfk_3` FOREIGN KEY (`FK_USER`) REFERENCES `usergroups_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mensagens_ibfk_4` FOREIGN KEY (`STATUS`) REFERENCES `status_mensagem` (`ID_STATUS_MENSAGEM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mensagens_ibfk_5` FOREIGN KEY (`FK_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 174
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mensagens_grupo`
--

DROP TABLE IF EXISTS `mensagens_grupo`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensagens_grupo` (
  `ID_MENSAGENS_GRUPO` INT(11)      NOT NULL AUTO_INCREMENT,
  `DATA_CRIACAO`       DATETIME     NOT NULL,
  `MENSAGEM`           VARCHAR(140) NOT NULL,
  `DATA_ENVIADO`       DATETIME              DEFAULT NULL,
  `DATA_ERRO`          DATETIME              DEFAULT NULL,
  `FK_USER`            BIGINT(20)            DEFAULT NULL,
  `FK_TALKGROUP`       INT(11)               DEFAULT NULL,
  `USUARIO_ORIGEM`     VARCHAR(120)          DEFAULT NULL,
  `STATUS`             INT(11)      NOT NULL,
  `FK_CONTRATO`        INT(11)               DEFAULT NULL,
  PRIMARY KEY (`ID_MENSAGENS_GRUPO`),
  KEY `FK_USER` (`FK_USER`),
  KEY `FK_TALKGROUP` (`FK_TALKGROUP`),
  KEY `STATUS` (`STATUS`),
  KEY `mensagens_grupo_contrato_ibfk` (`FK_CONTRATO`),
  CONSTRAINT `mensagens_grupo_contrato_ibfk` FOREIGN KEY (`FK_CONTRATO`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mensagens_grupo_ibfk_1` FOREIGN KEY (`FK_USER`) REFERENCES `usergroups_user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mensagens_grupo_ibfk_2` FOREIGN KEY (`FK_TALKGROUP`) REFERENCES `talkgroup` (`ID_TALKGROUP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `mensagens_grupo_ibfk_3` FOREIGN KEY (`STATUS`) REFERENCES `status_mensagem` (`ID_STATUS_MENSAGEM`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_status_radio`
--

DROP TABLE IF EXISTS `log_status_radio`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_status_radio` (
  `ID`                   VARCHAR(30) NOT NULL,
  `SISTEMA`              VARCHAR(30) NOT NULL,
  `TIPO_SISTEMA`         VARCHAR(30) NOT NULL,
  `DATA_CRIACAO`         DATETIME    NOT NULL,
  `STATUS`               INT(11)     NOT NULL,
  `FK_USUARIO`           INT(11)      DEFAULT NULL,
  `DESCRICAO_USUARIO`    VARCHAR(140) DEFAULT NULL,
  `FK_CONTRATO`          INT(11)      DEFAULT NULL,
  `FK_STATUS_SET`        INT(11)      DEFAULT NULL,
  `DESCRICAO_STATUS_SET` VARCHAR(30)  DEFAULT NULL,
  `FK_RADIO`             INT(11)      DEFAULT NULL,
  `DATA_MENSAGEM`        DATETIME     DEFAULT NULL,
  PRIMARY KEY (`ID`, `TIPO_SISTEMA`, `SISTEMA`, `DATA_CRIACAO`),
  UNIQUE KEY `idx_log_status_radio_ID_SISTEMA_TIPO_SISTEMA_DATA_CRIACAO` (`ID`, `SISTEMA`, `TIPO_SISTEMA`, `DATA_CRIACAO`),
  KEY `log_status_radio_ibfk_1` (`FK_USUARIO`),
  KEY `log_status_radio_contrato_ibfk` (`FK_CONTRATO`),
  KEY `log_status_radio_fk_radio_idx` (`FK_RADIO`),
  KEY `log_status_radio_fk_status_set_idx` (`FK_STATUS_SET`),
  CONSTRAINT `log_status_radio_contrato_ibfk` FOREIGN KEY (`FK_CONTRATO`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `log_status_radio_ibfk_1` FOREIGN KEY (`FK_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historico` (
  `ID_HISTORICO`         INT(11)  NOT NULL AUTO_INCREMENT,
  `FK_EMPRESA`           INT(11)  NOT NULL,
  `FK_CONTRATO`          INT(11)  NOT NULL,
  `FK_TIPO_SISTEMA_ANT`  INT(11)           DEFAULT NULL,
  `FK_TIPO_SISTEMA_PROX` INT(11)           DEFAULT NULL,
  `FK_SISTEMA_ANT`       INT(11)           DEFAULT NULL,
  `FK_SISTEMA_PROX`      INT(11)           DEFAULT NULL,
  `FK_RADIO_ANT`         INT(11)           DEFAULT NULL,
  `FK_RADIO_PROX`        INT(11)           DEFAULT NULL,
  `FK_USUARIO`           INT(11)  NOT NULL,
  `DATA_CRIACAO`         DATETIME NOT NULL,
  PRIMARY KEY (`ID_HISTORICO`),
  UNIQUE KEY `ID_HISTORICO_UNIQUE` (`ID_HISTORICO`),
  KEY `fk_Historico_Contrato1_idx` (`FK_CONTRATO`),
  KEY `fk_Historico_Sistema1_idx` (`FK_SISTEMA_ANT`),
  KEY `fk_Historico_TipoSistema1_idx` (`FK_TIPO_SISTEMA_ANT`),
  KEY `fk_Historico_Radio1_idx` (`FK_SISTEMA_PROX`),
  KEY `fk_Historico_Empresa1_idx` (`FK_EMPRESA`),
  KEY `fk_Historico_TipoUsuario1_idx` (`FK_RADIO_ANT`),
  KEY `fk_Historico_TipoUsuario2_idx` (`FK_RADIO_PROX`),
  KEY `fk_Historico_Usuario2_idx` (`FK_USUARIO`),
  KEY `FK_TIPO_SISTEMA_PROX` (`FK_TIPO_SISTEMA_PROX`),
  CONSTRAINT `fk_Historico_Contrato1` FOREIGN KEY (`FK_CONTRATO`) REFERENCES `contrato` (`ID_CONTRATO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Historico_Empresa1` FOREIGN KEY (`FK_EMPRESA`) REFERENCES `empresa` (`ID_EMPRESA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`FK_TIPO_SISTEMA_ANT`) REFERENCES `tiposistema` (`ID_TIPO_SISTEMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`FK_SISTEMA_ANT`) REFERENCES `sistema` (`ID_SISTEMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `historico_ibfk_5` FOREIGN KEY (`FK_TIPO_SISTEMA_PROX`) REFERENCES `tiposistema` (`ID_TIPO_SISTEMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `historico_ibfk_6` FOREIGN KEY (`FK_SISTEMA_PROX`) REFERENCES `sistema` (`ID_SISTEMA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `historico_ibfk_7` FOREIGN KEY (`FK_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `historico_ibfk_8` FOREIGN KEY (`FK_RADIO_ANT`) REFERENCES `radio` (`ID_RADIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `historico_ibfk_9` FOREIGN KEY (`FK_RADIO_PROX`) REFERENCES `radio` (`ID_RADIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 264
  DEFAULT CHARSET = latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'tetra_track'
--

--
-- Dumping routines for database 'tetra_track'
--
/*!50003 DROP FUNCTION IF EXISTS `RETORNA_OPERADORES_LOGADOS_POR_CONTRATO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `RETORNA_OPERADORES_LOGADOS_POR_CONTRATO`(CONTRATO INT) RETURNS int(11)
READS SQL DATA
  BEGIN

    DECLARE MYSTRING VARCHAR(100);
    DECLARE QUANTIDADE INT;
    DECLARE TAMANHO INT;

    SET TAMANHO = LENGTH(CONTRATO);
    SET MYSTRING = CONCAT("%contrato|s:", TAMANHO, ":\"", CONTRATO, "\";%");

    SELECT COUNT(data) INTO QUANTIDADE FROM sessao_usuario T WHERE T.data LIKE MYSTRING LIMIT 1;

    RETURN QUANTIDADE;

  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `RETORNA_STATUS_RADIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `RETORNA_STATUS_RADIO`(id INT, sistema VARCHAR(30), tipo_sistema VARCHAR(30)) RETURNS int(11)
  RETURN (
    SELECT STATUS

    FROM log_status_radio l

    WHERE 	l.ID = id
           AND l.SISTEMA = sistema
           AND l.TIPO_SISTEMA = tipo_sistema

    ORDER BY l.DATA_CRIACAO DESC

    LIMIT 1
  ) ;;
DELIMITER ;

LOCK TABLES `empresa` WRITE;
INSERT INTO `empresa`
VALUES (1, 'Tester Enterprise', '00000000000000', '000000');
UNLOCK TABLES;


LOCK TABLES `contrato` WRITE;
INSERT INTO `contrato` VALUES
(1, 1, '0000/0000', NULL, NULL, NULL, NULL, 1, 1),
(100, 1, '0002/0002', NULL, NULL, NULL, NULL, 1, 1);
UNLOCK TABLES;

LOCK TABLES `event_list` WRITE;
INSERT INTO `event_list` VALUES
  (1, 'Native.Location.Receive', 'Native', 'Location', 'Receive', 1, 1),
  (2, 'Native.StatusMessage.Receive', 'Native', 'StatusMessage', 'Receive', 1, 1),
  (3, 'Native.Radio.Create', 'Native', 'Radio', 'Create', 1, 1),
  (4, 'Native.Radio.Update', 'Native', 'Radio', 'Update', 1, 1),
  (5, 'Native.Message.Send', 'Native', 'Message', 'Send', 1, 1),
  (6, 'Native.Message.Received', 'Native', 'Message', 'Received', 1, 1),
  (7, 'Native.Message.Read', 'Native', 'Message', 'Read', 1, 1),
  (8, 'Native.Message.Error', 'Native', 'Message', 'Error', 0, 1),
  (9, 'Native.GroupMessage.Send', 'Native', 'GroupMessage', 'Send', 1, 0),
  (10, 'Native.GroupMessage.Error', 'Native', 'GroupMessage', 'Error', 0, 0),
  (11, 'Native.User.Create', 'Native', 'User', 'Create', 1, 1),
  (12, 'Native.User.Update', 'Native', 'User', 'Update', 1, 1),
  (13, 'Native.UserType.Create', 'Native', 'UserType', 'Create', 1, 1),
  (14, 'Native.UserType.Update', 'Native', 'UserType', 'Update', 1, 1),
  (15, 'Native.StatusSet.Create', 'Native', 'StatusSet', 'Create', 1, 1),
  (16, 'Native.StatusSet.Update', 'Native', 'StatusSet', 'Update', 1, 1),
  (17, 'Native.StatusSetItem.Create', 'Native', 'StatusSetItem', 'Create', 1, 0),
  (18, 'Native.StatusSetItem.Update', 'Native', 'StatusSetItem', 'Update', 1, 0),
  (19, 'Native.StatusSetItem.Update', 'Native', 'StatusSetItem', 'Update', 0, 1),
  (20, 'Native.StatusSetItem.Update', 'Native', 'StatusSetItem', 'Update', 0, 1),
  (21, 'Native.StatusSetItem.Update', 'Native', 'StatusSetItem', 'Update', 0, 0),
  (22, 'Native.StatusSetItem.Update', 'Native', 'StatusSetItem', 'Update', 0, 0);
UNLOCK TABLES;

LOCK TABLES `usergroups_group` WRITE;
INSERT INTO `usergroups_group` VALUES
  (1, 'root', 100, NULL),
  (2, 'Operador', 1, '/localizacao'),
  (3, 'Administrador', 98, '/localizacao'),
  (4, 'Gestor', 88, '/localizacao');
UNLOCK TABLES;

LOCK TABLES `usergroups_user` WRITE;
INSERT INTO `usergroups_user` VALUES
  (1, 1, 'rootTester', 'f77031d2f6d6b746ecb50e7f6f6919ae', '', NULL, 4, 'last name', 'abreu', '2015-06-25 14:36:17',
      NULL, NULL, '2016-03-31 00:11:37', NULL, NULL, NULL),
  (2, 2, 'operatorTester', '051fbe220a0bc845a445c33972c3da0e', '', NULL, 4, NULL, NULL, '2015-07-24 13:00:58', NULL,
   NULL, '2015-08-17 01:48:27', NULL, NULL, 1),
  (3, 3, 'admTester', '898207ae529de67d25a44215dface2c8', '', NULL, 4, NULL, NULL, '2015-08-16 22:50:02', NULL, NULL,
   '2016-04-26 23:31:52', NULL, NULL, 1),
  (4, 4, 'managerTester', 'cd708996483c36503841a35e852f96e2', '', NULL, 4, NULL, NULL, '2015-08-24 17:20:52', NULL,
   NULL, '2016-02-27 18:30:33', NULL, NULL, 1),
  (5, 3, 'kofre', '3609b50fc2b19a743652d36ef65a6ab5', 'zehniguem@qualquerdominio.com.br', NULL, 4, 'last name', 'abreu', '2015-08-27 22:39:45', NULL,
   NULL, '2016-03-31 00:11:37', NULL, NULL, 1);
UNLOCK TABLES;

LOCK TABLES `occurrence_configuration` WRITE;
INSERT INTO `occurrence_configuration` VALUES
  (1, 1, 1, 1, NULL, 1, 'rootTester', '2016-05-10 18:53:20', NULL, NULL, 1, 16777215, 0, 25, 'test', ''),
  (2, 1, 1, 1, NULL, 1, 'rootTester', '2016-05-10 18:53:20', NULL, NULL, 0, 0, 0, 25, 'test', ''),
  (3, 1, 1, 1, NULL, 1, 'rootTester', '2016-05-10 18:53:20', NULL, NULL, 1, 0, 0, 25, 'test', '');
UNLOCK TABLES;

LOCK TABLES `occurrence_field` WRITE;
INSERT INTO `occurrence_field` VALUES
  (1, 1, 1, 'id1', 'Responsável', 'list', NULL, NULL, NULL, 0, 1),
  (2, 1, 1, 'id2', 'Data', 'date', NULL, NULL, NULL, 0, 1),
  (4, 1, 1, 'id4', 'Data completa', 'datetime', NULL, NULL, NULL, 0, 1),
  (5, 1, 1, 'id5', 'Verificado', 'boolean', NULL, NULL, NULL, 0, 1),
  (6, 1, 1, 'id6', 'Observação', 'string', 10, NULL, NULL, 1, 1),
  (7, 1, 1, 'id7', 'Quantidade', 'integer', NULL, 2, 5, 1, 1),
  (8, 1, 1, 'id8', 'Custo', 'float', NULL, 49.9, 1000, 0, 1),
  (9, 1, 1, 'id9', 'Inativo Teste', 'float', NULL, 49.9, 1000, 0, 0),
  (10, 2, 1, 'id1', 'Custo', 'float', NULL, 49.9, 1000, 1, 1),
  (11, 3, 1, 'id1', 'Custo', 'float', NULL, 49.9, 1000, 1, 1);
UNLOCK TABLES;

LOCK TABLES occurrence_list_field_items WRITE;
INSERT INTO occurrence_list_field_items VALUES
  (1, 1, 1, '1', 'Funcionário 1'),
  (2, 1, 1, '2', 'Funcionário 2'),
  (3, 1, 1, '3', 'Funcionário 3'),
  (4, 1, 1, '4', 'Funcionário 4');
UNLOCK TABLES;

LOCK TABLES event_queue_settings WRITE;
INSERT INTO event_queue_settings VALUES
  (1, 'Native', 'Native', 'Native', 'Error.Native', 2, 5),
  (2, 'Native', 'Native.Location', 'Native.Location', 'Error.Native.Location', 0, NULL),
  (3, 'Native', 'Native.Location.Receive', 'Native.Location.Receive', 'Error.Native.Location.Receive', 0, 3),
  (4, 'Derivative', 'Derivative.Fence.Inside', 'Derivative.Fence.Inside', 'Error.Derivative.Fence.Inside', 0, 3),
  (5, 'Derivative', 'Derivative.Fence.Outside', 'Derivative.Fence.Outside', 'Error.Derivative.Fence.Outside', 0, 3);
UNLOCK TABLES;

LOCK TABLES tiposistema WRITE;
INSERT INTO tiposistema VALUES
  (1, 'Test', 'TestSystemType'),
  (2, 'SystemTypeTest', 'Tetra');
UNLOCK TABLES;

LOCK TABLES sistema WRITE;
INSERT INTO sistema VALUES
  (1, 1, 'Test', 'TestSystem'),
  (2, 2, 'SystemTest', '724-1121');
UNLOCK TABLES;

LOCK TABLES radio WRITE;
INSERT INTO radio VALUES
  (1, 1, 1, 1000, '', '', 1),
  (2, 1, 1, 1001, '', '', 1),
  (3, 1, 1, 1002, '', '', 1),
  (4, 1, 1, 1003, '', '', 1),
  (5, 1, 1, 1004, '', '', 1),
  (6, 1, 1, 1005, '', '', 1),
  (7, 1, 2, 3000, '', '', 1),
  (8, 1, 2, 5000, '', '', 1),
  (9, null, 2, 8000, '', '', 1),
  (10, 100, 2, 6000, '', '', 1);
UNLOCK TABLES;

LOCK TABLES status_set WRITE;
INSERT INTO status_set VALUES
  (1, 'Set 1', 'Set 1', '/5/file/fcf71cb', '/5/file/f2ace77', '/5/file/33150e4', 1, 0, 0, '', '', 1, NULL),
  (2, 'Set 2', 'Set 2', '/5/file/fce71cb', '/5/file/f2ace77', '/5/file/33150e4', NULL, 0, 0, '', '', 1, NULL),
  (3, 'Set 3', 'Set 3', '/5/file/fce71cb', '/5/file/f2ace77', '/5/file/33150e4', 1, 0, 0, '', '', 1, NULL),
  (4, 'Set 4', 'Set 4', '/5/file/fce71cb', '/5/file/f2ace77', '/5/file/33150e4', 1, 0, 0, '', '', 1, NULL),
  (5, 'Set 5', 'Set 5', '/5/file/fce71cb', '/5/file/f2ace77', '/5/file/33150e4', 1, 0, 0, '', '', 1, NULL),
  (6, 'Set 6', 'Set 6', '/5/file/fce71cb', '/5/file/f2ace77', '/5/file/33150e4', 1, 0, 0, '', '', 1, NULL),
  (7, 'StatusSetTest', 'Ativo', '', '', '', NULL, 0, 0, NULL, NULL, 1, NULL);
UNLOCK TABLES;

LOCK TABLES status_set_itens WRITE;
INSERT INTO status_set_itens VALUES
  (1, 1, 32768, 'Status 0', '/5/file/imagem_status_0', NULL, 0, NULL, 1, NULL),
  (2, 1, 32769, 'Status 1', '/5/file/imagem_status_1', 2, 0, NULL, 1, 1),
  (3, 1, 32770, 'Status 2', '/5/file/imagem_status_2', 4, 0, NULL, 1, 2),
  (4, 1, 32771, 'Status 3', '/5/file/imagem_status_3', 8, 0, NULL, 1, 3),
  (5, 1, 32772, 'Status 4', '/5/file/imagem_status_4', 16, 0, NULL, 1, 4),
  (6, 1, 32773, 'Status 5', '/5/file/imagem_status_5', 32, 0, NULL, 1, 5),
  (7, 1, 32774, 'Status 6', '/5/file/imagem_status_6', 32, 0, NULL, 1, NULL),
  (8, 1, 32775, 'Status 7', '/5/file/imagem_status_7', 64, 0, NULL, 1, NULL),
  (9, 1, 32776, 'Status 8', '/5/file/imagem_status_8', 128, 0, NULL, 1, 8),
  (10, 3, 32777, 'Status 9', '/5/file/imagem_status_9', 256, 0, NULL, 1, NULL),
  (11, 3, 32778, 'Status 10', '/5/file/imagem_status_10', 512, 0, NULL, 1, 10),
  (12, 4, 32779, 'Status 11', '/5/file/imagem_status_11', NULL, 0, NULL, 1, NULL),
  (13, 5, 32780, 'Status 12', '/5/file/imagem_status_12', 1024, 0, NULL, 1, NULL),
  (14, 5, 32781, 'Status 13', '/5/file/imagem_status_13', 2048, 0, NULL, 1, 13),
  (15, 6, 32782, 'Status 14', '/5/file/imagem_status_14', NULL, 0, NULL, 1, NULL),
  (16, 6, 32783, 'Status 15', '/5/file/imagem_status_15', 4096, 0, NULL, 1, 15),
  (17, 7, 32767, 'StatusSetItemTest - 17', '', NULL, 0, NULL, 1, NULL),
  (18, 7, 32768, 'StatusSetItemTest - 18', '', NULL, 0, NULL, 1, NULL),
  (19, 7, 32769, 'StatusSetItemTest - 19', '', NULL, 0, NULL, 1, NULL);
UNLOCK TABLES;

LOCK TABLES status_set WRITE;
  UPDATE status_set SET STATUS_TRANSBORDADO = 10 WHERE ID_STATUS_SET = 3;
  UPDATE status_set SET STATUS_TRANSBORDADO = 12 WHERE ID_STATUS_SET = 4;
  UPDATE status_set SET STATUS_TRANSBORDADO = 14 WHERE ID_STATUS_SET = 5;
  UPDATE status_set SET STATUS_TRANSBORDADO = 16 WHERE ID_STATUS_SET = 6;
UNLOCK TABLES;

LOCK TABLES tipousuario WRITE;
INSERT INTO tipousuario VALUES
  (1, 1, 'TestUserType 1', 1),
  (2, 2, 'TestUserType 2', 1),
  (3, 3, 'TestUserType 3', 1),
  (4, 4, 'TestUserType 4', 1),
  (5, 5, 'TestUserType 5', 1),
  (6, 6, 'TestUserType 6', 1),
  (7, 7, 'UserTypeTest', 1);
UNLOCK TABLES;

LOCK TABLES usuario WRITE;
INSERT INTO usuario VALUES
  (1, 1, 8, 1, 'TestUser 1', '', '', '', 0, 1),
  (2, 1, 2, 2, 'TestUser 2', '', '', '', 0, 1),
  (3, 1, 3, 3, 'TestUser 3', '', '', '', 0, 1),
  (4, 1, 4, 4, 'TestUser 4', '', '', '', 0, 1),
  (5, 1, 5, 5, 'TestUser 5', '', '', '', 0, 1),
  (6, 1, 6, 6, 'TestUser 6', '', '', '', 0, 1),
  (7, 1, 7, 7, 'UserTest', '', '', '', 0, 1),
  (8, 1, 1, 1, 'UserTest 2', '', '', '', 0, 1);
UNLOCK TABLES;

LOCK TABLES talkgroup WRITE;
INSERT INTO talkgroup VALUES
  (1, 'TGTest', 20000, 2, 1);
UNLOCK TABLES;

LOCK TABLES status_mensagem WRITE;
INSERT INTO status_mensagem VALUES
  (1, 'Pendente'),
  (2, 'Falha ao enviar'),
  (3, 'Enviado com sucesso'),
  (4, 'Falha na confirmação do recebimento'),
  (5, 'Recebido com sucesso'),
  (6, 'Falha na confirmação da leitura'),
  (7, 'Lido com sucesso');
UNLOCK TABLES;

LOCK TABLES mensagens WRITE;
INSERT INTO mensagens VALUES
  (1, 2, 'operatorTester', 7, 'Bla-Bla-Bla', 1, '2016-08-01 16:10:40', 0, 0, NULL, NULL, NULL, NULL, 1, 'UserTest', 7);
UNLOCK TABLES;

LOCK TABLES mensagens_grupo WRITE;
INSERT INTO mensagens_grupo VALUES
  (1, '2016-08-01 16:10:40', 'Bla-Bla-Bla', NULL, NULL, 2, 1, 'operatorTester', 1, 1);
UNLOCK TABLES;

LOCK TABLES localizacao WRITE;
INSERT INTO localizacao VALUES
  (5000, 'Tetra', '724-1121', '2016-06-11 04:02:00', '2016-06-11 00:22:00', 47.564565, 14.4564578, 100.0, 51, 58.64, 'Rua dos Bobos', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest',1, 'SystemTypeTest'),
  (5000, 'Tetra', '724-1121', '2016-06-12 03:01:00', '2016-06-11 00:10:00', 46.255241, 13.4534566, 100.0, NULL, 58.64, 'Rua dos Bobos', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (5000, 'Tetra', '724-1121', '2016-06-10 21:00:00', '2016-06-11 00:00:00', 45.222221, 12.1565132, 100.0, 45.21, 58.64, 'Rua dos Bobos', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (5000, 'Tetra', '724-1121', '2016-06-10 21:30:00', '2016-06-11 00:30:00', 48.446846, 15.1976395, 100.0, NULL, 58.64, 'Rua dos Bobos', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (5000, 'Tetra', '724-1121', '2016-08-12 10:01:00', '2016-08-11 11:00:00', 2.1556213, 48.1512654, 90.0, 44.10, 75.51, 'Rua da Dona Baratinha', 1, 'TestUser 2', 1, 4, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (1001, 'Tetra', '724-1121', '2016-09-20 13:01:00', '2016-09-20 16:01:00', 32.245132, 47.4451624, 120.0, 45.22, 54.41, 'Rua da Borboletinha', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (1005, 'Tetra', '724-1121', '2016-06-11 17:05:00', '2016-06-11 00:01:00', 24.515161, 51.4551215, 51.0, 75.58, 86.51, 'Rua da Dona Aranha', 1, 'TestUser 3', 1, 3, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (1001, 'Tetra', '724-1121', '2016-09-25 08:01:00', '2016-09-20 16:30:00', 64.626215, 48.5451202, 220.0, 78.47, 52.64, 'Rua da Peppa Pig', 1, 'TestUser 4', 1, 4, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (1005, 'Tetra', '724-1121', '2016-09-20 21:01:00', '2016-09-20 22:00:00', 89.548411, 54.4115120, 151.0, 21.54, 85.58, 'Rua do Patati Patata', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (1005, 'Tetra', '724-1131', '2016-09-20 21:01:00', '2016-09-20 22:00:00', 89.548411, 54.4115120, 151.0, 21.54, 85.58, 'Rua do Patati Patata', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (3000, 'Tetra', '724-1121', '2016-07-15 09:20:00', '2016-07-15 09:40:00', 58.878451, 85.4845124, 70.0, 44.54, 74.54, 'Rua dos Minios', 1, 'TestUser 3', 3, 3, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (1001, 'Tetra', '724-1121', '2016-07-20 12:00:00', '2016-07-20 17:00:00', 58.878451, 85.4845124, 70.0, 44.54, 74.54, 'Rua dos Minios', 1, 'TestUser 3', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (1000, 'Tetra', '724-1121', '2016-07-11 20:50:00', '2016-07-11 23:50:00', 58.878451, 85.4845124, 15.0, 44.54, 74.54, 'Rua dos Minios', 1, 'TestUser 3', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (1000, 'Tetra', '724-1121', '2016-07-16 09:20:00', '2016-07-15 23:58:00', 58.878451, 85.4845124, 25.0, 44.54, 74.54, 'Rua dos Minios', 1, 'TestUser 3', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (1001, 'Tetra', '724-1121', '2016-07-21 09:20:00', '2016-09-20 20:00:00', 58.878451, 85.4845124, 70.0, 44.54, 74.54, 'Rua dos Minios', 1, 'TestUser 3', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1,'SystemTest', 1, 'SystemTypeTest');
UNLOCK TABLES;

LOCK TABLES localizacao2 WRITE;
INSERT INTO localizacao2 VALUES
  (1000, 'Tetra', '724-1121', '2016-04-10 03:02:00', '2016-06-12 00:00:00', 47.564565, 14.4564578, 10.0, 51, 58.64, null, 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest',1, 'SystemTypeTest'),
  (1000, 'Tetra', '724-1121', '2016-04-10 03:02:00', '2016-06-12 00:04:00', 47.564565, 14.4564578, 20.0, 51, 58.64, 'Rua dos Bobos', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest',1, 'SystemTypeTest'),
  (1000, 'Tetra', '724-1121', '2016-04-10 03:02:00', '2016-06-12 00:08:00', 47.564565, 14.4564578, 30.0, 51, 58.64, 'Rua dos Bobos', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest',1, 'SystemTypeTest'),
  (5000, 'Tetra', '724-1121', '2016-04-10 03:02:00', '2016-06-12 00:22:00', 47.564565, 14.4564578, 200.0, 51, 58.64, 'Rua dos Bobos', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest',1, 'SystemTypeTest'),
  (5000, 'Tetra', '724-1121', '2016-04-10 03:01:00', '2016-06-12 00:10:00', 46.255241, 13.4534566, 300.0, NULL, 58.64, 'Rua dos Bobos', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (5000, 'Tetra', '724-1121', '2016-04-10 03:00:00', '2016-06-12 00:00:00', 45.222221, 12.1565132, 400.0, 45.21, 58.64, 'Rua dos Bobos', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (5000, 'Tetra', '724-1121', '2016-04-10 03:03:00', '2016-06-12 00:30:00', 48.446846, 15.1976395, 20.0, NULL, 58.64, 'Rua dos Bobos', 1, 'TestUser 1', 1, 8, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest'),
  (5000, 'Tetra', '724-1121', '2016-08-11 10:01:00', '2016-08-12 11:00:00', 2.1556213, 48.1512654, 30.0, 44.10, 75.51, 'Rua da Dona Baratinha', 1, 'TestUser 2', 1, 4, 1, 'TestUserType 1', '000000', 1, 'Tester Enterprise', 1, 'SystemTest', 1, 'SystemTypeTest');
UNLOCK TABLES;

LOCK TABLES log_status_radio WRITE;
INSERT INTO log_status_radio VALUES
  (5000, '724-1121', 'Tetra', '2016-06-10 21:22:00', 1, 1, 'TestUser 1', 1, 1, 'Set 1', 8, '2016-06-11 00:22:01'),
  (5000, '724-1121', 'Tetra', '2016-06-10 21:01:00', 1, 1, 'TestUser 1', 1, 1, 'Set 1', 8, '2016-06-11 00:01:00'),
  (5000, '724-1121', 'Tetra', '2016-06-11 17:05:00', 1, 1, 'TestUser 1', 1, 1, 'Set 1', 8, '2016-06-11 00:30:00'),
  (5000, '724-1121', 'Tetra', '2016-06-11 21:01:00', 1, 1, 'TestUser 1', 1, 1, 'Set 1', 8, '2016-06-11 00:31:00'),
  (5000, '724-1121', 'Tetra', '2016-06-11 09:20:00', 1, 1, 'TestUser 1', 1, 1, 'Set 1', 8, null),
  (5000, '724-1121', 'Tetra', '2016-09-19 00:30:00', 1, 1, 'TestUser 1', 1, 1, 'Set 1', 8, '2016-09-19 00:30:00'),
  (5000, '724-1121', 'Tetra', '2016-09-22 22:00:00', 1, 1, 'TestUser 1', 1, 1, 'Set 1', 8, '2016-09-23 00:00:00');
UNLOCK TABLES;