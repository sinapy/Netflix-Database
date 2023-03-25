create table Netflix_Movie_Genre(
    CONSTRAINT movieId_FK FOREIGN KEY (movieId),
    CONSTRAINT GenreId_FK FOREIGN KEY (genreId)

);
