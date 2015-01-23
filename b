#!/bin/sh

sqlite3 d <<- EOF

    DROP TABLE IF EXISTS p;
    CREATE TABLE p
    (
        p INT,
        t VARCHAR
    );

    DROP TABLE IF EXISTS d;
    CREATE TABLE d
    (
        i INT AUTO_INCREMENT,
        p INT,
        d VARCHAR
    );

    DROP TABLE IF EXISTS t;
    CREATE TABLE t
    (
        p INT,
        t INT,
        d VARCHAR
    );

    DROP TABLE IF EXISTS m;
    CREATE TABLE m
    (
        i INT,
        m VARCHAR
    );

    INSERT INTO p VALUES (1, "Garden");
    INSERT INTO d(p, d) VALUES (1, "In the garden.");
    INSERT INTO d(p, d) VALUES (1, "This is the garden of a house. The house's front door appears open.");
    INSERT INTO t VALUES (1, 2, "Enter the house.");

    INSERT INTO p VALUES (2, "Front Hall");
    INSERT INTO d(p, d) VALUES (2, "In the house.");
    INSERT INTO d(p, d) VALUES (2, "The wind catches the door and it clicks behind you.");

    INSERT INTO m VALUES (1, "You have nowhere else to turn. Your game is over.");
    INSERT INTO m VALUES (2, "You can turn to the following pages. Make your choice.");

EOF

