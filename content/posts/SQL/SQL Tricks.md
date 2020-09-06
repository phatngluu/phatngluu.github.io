#### Problem:

![](SQL%20Tricks.assets/image-20200730144702322.png)

#### Solution

```mysql
(
    select city, length(city)
    from station
    where length(city) = (select min(length(city)) from station)
    order by city asc
    limit 1
) union
(   
    select city, length(city)
    from station
    where length(city) = (select max(length(city)) from station)
    order by city asc
    limit 1
)
```

#### Problem

![image-20200730151831005](SQL%20Tricks.assets/image-20200730151831005.png)

#### Solution

```mysql
select distinct city
from station
where city regexp '^[aeuoiAEUOI].*'
```

#### Solution endings with vowels

```mysql
select distinct city
from station
where city regexp '^.*[aeuoiAEUOI]$'
```

#### Solution startings & endings with vowels

```mysql
select distinct city
from station
where city regexp '^[aeuoiAEUOI].*[aeuoiAEUOI]$'
```

#### Solution not startings with vowels

```mysql
select distinct city
from station
where city regexp '^[^aeuoiAEUOI].*'
```

#### Solution either do not start with vowels or do not end with vowels

```mysql
select distinct city
from station
where city regexp '^[^aeuoiAEUOI].*|.*[^aeuoiAEUOI]$'
```

#### Problem

![](SQL%20Tricks.assets/image-20200730160436831.png)

#### Solution

```
select name
from students
where marks > 75
order by substring(name, -3, 3), id asc
```



#### Problem

https://www.hackerrank.com/challenges/the-blunder/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select ceil(avg(salary) - avg(convert(replace(convert(salary, char), '0', ''), unsigned)))
from employees
```

#### Problem

https://www.hackerrank.com/challenges/earnings-of-employees/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select salary*months, count(*)
from employee
where salary*months = (select max(salary*months) from employee)
group by salary*months
```

#### Problem

https://www.hackerrank.com/challenges/weather-observation-station-2/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select round(sum(lat_n), 2), round(sum(long_w), 2)
from station
```

#### Problem

https://www.hackerrank.com/challenges/weather-observation-station-13/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select truncate(sum(lat_n), 4)
from station
where lat_n > 38.7880 and lat_n < 137.2345
```

#### Problem

https://www.hackerrank.com/challenges/weather-observation-station-14/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select truncate(max(lat_n), 4)
from station
where lat_n < 137.2345
```

#### Problem

https://www.hackerrank.com/challenges/weather-observation-station-15/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select round(long_w, 4)
from station
where lat_n < 137.2345 and lat_n = (select max(lat_n) from station where lat_n < 137.2345)
```

#### Problem

https://www.hackerrank.com/challenges/weather-observation-station-16/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select round(min(lat_n), 4)
from station
where lat_n > 37.7780
```

#### Problem

https://www.hackerrank.com/challenges/weather-observation-station-16/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select round(min(lat_n), 4)
from station
where lat_n > 38.7780
```

#### Problem

https://www.hackerrank.com/challenges/weather-observation-station-17/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select round(long_w, 4)
from station
where lat_n > 38.7780 and lat_n = (select min(lat_n) from station where lat_n > 38.7780)
```

#### Problem

https://www.hackerrank.com/challenges/weather-observation-station-18/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select round(
            abs(
                (select min(lat_n) from station) -
                (select max(lat_n) from station)
            ) + 
            abs(
                (select min(long_w) from station) - 
                (select max(long_w) from station)
            ), 4)
```

#### Problem

https://www.hackerrank.com/challenges/weather-observation-station-19/problem?h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

#### Solution

```mysql
select truncate(sqrt(
    power(
        (select min(lat_n) from station) -
        (select max(lat_n) from station)
        , 2) +
    power(
        (select min(long_w) from station) -
        (select max(long_w) from station)
        , 2)
), 4)


```

#### Problem



#### Solution

```mysql

```

#### Problem



#### Solution

```mysql

```

#### Problem



#### Solution

```mysql

```

#### Problem



#### Solution

```mysql

```

