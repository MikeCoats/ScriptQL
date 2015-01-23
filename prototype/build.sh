#!/bin/sh

sqlite3 game.db <<- EOF

    DROP TABLE IF EXISTS pages;
    CREATE TABLE pages
    (
        page INT,
        title VARCHAR
    );

    DROP TABLE IF EXISTS descriptions;
    CREATE TABLE descriptions
    (
        id INT AUTO_INCREMENT,
        page INT,
        part_of_description VARCHAR
    );

    DROP TABLE IF EXISTS turns;
    CREATE TABLE turns
    (
        page INT,
        page_to INT,
        description VARCHAR
    );

    DROP TABLE IF EXISTS messages;
    CREATE TABLE messages
    (
        id INT,
        message VARCHAR
    );

    INSERT INTO pages VALUES (1, "Garden");
    INSERT INTO descriptions(page, part_of_description) VALUES (1, "In the garden.");
    INSERT INTO descriptions(page, part_of_description) VALUES (1, "This is the garden of a house. The house's front door appears open.");
    INSERT INTO turns VALUES (1, 2, "Enter the house.");

    INSERT INTO pages VALUES (2, "Front Hall");
    INSERT INTO descriptions(page, part_of_description) VALUES (2, "In the house.");
    INSERT INTO descriptions(page, part_of_description) VALUES (2, "The wind catches the door and it clicks behind you.");

    INSERT INTO messages VALUES (1, "You have nowhere else to turn. Your game is over.");
    INSERT INTO messages VALUES (2, "You can turn to the following pages. Make your choice.");

EOF

