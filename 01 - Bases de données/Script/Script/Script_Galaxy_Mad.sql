CREATE DATABASE GalaxyMad ;


USE GalaxyMad ;


CREATE TABLE Users(
        id_User                                  int (11) Auto_increment  NOT NULL ,
        username_User                            Varchar (25) NOT NULL ,
        sex_User                                 Varchar (25) ,
        lastname_User                            Varchar (25) ,
        firstname_User                           Varchar (25) ,
        birthday_User                            Date ,
        adress_User                              Varchar (100) ,
        postalcode_User                          Int ,
        city_User                                Varchar (25) ,
        department_User                          Varchar (25) ,
        country_User                             Varchar (25) ,
        celular_User                             Int ,
        phone_User                               Int ,
        email_User                               Varchar (50) NOT NULL ,
        nbr_participation_Concert_User           Int ,
        Musician                                 Bool ,
        type_Musician                            Varchar (25) ,
        XP_Musician                              Varchar (25) ,
        training_Musician                        Varchar (25) ,
        inspiration_Musician                     Varchar (25) ,
        website_Musician                         Varchar (100) ,
        contract_Musician                        Bool ,
        contract_origin_Musician                 Varchar (25) ,
        nbr_participation_Concert_Musician       Int ,
        Volunteer                                Bool ,
        nbr_Participation_Volunteer              Int ,
        Staff                                    Bool ,
        nbr_participation_Concert_Staff          Int ,
        Merchant                                 Bool ,
        name_Merchant                            Varchar (25) ,
        acronyms_Merchant                        Varchar (25) ,
        mission_Merchant                         Varchar (200) ,
        adress_Merchant                          Varchar (100) ,
        postalcode_Merchant                      Int ,
        city_Merchant                            Varchar (25) ,
        department_Merchant                      Varchar (25) ,
        country_Merchant                         Varchar (25) ,
        celular_Merchant                         Int ,
        phone_Merchant                           Int ,
        email_Merchant                           Varchar (50) ,
        website_Merchant                         Varchar (100) ,
        PRIMARY KEY (id_User )
);


CREATE TABLE Association(
        id_Asso         int (11) Auto_increment  NOT NULL ,
        name_Asso       Varchar (25) NOT NULL ,
        acronyms_Asso   Varchar (25) ,
        mission_Asso    Varchar (200) ,
        adress_Asso     Varchar (100) NOT NULL ,
        postalcode_Asso Int NOT NULL ,
        city_Asso       Varchar (25) NOT NULL ,
        department_Asso Varchar (25) NOT NULL ,
        country_Asso    Varchar (25) NOT NULL ,
        celular_Asso    Int ,
        phone_Asso      Int NOT NULL ,
        email_Asso      Varchar (50) NOT NULL ,
        website_Asso    Varchar (100) ,
        PRIMARY KEY (id_Asso )
);


CREATE TABLE Concert(
        id_Concert       int (11) Auto_increment  NOT NULL ,
        name_Concert     Varchar (25) NOT NULL ,
        acronyms_Concert Varchar (25) ,
        date_Concert     Datetime NOT NULL ,
        kind_Concert     Varchar (25) NOT NULL ,
        price_Concert    Double NOT NULL ,
        website_Concert  Varchar (100) ,
        PRIMARY KEY (id_Concert )
);


CREATE TABLE Room(
        id_Room            int (11) Auto_increment  NOT NULL ,
        size_Room          Double ,
        seatingplace_Room  Int ,
        standingplace_Room Int ,
        price_Room         Double ,
        scene_Room         Bool ,
        scenesize_Room     Double ,
        standing_Room      Varchar (25) ,
        id_Theater         Int NOT NULL ,
        PRIMARY KEY (id_Room ) ,
        FOREIGN KEY (id_Theater) REFERENCES Theater(id_Theater)
);


CREATE TABLE Theater(
        id_Theater         int (11) Auto_increment  NOT NULL ,
        name_Theater       Varchar (25) NOT NULL ,
        nbr_room_Theater   Int NOT NULL ,
        adress_Theater     Varchar (100) NOT NULL ,
        postalcode_Theater Int NOT NULL ,
        city_Theater       Varchar (25) NOT NULL ,
        department_Theater Varchar (25) NOT NULL ,
        country_Theater    Varchar (25) NOT NULL ,
        celular_Theater    Int ,
        phone_Theater      Int NOT NULL ,
        email_Theater      Varchar (50) NOT NULL ,
        website_Theater    Varchar (100) ,
        PRIMARY KEY (id_Theater )
);


CREATE TABLE Band(
        id_Band          int (11) Auto_increment  NOT NULL ,
        name_Band        Varchar (25) NOT NULL ,
        acronyms_Band    Varchar (25) ,
        kind_Band        Varchar (25) NOT NULL ,
        description_Band Varchar (200) ,
        city_Band        Varchar (25) NOT NULL ,
        department_Band  Varchar (25) NOT NULL ,
        Website_Band     Varchar (100) ,
        PRIMARY KEY (id_Band )
);


CREATE TABLE Oeuvre(
        id_Oeuvre     int (11) Auto_increment  NOT NULL ,
        name_Oeuvre   Varchar (25) NOT NULL ,
        time_Oeuvre   Time NOT NULL ,
        lyrics_Oeuvre Varchar (20000) ,
        PRIMARY KEY (id_Oeuvre )
);


CREATE TABLE Discography(
        id_Disc             int (11) Auto_increment  NOT NULL ,
        name_Disc           Varchar (25) NOT NULL ,
        recording_date_Disc Date NOT NULL ,
        release_date_Disc   Date NOT NULL ,
        PRIMARY KEY (id_Disc )
);


