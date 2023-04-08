DROP TABLE Netflix_Actor CASCADE CONSTRAINTS;
DROP TABLE Netflix_Genre CASCADE CONSTRAINTS;
DROP TABLE netflix_language CASCADE CONSTRAINTS;
DROP TABLE netflix_movie CASCADE CONSTRAINTS;
DROP TABLE NETFLIX_MOVIE_ACTORS CASCADE CONSTRAINTS;
DROP TABLE Netflix_Movie_Genre CASCADE CONSTRAINTS;
DROP TABLE netflix_reactions CASCADE CONSTRAINTS;
DROP TABLE Netflix_TVSHOW CASCADE CONSTRAINTS;
DROP TABLE NETFLIX_USER CASCADE CONSTRAINTS;
DROP TABLE netflix_movie_user_reaction CASCADE CONSTRAINTS;
DROP TABLE Netflix_Episodes CASCADE CONSTRAINTS;
DROP TABLE Netflix_TVSHOW_user_reaction CASCADE CONSTRAINTS;
DROP TABLE NETFLIX_TVSHOWEPISODE_ACTORS CASCADE CONSTRAINTS;
DROP TABLE Netflix_TVShow_Genre CASCADE CONSTRAINTS;

DROP SEQUENCE actor_seq ;
Drop SEQUENCE language_seq;
DROP SEQUENCE genre_seq;
DROP SEQUENCE movie_seq;
DROP SEQUENCE tvshow_id_seq;
DROP SEQUENCE user_seq;
DROP SEQUENCE episode_seq;

CREATE TABLE Netflix_Actor (
    ActorId NUMBER PRIMARY KEY,
    Name VARCHAR2(100),
    Gender VARCHAR(20),
    Age NUMBER
);

CREATE TABLE Netflix_Genre (
    genreId NUMBER(3) PRIMARY KEY,
    genreName VARCHAR2(25)
);

CREATE TABLE netflix_language (
  languageID NUMBER(10) PRIMARY KEY,
  name VARCHAR2(30)
);

CREATE TABLE netflix_movie (
  movieID NUMBER(10) PRIMARY KEY,
  Title VARCHAR2(40) NOT NULL,
  Rating VARCHAR2(10),
  Like_count NUMBER(10),
  Dislike_count NUMBER(10),
  CHECK (Rating > 0 AND Rating < 10),
  languageID NUMBER(10),
  CONSTRAINT FK_movieId_movies FOREIGN KEY (languageID) REFERENCES netflix_language(languageID)
);

CREATE TABLE NETFLIX_MOVIE_ACTORS (
    MovieId NUMBER,
    ActorId NUMBER,
    CONSTRAINT FK_MovieActors_Movies FOREIGN KEY (MovieId) REFERENCES netflix_movie(movieID),
    CONSTRAINT FK_MovieActors_Actors FOREIGN KEY (ActorId) REFERENCES Netflix_Actor(ActorId)
);

CREATE TABLE Netflix_Movie_Genre (
    movieID NUMBER,
    genreId NUMBER,
    CONSTRAINT FK_movieId FOREIGN KEY (movieID) REFERENCES netflix_movie(movieID),
    CONSTRAINT FK_genreId FOREIGN KEY (genreId) REFERENCES Netflix_Genre(genreId)
);

CREATE TABLE netflix_reactions (
  ReactionID NUMBER PRIMARY KEY,
  name VARCHAR2(7) NOT NULL
);

CREATE TABLE Netflix_TVSHOW (
    TVShowId NUMBER PRIMARY KEY,
    TVShowName VARCHAR2(50),
    TVShowDescription VARCHAR2(400)
);

CREATE TABLE NETFLIX_USER (
    userId NUMBER PRIMARY KEY,
    firstName VARCHAR2(30),
    lastName VARCHAR2(30),
    emailAddress VARCHAR2(100),
    hashPassword VARCHAR2(200),
    age NUMBER(3, 0)
);




