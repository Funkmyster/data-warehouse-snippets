CREATE TABLE IF NOT EXISTS time_dimension  (
    id INT NOT NULL,
    fulltime time,
    hour int,
    minute int,
    second int,
    ampm varchar(2),
    PRIMARY KEY(id)
) ENGINE=InnoDB;


DROP PROCEDURE IF EXISTS timedimbuild;

delimiter //

CREATE PROCEDURE timedimbuild ()
BEGIN
    DECLARE v_full_date DATETIME;

    DELETE FROM time_dimension;

    SET v_full_date = '2009-03-01 00:00:00';
    WHILE v_full_date < '2009-03-02 00:00:00' DO

        INSERT INTO time_dimension (
            id,
            fulltime ,
            hour ,
            minute ,
            second ,
            ampm
        ) VALUES (
            TIME_TO_SEC(v_full_date),
            TIME(v_full_date),
            HOUR(v_full_date),
            MINUTE(v_full_date),
            SECOND(v_full_date),
            DATE_FORMAT(v_full_date,'%p')
        );

        SET v_full_date = DATE_ADD(v_full_date, INTERVAL 1 SECOND);
    END WHILE;
END;

//
delimiter ;