CREATE TABLE Instrument(
        id_instrument   int (11) Auto_increment  NOT NULL ,
        name_instrument Varchar (25) NOT NULL ,
        PRIMARY KEY (id_instrument )
);


CREATE TABLE Style(
        id_Style   int (11) Auto_increment  NOT NULL ,
        name_Style Varchar (25) NOT NULL ,
        PRIMARY KEY (id_Style )
);


CREATE TABLE Speciality(
        id_Spe      int (11) Auto_increment  NOT NULL ,
        name_Spe    Varchar (25) NOT NULL ,
        mission_Spe Varchar (2000) ,
        PRIMARY KEY (id_Spe )
);


CREATE TABLE BeMemberOf(
        id_User Int NOT NULL ,
        id_Asso Int NOT NULL ,
        PRIMARY KEY (id_User ,id_Asso ) ,
        FOREIGN KEY (id_User) REFERENCES Users(id_User) ,
        FOREIGN KEY (id_Asso) REFERENCES Association(id_Asso)
);


CREATE TABLE Arrange(
        id_User    Int NOT NULL ,
        id_Concert Int NOT NULL ,
        PRIMARY KEY (id_User ,id_Concert ) ,
        FOREIGN KEY (id_User) REFERENCES Users(id_User) ,
        FOREIGN KEY (id_Concert) REFERENCES Concert(id_Concert)
);


CREATE TABLE Participate(
        id_Concert   Int NOT NULL ,
        id_Theater   Int NOT NULL ,
        id_Band      Int NOT NULL ,
        id_User      Int NOT NULL ,
        PRIMARY KEY (id_Concert ,id_Theater ,id_Band ,id_User ) ,
        FOREIGN KEY (id_Concert) REFERENCES Concert(id_Concert) ,
        FOREIGN KEY (id_Theater) REFERENCES Theater(id_Theater) ,
        FOREIGN KEY (id_Band) REFERENCES Band(id_Band) ,
        FOREIGN KEY (id_User) REFERENCES Users(id_User)
);


CREATE TABLE Manage(
        id_User    Int NOT NULL ,
        id_Theater Int NOT NULL ,
        PRIMARY KEY (id_User ,id_Theater ) ,
        FOREIGN KEY (id_User) REFERENCES Users(id_User) ,
        FOREIGN KEY (id_Theater) REFERENCES Theater(id_Theater)
);


CREATE TABLE BeAPartOf(
        id_User Int NOT NULL ,
        id_Band Int NOT NULL ,
        PRIMARY KEY (id_User ,id_Band ) ,
        FOREIGN KEY (id_User) REFERENCES Users(id_User) ,
        FOREIGN KEY (id_Band) REFERENCES Band(id_Band)
);


CREATE TABLE Compose(
        id_User   Int NOT NULL ,
        id_Oeuvre Int NOT NULL ,
        PRIMARY KEY (id_User ,id_Oeuvre ) ,
        FOREIGN KEY (id_User) REFERENCES Users(id_User) ,
        FOREIGN KEY (id_Oeuvre) REFERENCES Oeuvre(id_Oeuvre)
);


CREATE TABLE Have(
        id_Band   Int NOT NULL ,
        id_Oeuvre Int NOT NULL ,
        PRIMARY KEY (id_Band ,id_Oeuvre ) ,
        FOREIGN KEY (id_Band) REFERENCES Band(id_Band) ,
        FOREIGN KEY (id_Oeuvre) REFERENCES Oeuvre(id_Oeuvre)
);


CREATE TABLE Include(
        id_Oeuvre Int NOT NULL ,
        id_Disc   Int NOT NULL ,
        PRIMARY KEY (id_Oeuvre ,id_Disc ) ,
        FOREIGN KEY (id_Oeuvre) REFERENCES Oeuvre(id_Oeuvre) ,
        FOREIGN KEY (id_Disc) REFERENCES Discography(id_Disc)
);


CREATE TABLE Organize(
        id_Asso    Int NOT NULL ,
        id_Concert Int NOT NULL ,
        PRIMARY KEY (id_Asso ,id_Concert ) ,
        FOREIGN KEY (id_Asso) REFERENCES Association(id_Asso) ,
        FOREIGN KEY (id_Concert) REFERENCES Concert(id_Concert)
);


CREATE TABLE Play(
        id_User       Int NOT NULL ,
        id_instrument Int NOT NULL ,
        PRIMARY KEY (id_User ,id_instrument ) ,
        FOREIGN KEY (id_User) REFERENCES Users(id_User) ,
        FOREIGN KEY (id_instrument) REFERENCES Instrument(id_instrument)
);


CREATE TABLE BandStyle(
        id_Band  Int NOT NULL ,
        id_Style Int NOT NULL ,
        PRIMARY KEY (id_Band ,id_Style ) ,
        FOREIGN KEY (id_Band) REFERENCES Band(id_Band) ,
        FOREIGN KEY (id_Style) REFERENCES Style(id_Style)
);


CREATE TABLE EventStyle(
        id_Style   Int NOT NULL ,
        id_Concert Int NOT NULL ,
        PRIMARY KEY (id_Style ,id_Concert ) ,
        FOREIGN KEY (id_Style) REFERENCES Style(id_Style) ,
        FOREIGN KEY (id_Concert) REFERENCES Concert(id_Concert)
);


CREATE TABLE Role(
        id_User Int NOT NULL ,
        id_Spe  Int NOT NULL ,
        PRIMARY KEY (id_User ,id_Spe ) ,
        FOREIGN KEY (id_User) REFERENCES Users(id_User) ,
        FOREIGN KEY (id_Spe) REFERENCES Speciality(id_Spe)
);