CREATE TABLE netflix_movie_user_reaction (
    movieID NUMBER(10),
    reactionID NUMBER(10),
    userID NUMBER(10),
    CONSTRAINT FK_movieId_movie FOREIGN KEY (movieID) REFERENCES netflix_movie(movieID),
    CONSTRAINT FK_reactionID_reaction FOREIGN KEY (reactionID) REFERENCES netflix_reactions(ReactionID),
    CONSTRAINT FK_userID_reaction FOREIGN KEY (userID) REFERENCES NETFLIX_USER(userId)
);



CREATE TABLE Netflix_Episodes (
    EpisodeId NUMBER,
    TVShowId NUMBER,
    EpisodeDescription VARCHAR2(500),
    SeasonNumber NUMBER,
    CONSTRAINT PK_EPISODE_TVSHOW PRIMARY KEY (EpisodeId, TVShowId),
    CONSTRAINT FK_TVSHOW_EPISODES FOREIGN KEY (TVShowId) REFERENCES Netflix_TVSHOW(TVShowId)
);

CREATE TABLE Netflix_TVSHOW_user_reaction (
    TVshowId NUMBER(10),
    reactionID Number(10),
    userId NUMBER(10),
    CONSTRAINT FK_tvshowId_tvshow_TVSHOW FOREIGN KEY (TVshowId) REFERENCES Netflix_TVSHOW(TVShowId),
    CONSTRAINT FK_reactionID_reaction_TVSHOW FOREIGN KEY (reactionID) REFERENCES netflix_reactions(ReactionID),
    CONSTRAINT FK_userID_reaction_TVSHOW_user FOREIGN KEY (userID) REFERENCES NETFLIX_USER(userId)
);

CREATE TABLE Netflix_TVShowEpisode_actors (
    TVshowId NUMBER,
    EpisodeId Number,
    ActorId NUMBER,
    CONSTRAINT FK_actors_TvShow FOREIGN KEY (TVshowId, EpisodeId) REFERENCES Netflix_Episodes(TVShowId, EpisodeId),
    CONSTRAINT FK_actors_Actors FOREIGN KEY (ActorId) REFERENCES Netflix_Actor(ActorId)
);


CREATE TABLE Netflix_TVShow_Genre (
    TVshowId NUMBER,
    genreId NUMBER,
    CONSTRAINT FK_tvshowId_tvshow FOREIGN KEY (TVshowId) REFERENCES Netflix_TVSHOW(TVShowId),
    CONSTRAINT FK_genreId_genre FOREIGN KEY (genreId) REFERENCES Netflix_Genre(genreId)
);


/*SELECT * FROM Netflix_Movie;
SELECT * FROM Netflix_Actor;
SELECT * FROM netflix_language;
SELECT * FROM Netflix_Genre;
SELECT * FROM NETFLIX_MOVIE_ACTORS;
SELECT * FROM Netflix_Movie_Genre;
SELECT * FROM netflix_reactions;
SELECT * FROM Netflix_TVSHOW;
SELECT * FROM NETFLIX_USER;
SELECT * FROM netflix_movie_user_reaction;
SELECT * FROM Netflix_Episodes;*/

-- procedures
-- add an actor to a movie based on actor's name

-- CREATE TRIGGERS
--trigger 2
CREATE OR REPLACE TRIGGER user_age_check
BEFORE INSERT
   ON netflix_user
FOR EACH ROW
BEGIN
   IF :new.age<=18
   then
      RAISE_APPLICATION_ERROR(-20001,'User age must be greater than 18');
   END IF;

END;
/
--trigger 2

-- Trigger 1
CREATE OR REPLACE TRIGGER user_reaction_update
AFTER INSERT
   ON netflix_movie_user_reaction
FOR EACH ROW
BEGIN
   IF :new.reactionid=1
   then
      UPDATE netflix_movie SET like_count = like_count + 1
      WHERE movieid = :new.movieid;
   END IF;

      IF :new.reactionid=2
   then
      UPDATE netflix_movie SET dislike_count = dislike_count + 1
      WHERE movieid = :new.movieid;
   END IF;

END;
/

--trigger 1

--insert sample data to Netflix_Actor
CREATE SEQUENCE actor_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Netflix_Actor (ActorId, Name, Gender, Age)
VALUES (actor_seq.NEXTVAL, 'Marlon Brando', 'Male', 80);

