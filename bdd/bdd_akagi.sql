#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: user
#------------------------------------------------------------

CREATE TABLE user(
        id_user         int (11) Auto_increment  NOT NULL ,
        email           Varchar (128) NOT NULL ,
        password        Varchar (32) ,
        id_mail_gestion Int NOT NULL ,
        PRIMARY KEY (id_user )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: category
#------------------------------------------------------------

CREATE TABLE category(
        id_category int (11) Auto_increment  NOT NULL ,
        category    Varchar (25) NOT NULL ,
        PRIMARY KEY (id_category )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: events
#------------------------------------------------------------

CREATE TABLE events(
        id_event    int (11) Auto_increment  NOT NULL ,
        name        Varchar (128) NOT NULL ,
        description Text NOT NULL ,
        start_date  Datetime ,
        end_date    Datetime ,
        place       Varchar (128) NOT NULL ,
        confirmed   Bool NOT NULL ,
        PRIMARY KEY (id_event )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: img
#------------------------------------------------------------

CREATE TABLE img(
        id_img   int (11) Auto_increment  NOT NULL ,
        name     Varchar (50) NOT NULL ,
        img_blob Blob NOT NULL ,
        PRIMARY KEY (id_img )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: mail_gestion
#------------------------------------------------------------

CREATE TABLE mail_gestion(
        id_mail_gestion int (11) Auto_increment  NOT NULL ,
        periodicity     Char (1) NOT NULL ,
        PRIMARY KEY (id_mail_gestion )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: users_category
#------------------------------------------------------------

CREATE TABLE users_category(
        id_user     Int NOT NULL ,
        id_category Int NOT NULL ,
        PRIMARY KEY (id_user ,id_category )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: events_img
#------------------------------------------------------------

CREATE TABLE events_img(
        id_event Int NOT NULL ,
        id_img   Int NOT NULL ,
        PRIMARY KEY (id_event ,id_img )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: user_img
#------------------------------------------------------------

CREATE TABLE user_img(
        id_user Int NOT NULL ,
        id_img  Int NOT NULL ,
        PRIMARY KEY (id_user ,id_img )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: interests_category
#------------------------------------------------------------

CREATE TABLE interests_category(
        id_category Int NOT NULL ,
        id_event    Int NOT NULL ,
        PRIMARY KEY (id_category ,id_event )
)ENGINE=InnoDB;

ALTER TABLE user ADD CONSTRAINT FK_user_id_mail_gestion FOREIGN KEY (id_mail_gestion) REFERENCES mail_gestion(id_mail_gestion);
ALTER TABLE users_category ADD CONSTRAINT FK_users_category_id_user FOREIGN KEY (id_user) REFERENCES user(id_user);
ALTER TABLE users_category ADD CONSTRAINT FK_users_category_id_category FOREIGN KEY (id_category) REFERENCES category(id_category);
ALTER TABLE events_img ADD CONSTRAINT FK_events_img_id_event FOREIGN KEY (id_event) REFERENCES events(id_event);
ALTER TABLE events_img ADD CONSTRAINT FK_events_img_id_img FOREIGN KEY (id_img) REFERENCES img(id_img);
ALTER TABLE user_img ADD CONSTRAINT FK_user_img_id_user FOREIGN KEY (id_user) REFERENCES user(id_user);
ALTER TABLE user_img ADD CONSTRAINT FK_user_img_id_img FOREIGN KEY (id_img) REFERENCES img(id_img);
ALTER TABLE interests_category ADD CONSTRAINT FK_interests_category_id_category FOREIGN KEY (id_category) REFERENCES category(id_category);
ALTER TABLE interests_category ADD CONSTRAINT FK_interests_category_id_event FOREIGN KEY (id_event) REFERENCES events(id_event);
