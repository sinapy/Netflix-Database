CREATE TABLE netflix_movie_user_reaction(
    movieID NUMBER(10),
    reactionID NUMBER(10),
    userID NUMBER(10),    
    Constraint FK_movieId_movie FOREIGN KEY (movieID) REFERENCES netflix_movie(movieID),
    Constraint FK_reactionID_reaction FOREIGN KEY (reactionID) REFERENCES netflix_reactions(ReactionID),
    Constraint FK_userID_reaction FOREIGN KEY (userID) REFERENCES netflix_users(id)
    )
