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