INSERT INTO Netflix_Actor (ActorId, Name, Gender, Age)
VALUES (actor_seq.NEXTVAL, 'Al Pacino', 'Male', 81);

INSERT INTO Netflix_Actor (ActorId, Name, Gender, Age)
VALUES (actor_seq.NEXTVAL, 'Robert De Niro', 'Male', 78);

INSERT INTO Netflix_Actor (ActorId, Name, Gender, Age)
VALUES (actor_seq.NEXTVAL, 'Meryl Streep', 'Female', 72);

INSERT INTO Netflix_Actor (ActorId, Name, Gender, Age)
VALUES (actor_seq.NEXTVAL, 'Tom Hanks', 'Male', 65);

INSERT INTO Netflix_Actor (ActorId, Name, Gender, Age)
VALUES (actor_seq.NEXTVAL, 'Scarlett Johansson', 'Female', 37);

INSERT INTO Netflix_Actor (ActorId, Name, Gender, Age)
VALUES (actor_seq.NEXTVAL, 'Leonardo DiCaprio', 'Male', 47);

INSERT INTO Netflix_Actor (ActorId, Name, Gender, Age)
VALUES (actor_seq.NEXTVAL, 'Jennifer Lawrence', 'Female', 31);

--insert sample data to netflix_language
CREATE SEQUENCE language_seq START WITH 1 INCREMENT BY 1;
INSERT INTO netflix_language (languageID, name)
VALUES (language_seq.nextval, 'English');

INSERT INTO netflix_language (languageID, name)
VALUES (language_seq.nextval, 'Spanish');

INSERT INTO netflix_language (languageID, name)
VALUES (language_seq.nextval, 'Arabic');

INSERT INTO netflix_language (languageID, name)
VALUES (language_seq.nextval, 'French');

INSERT INTO netflix_language (languageID, name)
VALUES (language_seq.nextval, 'Farsi');

INSERT INTO netflix_language (languageID, name)
VALUES (language_seq.nextval, 'German');

INSERT INTO netflix_language (languageID, name)
VALUES (language_seq.nextval, 'Telugu');

--insert sample data to Netflix_Genre
CREATE SEQUENCE genre_seq START WITH 1 INCREMENT BY 1;
INSERT INTO Netflix_Genre (genreId, genreName)
VALUES (genre_seq.NEXTVAL, 'Action');
INSERT INTO Netflix_Genre (genreId, genreName)
VALUES (genre_seq.NEXTVAL, 'Comedy');
INSERT INTO Netflix_Genre (genreId, genreName)
VALUES (genre_seq.NEXTVAL, 'Drama');
INSERT INTO Netflix_Genre (genreId, genreName)
VALUES (genre_seq.NEXTVAL, 'Horror');
INSERT INTO Netflix_Genre (genreId, genreName)
VALUES (genre_seq.NEXTVAL, 'Romance');
INSERT INTO NETFLIX_GENRE (genreId, genreName)
VALUES (genre_seq.nextval, 'Science-fiction');

--insert sample data to netflix_movie

CREATE SEQUENCE movie_seq START WITH 1 INCREMENT BY 1;

INSERT INTO netflix_movie (movieID, Title, Rating,like_count,dislike_count, languageID)
VALUES (movie_seq.NEXTVAL, 'The Shawshank Redemption', '9.3',0,0,1);

INSERT INTO netflix_movie (movieID, Title, Rating,like_count,dislike_count, languageID)
VALUES (movie_seq.NEXTVAL, 'The Godfather', '9.2',0,0, 2);

INSERT INTO netflix_movie (movieID, Title, Rating,like_count,dislike_count, languageID)
VALUES (movie_seq.NEXTVAL, 'The Dark Knight', '9.0',0,0, 1);

INSERT INTO netflix_movie (movieID, Title, Rating,like_count,dislike_count, languageID)
VALUES (movie_seq.NEXTVAL, '12 Angry Men', '8.9',0,0,3);



--insert sample data to NETFLIX_MOVIE_ACTORS -----------------------------------Fixed
INSERT INTO NETFLIX_MOVIE_ACTORS (movieId, ActorId)
VALUES (2, 1);

