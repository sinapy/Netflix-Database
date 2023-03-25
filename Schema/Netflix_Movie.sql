CREATE TABLE netflix_movie (
  movieID NUMBER(10) PRIMARY KEY,
  Title VARCHAR2(40) NOT NULL ,
  Rating NUMBER (1,1),
  CHECK(Rating > 0 AND Rating < 10),

  languageID NUMBER(10)
)
