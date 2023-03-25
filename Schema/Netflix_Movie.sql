CREATE TABLE netflix_movie (
  movieID NUMBER(10) PRIMARY KEY,
  Title VARCHAR2(40) NOT NULL ,
  Rating VARCHAR2 (10),
  CHECK(Rating > 0 AND Rating < 10),
  languageID NUMBER(10),
  Constraint FK_movieId_movies FOREIGN KEY (languageID) REFERENCES netflix_language(languageID)
)



