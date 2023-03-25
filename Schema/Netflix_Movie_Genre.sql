CREATE TABLE Netflix_Movie_Genre(
    movieID NUMBER,
    genreId NUMBER,
    CONSTRAINT FK_movieId FOREIGN KEY (movieID) REFERENCES Netflix_Movie(movieID),
    CONSTRAINT FK_genreId FOREIGN KEY (genreId) REFERENCES Netflix_Genre(genreId)
);

