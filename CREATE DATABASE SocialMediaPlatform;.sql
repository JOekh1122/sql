CREATE DATABASE SocialMediaPlatform;
USE SocialMediaPlatform;

CREATE TABLE Interaction (
    InteractionID INT IDENTITY(1,1) PRIMARY KEY,  
    Type VARCHAR(50) NOT NULL,
    InteractionDate DATETIME DEFAULT GETUTCDATE() 
);

CREATE TABLE [User] (   
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE, 
    Gender CHAR(1) NOT NULL,
    JoinDate DATETIME DEFAULT GETUTCDATE() 
);

CREATE TABLE Post (
    PostID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    Content VARCHAR(MAX) NOT NULL,  
    PostDate DATETIME DEFAULT GETUTCDATE(),  
    Visibility VARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID) 
);

CREATE TABLE Comment (
    CommentID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    PostID INT,
    CommentDate DATETIME DEFAULT GETUTCDATE(),  
    Content VARCHAR(MAX) NOT NULL,  
    FOREIGN KEY (UserID) REFERENCES [User](UserID),  
    FOREIGN KEY (PostID) REFERENCES Post(PostID)
);

CREATE TABLE Interacte (
    UserID INT,
    PostID INT,
    InteractionID INT,
    PRIMARY KEY (UserID, PostID, InteractionID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID),  
    FOREIGN KEY (PostID) REFERENCES Post(PostID),
    FOREIGN KEY (InteractionID) REFERENCES Interaction(InteractionID)
);


INSERT INTO Interaction (Type) VALUES
('Like'),
('Coomment');

INSERT INTO [User] (UserName, DOB, Email, Gender) VALUES
('joekh', '2004-05-31', 'joe.kh@gmail.com', 'M'),
('jooooekkkhh', '2003-04-22', 'joooe.@gmail.com', 'M');

INSERT INTO Post (UserID, Content, Visibility) VALUES
(1, 'eh el 25bar!!!', 'Public'),
(2, 'My first DATABASE', 'Private');

INSERT INTO Comment (UserID, PostID, Content) VALUES
(2, 1, 'GOOD JOOB!'),
(1, 2, 'BBYYEE!');

INSERT INTO Interacte (UserID, PostID, InteractionID) VALUES
(1, 1, 1),
(2, 2, 2);

SELECT * FROM Interaction;

SELECT * FROM [User];

SELECT * FROM Post;

SELECT * FROM Comment;

SELECT * FROM Interacte;