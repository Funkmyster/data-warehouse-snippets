CREATE TABLE IF NOT EXISTS date_dimension  (
    id INT NOT NULL,
    fulldate date,
    dayofmonth int,
    dayofyear int,
    dayofweek int,
    dayname varchar(10),
    monthnumber int,
    monthname varchar(10),
    year    int,
    quarter tinyint,
    PRIMARY KEY(id)
) ENGINE=InnoDB AUTO_INCREMENT=1000;

DROP PROCEDURE IF EXISTS datedimbuild;

delimiter //

CREATE PROCEDURE datedimbuild (p_start_date DATE, p_end_date DATE)
BEGIN
    DECLARE v_full_date DATE;

    DELETE FROM date_dimension;

    SET v_full_date = p_start_date;
    WHILE v_full_date < p_end_date DO

        INSERT INTO date_dimension (
            id,
            fulldate ,
            dayofmonth ,
            dayofyear ,
            dayofweek ,
            dayname ,
            monthnumber,
            monthname,
            year,
            quarter
        ) VALUES (
            DATE_FORMAT(v_full_date,"%Y%m%d"),
            v_full_date,
            DAYOFMONTH(v_full_date),
            DAYOFYEAR(v_full_date),
            DAYOFWEEK(v_full_date),
            DAYNAME(v_full_date),
            MONTH(v_full_date),
            MONTHNAME(v_full_date),
            YEAR(v_full_date),
            QUARTER(v_full_date)
        );

        SET v_full_date = DATE_ADD(v_full_date, INTERVAL 1 DAY);
    END WHILE;
END;
