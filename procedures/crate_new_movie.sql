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

--insert sample data to netflix_movie
CREATE SEQUENCE movie_seq START WITH 1 INCREMENT BY 1;

INSERT INTO netflix_movie (movieID, Title, Rating, languageID)
VALUES (movie_seq.NEXTVAL, 'The Shawshank Redemption', '9.3', 1);

INSERT INTO netflix_movie (movieID, Title, Rating, languageID)
VALUES (movie_seq.NEXTVAL, 'The Godfather', '9.2', 2);

INSERT INTO netflix_movie (movieID, Title, Rating, languageID)
VALUES (movie_seq.NEXTVAL, 'The Dark Knight', '9.0', 1);

INSERT INTO netflix_movie (movieID, Title, Rating, languageID)
VALUES (movie_seq.NEXTVAL, '12 Angry Men', '8.9', 3);



--insert sample data to NETFLIX_MOVIE_ACTORS -----------------------------------Fix this????
/*INSERT INTO NETFLIX_MOVIE_ACTORS (movieId, ActorId)
VALUES (movie_seq.CURRVAL, actor_seq.NEXTVAL);

INSERT INTO NETFLIX_MOVIE_ACTORS (movieId, ActorId)
VALUES (movie_seq.CURRVAL, actor_seq.NEXTVAL);

INSERT INTO NETFLIX_MOVIE_ACTORS (movieId, ActorId)
VALUES (movie_seq.CURRVAL, actor_seq.NEXTVAL);

INSERT INTO NETFLIX_MOVIE_ACTORS (movieId, ActorId)
VALUES (movie_seq.CURRVAL, actor_seq.NEXTVAL);

INSERT INTO NETFLIX_MOVIE_ACTORS (movieId, ActorId)
VALUES (movie_seq.CURRVAL, actor_seq.NEXTVAL);*/

--insert sample data to Netflix_Movie_Genre----------------------------------------------fix?
/*INSERT INTO Netflix_Movie_Genre (movieID, genreId)
VALUES (1, 2);
INSERT INTO Netflix_Movie_Genre (movieID, genreId)
VALUES (3, 1);
--insert sample data to netflix_reactions
INSERT INTO netflix_reactions (ReactionID, name)
VALUES (1, 'Like');

INSERT INTO netflix_reactions (ReactionID, name)
VALUES (2, 'Dislike');*/

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

--insert sample data to netflix_movie_user_reaction---------------------------------------- fix ??
/*INSERT INTO netflix_movie_user_reaction (movieID, reactionID, userID)
VALUES (1, 1, 1);
INSERT INTO netflix_movie_user_reaction (movieID, reactionID, userID)
VALUES (2, 2, 2);*/


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