INSERT INTO NETFLIX_MOVIE_ACTORS (movieId, ActorId)
VALUES (2, 2);

INSERT INTO NETFLIX_MOVIE_ACTORS (movieId, ActorId)
VALUES (2, 3);

INSERT INTO NETFLIX_MOVIE_ACTORS (movieId, ActorId)
VALUES (4, 7);

INSERT INTO NETFLIX_MOVIE_ACTORS (movieId, ActorId)
VALUES (4, 5);

--insert sample data to Netflix_Movie_Genre----------------------------------------------fixed
INSERT INTO Netflix_Movie_Genre (movieID, genreId)
VALUES (1, 2);
INSERT INTO Netflix_Movie_Genre (movieID, genreId)
VALUES (2, 1);
--insert sample data to netflix_reactions
INSERT INTO netflix_reactions (ReactionID, name)
VALUES (1, 'Like');

INSERT INTO netflix_reactions (ReactionID, name)
VALUES (2, 'Dislike');

SELECT * FROM NETFLIX_GENRE;

--insert sample data to Netflix_TVSHOW
CREATE SEQUENCE tvshow_id_seq START WITH 1 INCREMENT BY 1;
INSERT INTO Netflix_TVSHOW (TVShowId, TVShowName, TVShowDescription)
VALUES
    (tvshow_id_seq.NEXTVAL, 'Stranger Things', 'A group of friends discover supernatural mysteries in their small town.');
    INSERT INTO Netflix_TVSHOW (TVShowId, TVShowName, TVShowDescription)
VALUES
    (tvshow_id_seq.NEXTVAL, 'The Crown', 'A historical drama about the reign of Queen Elizabeth II.');
    INSERT INTO Netflix_TVSHOW (TVShowId, TVShowName, TVShowDescription)
VALUES
    (tvshow_id_seq.NEXTVAL, 'Narcos', 'A crime drama based on the rise of the drug trade in Colombia.');
    INSERT INTO Netflix_TVSHOW (TVShowId, TVShowName, TVShowDescription)
VALUES
    (tvshow_id_seq.NEXTVAL, 'Black Mirror', 'A science-fiction anthology series exploring the dark side of technology.');
    INSERT INTO Netflix_TVSHOW (TVShowId, TVShowName, TVShowDescription)
VALUES
    (tvshow_id_seq.NEXTVAL, 'Breaking Bad', 'A high school chemistry teacher turns to cooking meth to provide for his family.');
    INSERT INTO Netflix_TVSHOW (TVShowId, TVShowName, TVShowDescription)
VALUES
    (tvshow_id_seq.NEXTVAL, 'The Office', 'A mockumentary-style sitcom about the daily lives of office employees.');
    INSERT INTO Netflix_TVSHOW (TVShowId, TVShowName, TVShowDescription)
VALUES
    (tvshow_id_seq.NEXTVAL, 'Game of Thrones', 'A fantasy drama based on the novels by George R.R. Martin.');
    INSERT INTO Netflix_TVSHOW (TVShowId, TVShowName, TVShowDescription)
VALUES
    (tvshow_id_seq.NEXTVAL, 'Friends', 'A sitcom following the lives of six friends in New York City.');
    INSERT INTO Netflix_TVSHOW (TVShowId, TVShowName, TVShowDescription)
VALUES
    (tvshow_id_seq.NEXTVAL, 'The Witcher', 'A fantasy drama based on the book series by Andrzej Sapkowski.');
    INSERT INTO Netflix_TVSHOW (TVShowId, TVShowName, TVShowDescription)
VALUES
    (tvshow_id_seq.NEXTVAL, 'Stranger Things 2', 'The second season of the supernatural mystery series.');

--insert sample data to NETFLIX_USER
CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1;
INSERT INTO NETFLIX_USER (userId, firstName, lastName, emailAddress, hashPassword, age)
VALUES (user_seq.nextval, 'John', 'Doe', 'johndoe@gmail.com', 'hashedpassword', 25);

INSERT INTO NETFLIX_USER (userId, firstName, lastName, emailAddress, hashPassword, age)
VALUES (user_seq.nextval, 'Jane', 'Doe', 'janedoe@gmail.com', 'hashedpassword', 30);

