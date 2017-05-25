# DataWarehouseSnippets

Borrowed from http://tech.akom.net/archives/36-Creating-A-Basic-Date-Dimension-Table-in-MySQL.html

Installation:
```
bash> mysqladmin create warehouse
bash> mysql warehouse < Date_Dimension.sql
bash> mysql warehouse < Time_Dimension.sql
bash> mysql
mysql> call datedimbuild('2008-01-01','2012-01-01');
mysql> call timedimbuild();
```

Example usage for building Date Dimension:
```
mysql> call datedimbuild('2008-01-01','2012-01-01'); 
Query OK, 1 row affected (1.69 sec)
mysql> select * from datedim limit 10;
+---------+------------+------------+-----------+-----------+-----------+-------------+-----------+------+---------+
| date_id | fulldate   | dayofmonth | dayofyear | dayofweek | dayname   | monthnumber | monthname | year | quarter |
+---------+------------+------------+-----------+-----------+-----------+-------------+-----------+------+---------+
|  106108 | 2008-01-01 |          1 |         1 |         3 | Tuesday   |           1 | January   | 2008 |       1 | 
|  106110 | 2008-01-02 |          2 |         2 |         4 | Wednesday |           1 | January   | 2008 |       1 | 
|  106112 | 2008-01-03 |          3 |         3 |         5 | Thursday  |           1 | January   | 2008 |       1 | 
|  106114 | 2008-01-04 |          4 |         4 |         6 | Friday    |           1 | January   | 2008 |       1 | 
|  106116 | 2008-01-05 |          5 |         5 |         7 | Saturday  |           1 | January   | 2008 |       1 | 
|  106118 | 2008-01-06 |          6 |         6 |         1 | Sunday    |           1 | January   | 2008 |       1 | 
|  106120 | 2008-01-07 |          7 |         7 |         2 | Monday    |           1 | January   | 2008 |       1 | 
|  106122 | 2008-01-08 |          8 |         8 |         3 | Tuesday   |           1 | January   | 2008 |       1 | 
|  106124 | 2008-01-09 |          9 |         9 |         4 | Wednesday |           1 | January   | 2008 |       1 | 
|  106126 | 2008-01-10 |         10 |        10 |         5 | Thursday  |           1 | January   | 2008 |       1 | 
+---------+------------+------------+-----------+-----------+-----------+-------------+-----------+------+---------+
10 rows in set (0.00 sec)
```

Example usage for building Time Dimension:
```
mysql> call timedimbuild();
Query OK, 1 row affected (1 min 44.80 sec)

mysql> select * from timedim limit 100,5;
+---------+----------+------+--------+--------+------+
| time_id | fulltime | hour | minute | second | ampm |
+---------+----------+------+--------+--------+------+
|  166738 | 00:01:40 |    0 |      1 |     40 | AM   | 
|  166740 | 00:01:41 |    0 |      1 |     41 | AM   | 
|  166742 | 00:01:42 |    0 |      1 |     42 | AM   | 
|  166744 | 00:01:43 |    0 |      1 |     43 | AM   | 
|  166746 | 00:01:44 |    0 |      1 |     44 | AM   | 
+---------+----------+------+--------+--------+------+
5 rows in set (0.00 sec)
```
