### How to show what is the current database ?
```
select database();
```

### How to insert a single quote (') as a value ?
```
insert into tableName (column1, column2) VALUES ('sebastian\'s','srikanth');
```

(or)

```
insert into tableName (column1, column2) VALUES ("sebastian's",'srikanth');
```

### How to filter for case sensitive values ?
- By default in MySQL database the values are case insensitive.
- Below is the command to filter for case sensitive values.
```
select * from tableName where binary column1 = 'some value'
```

### How to filter for records that has 4 characters ?
```
select * from tableName where column1 like '_____'; -- Provide 5 underscores
```

### Why distinct of column_1 and order by column_2 in a single line query does not work?
```
select distinct column_1 from tableName order by column_2; -- This query FAILS
```
- Lets see the order of execution
    1. FROM ( Loads table tableName )
    2. SELECT 
        - Projects two columns column_1 and column_2 both because, sql is so intelligent that it has to select column_1 and later it has to order by column_2 so it fetches both the columns.
        - it is possible to run 
        ```
        select column_1, column_2 from tableName order by column_2;
        ```
        - However, when we run distinct of column_1 and column_2 without order by, then we get unique values for the combination of columns column_1 and column_2.
        ```
        select distinct column_1, column_2 from tableName; -- Gives unique values for combination of column_1 and column_2 
        ```
        - But we need, distict of column_1 and order by column_2, which is technically not possible and hence it fails.
        - It fails in Step 2 only.
    3. ORDER BY (order by column_2)

### How to insert current time on update of a record ?
```
create table tableName(
    name varchar(30) NOT NULL,
    changed_time TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
    another_way_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
)
```
(or)
```
create table tableName(
    name varchar(30) NOT NULL,
    changed_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
)
```

- Now Every record we insert it updates with current time by default 
- Also, everytime we update the records it updates with current time

### Having vs Where, When to use what ?
- **Where** clause is used before grouping has happened.
- **Having** clause is used after grouping has happened.

#### Having:
```
select column_1, count(*) from tableName group by column_1 having count(*) > 5;
```
In the above query order of execution is:
1. FROM
2. GROUP BY
3. HAVING

#### Where
```
select column_1, count(*) from tableName where column_1 = 'some_value' group by column_1 having count(*) > 5;
```
In the above query order of execution is:
1. FROM
2. WHERE
3. GROUP BY
4. HAVING

We can also use having as filter condition after grouping like below:
```
select 
    column_1, count(*) 
from
    tableName
group by 
    column_1 
having 
    column_1 = 'some_value' and count(*) > 2
;
```
However, this is not optimised way of doing, why because,
first we are grouping and then performining filter, instead
we can first filter and then apply group by which could save lot of scanning if the table has huge records, like below:
```
select 
    column_1, count(*) 
from 
    tableName 
where 
    column_1 = 'some_value' 
group by 
    column_1 
having 
    count(*) > 2
;
```