INSERT INTO NETFLIX_USER (userId, firstName, lastName, emailAddress, hashPassword, age)
VALUES (user_seq.nextval, 'Bob', 'Smith', 'bobsmith@gmail.com', 'hashedpassword', 40);

INSERT INTO NETFLIX_USER (userId, firstName, lastName, emailAddress, hashPassword, age)
VALUES (user_seq.nextval, 'Alice', 'Johnson', 'alicejohnson@gmail.com', 'hashedpassword', 35);

INSERT INTO NETFLIX_USER (userId, firstName, lastName, emailAddress, hashPassword, age)
VALUES (user_seq.nextval, 'David', 'Lee', 'davidlee@gmail.com', 'hashedpassword', 28);

INSERT INTO NETFLIX_USER (userId, firstName, lastName, emailAddress, hashPassword, age)
VALUES (user_seq.nextval, 'Amy', 'Chen', 'amychen@gmail.com', 'hashedpassword', 27);

INSERT INTO NETFLIX_USER (userId, firstName, lastName, emailAddress, hashPassword, age)
VALUES (user_seq.nextval, 'Tom', 'Wilson', 'tomwilson@gmail.com', 'hashedpassword', 50);

INSERT INTO NETFLIX_USER (userId, firstName, lastName, emailAddress, hashPassword, age)
VALUES (user_seq.nextval, 'Emily', 'Nguyen', 'emilynguyen@gmail.com', 'hashedpassword', 23);

INSERT INTO NETFLIX_USER (userId, firstName, lastName, emailAddress, hashPassword, age)
VALUES (user_seq.nextval, 'Ryan', 'Kim', 'ryankim@gmail.com', 'hashedpassword', 33);

INSERT INTO NETFLIX_USER (userId, firstName, lastName, emailAddress, hashPassword, age)
VALUES (user_seq.nextval, 'Sara', 'Gonzalez', 'saragonzalez@gmail.com', 'hashedpassword', 29);



--insert sample data to netflix_movie_user_reaction---------------------------------------- fixed
INSERT INTO netflix_movie_user_reaction (movieID, reactionID, userID)
VALUES (1, 1, 1);
INSERT INTO netflix_movie_user_reaction (movieID, reactionID, userID)
VALUES (3, 2, 2);

Select * from netflix_movie;
-- insert 10 rows into Netflix_Episodes
CREATE SEQUENCE episode_seq START WITH 1 INCREMENT BY 1;
INSERT INTO Netflix_Episodes (EpisodeId, TVShowId, EpisodeDescription, SeasonNumber)
VALUES
(episode_seq.nextval, 1, 'Episode 1', 1);
INSERT INTO Netflix_Episodes (EpisodeId, TVShowId, EpisodeDescription, SeasonNumber)
VALUES
(episode_seq.nextval, 1, 'Episode 2', 1);
INSERT INTO Netflix_Episodes (EpisodeId, TVShowId, EpisodeDescription, SeasonNumber)
VALUES
(episode_seq.nextval, 1, 'Episode 3', 1);
INSERT INTO Netflix_Episodes (EpisodeId, TVShowId, EpisodeDescription, SeasonNumber)
VALUES
(episode_seq.nextval, 1, 'Episode 4', 2);
INSERT INTO Netflix_Episodes (EpisodeId, TVShowId, EpisodeDescription, SeasonNumber)
VALUES
(episode_seq.nextval, 1, 'Episode 5', 2);
INSERT INTO Netflix_Episodes (EpisodeId, TVShowId, EpisodeDescription, SeasonNumber)
VALUES
(episode_seq.nextval, 2, 'Episode 1', 1);
INSERT INTO Netflix_Episodes (EpisodeId, TVShowId, EpisodeDescription, SeasonNumber)
VALUES
(episode_seq.nextval, 2, 'Episode 2', 1);
INSERT INTO Netflix_Episodes (EpisodeId, TVShowId, EpisodeDescription, SeasonNumber)
VALUES
(episode_seq.nextval, 2, 'Episode 3', 2);
INSERT INTO Netflix_Episodes (EpisodeId, TVShowId, EpisodeDescription, SeasonNumber)
VALUES
(episode_seq.nextval, 2, 'Episode 4', 2);
INSERT INTO Netflix_Episodes (EpisodeId, TVShowId, EpisodeDescription, SeasonNumber)
VALUES
(episode_seq.nextval, 2, 'Episode 5', 3);
--------------------------------------------update netflix_movie---------------delete last item
/*DELETE FROM Netflix_Movie
WHERE MovieId = 7;*/


