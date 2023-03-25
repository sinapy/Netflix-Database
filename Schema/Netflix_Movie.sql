CREATE TABLE netflix_movie (
  movieID NUMBER(10) PRIMARY KEY,
  Title VARCHAR2(40) NOT NULL ,
  Rating VARCHAR2 (10),
  CHECK(Rating = 'like' OR Rating = 'dislike'),
  languageID NUMBER(10)
)