-- adding to netflix_tvshow_user_reaction
insert into NETFLIX_TVSHOWEPISODE_ACTORS (TVshowId, EpisodeId, ActorId) VALUES (1, 1, 2);
insert into NETFLIX_TVSHOWEPISODE_ACTORS (TVshowId, EpisodeId, ActorId) VALUES (1, 1, 3);
insert into NETFLIX_TVSHOWEPISODE_ACTORS (TVshowId, EpisodeId, ActorId) VALUES (1, 1, 4);

-- Creating Indexes

CREATE UNIQUE INDEX movie_actor_index
  ON netflix_movie_actors (movieid,actorid);

Select * from netflix_movie_actors a where a.movieid = 2;


CREATE UNIQUE INDEX movie_genre_index
  ON netflix_movie_genre (movieid,genreid);

Select * from netflix_movie_genre a where a.movieid = 2;


-- Create a procedure that takes two strings and inserts them into the database
CREATE OR REPLACE PROCEDURE insert_actor_to_movie (actor_name IN VARCHAR2, movie_name IN VARCHAR2)
AS

BEGIN
    IF check_movie_exists(movie_name) = 0 THEN
--         raise no data found
        raise_application_error(-20001, 'Movie not found');
    END IF;

    IF check_actor_exists(actor_name) = 0 THEN
--         raise no data found
        raise_application_error(-20001, 'Actor not found');
    END IF;

  IF check_actor_movie_exists(actor_name, movie_name) THEN
    DBMS_OUTPUT.PUT_LINE('Actor already exists in movie');
  ELSE
    INSERT INTO NETFLIX_MOVIE_ACTORS (MOVIEID, ACTORID)
    VALUES ((SELECT MOVIEID FROM NETFLIX_MOVIE WHERE title = movie_name), (SELECT ACTORID FROM NETFLIX_ACTOR WHERE name = actor_name));
    DBMS_OUTPUT.PUT_LINE('Actor inserted into movie');
  END IF;
END;


CREATE OR REPLACE FUNCTION check_movie_exists (movie_name IN VARCHAR2)
RETURN NUMBER
IS
  movie_exists NUMBER;
BEGIN
    SELECT COUNT(*) INTO movie_exists FROM netflix_movie WHERE title = movie_name AND ROWNUM = 1;
    RETURN movie_exists;
END;

CREATE OR REPLACE FUNCTION check_actor_exists (actor_name IN VARCHAR2)
RETURN NUMBER
IS
  actor_exists NUMBER;
BEGIN
          SELECT COUNT(*) INTO actor_exists FROM netflix_actor WHERE name = actor_name AND ROWNUM = 1;
          RETURN actor_exists;
END;




-- IF EXISTS(SELECT * FROM NETFLIX_MOVIE_ACTORS WHERE MOVIEID = (SELECT MOVIEID FROM NETFLIX_MOVIE WHERE title = movie_name) AND ACTORID = (SELECT ACTORID FROM NETFLIX_ACTOR WHERE name = actor_name)) THEN
--     DBMS_OUTPUT.PUT_LINE('Actor already exists in movie');
CREATE OR REPLACE FUNCTION check_actor_movie_exists (actor_name IN VARCHAR2, movie_name IN VARCHAR2)
RETURN NUMBER
IS
  actor_movie_exists NUMBER;
      BEGIN
          SELECT COUNT(*) INTO actor_movie_exists FROM netflix_movie_actors WHERE movieid = (SELECT movieid FROM netflix_movie WHERE title = movie_name) AND actorid = (SELECT actorid FROM netflix_actor WHERE name = actor_name) AND ROWNUM = 1;
          RETURN actor_movie_exists;
      END;
