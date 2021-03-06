+++
categories = ["statistic"]
date = 2020-09-27T08:24:20Z
layout = ""
tags = ["statistic"]
title = "Random Variables"

+++
# Random variables - RV

Random variables are ways to **map** **outcomes** of random processes to **numbers**.

For examples:

1. Flipping a coin: X = {0 if head, 1 if tail}
2. Sum of upward face after rolling 7 dice

## Discrete and continous RV

Discrete: distinct/separate value:

* X = {0 heads, 1 tails}
* X = Year that a random student was born
* X = # of ants born tomorrow
* X = Execution time of a program every time it get executed (rounded to the nearest miliseconds).

Continous: any value in interval:

* Y = Exact mass of a random animal in a zoo
* Y = Exact execution time of a program every time it get executed.

Discrete: take on only **certain values**; Continous: take on **any value at any point** along an interval.

## Constructing a probability distribution for random variable

The probability distribution of the random variable X is a **description** of the **probabilities** with the **possible numerical values of X**.

A probability distribution of a discrete random variable can be:

1\. A **list** of the **possible values** **along** with their **probabilities**.

2\. A **formula** that is used to **calculate** the **probability** in **response** to an input of the **random variable’s value**.

Example:

![](/static/uploads/screen-shot-2020-09-27-at-18-28-12.png)

## Probability Mass Function

![](/static/uploads/screen-shot-2020-09-27-at-18-52-24.png)

## Cumulative Distribution Functions

![](/static/uploads/screen-shot-2020-09-27-at-19-05-18.png)

### Properties

The cumulative distribution function is built from the probability mass function and vice versa.

![](/static/uploads/screen-shot-2020-09-27-at-19-07-31.png)

Example: x_i là các số tại dấu "="

![](/static/uploads/screen-shot-2020-09-27-at-20-58-58.png)

![](/static/uploads/screen-shot-2020-09-27-at-21-04-19.png)

## **Mean, Variance and Standard deviation**

* The **mean** is a measure of the center of a probability distribution.

  ![](/static/uploads/screen-shot-2020-09-27-at-21-32-43.png)
* The **variance** is a measure of the dispersion (sự phân tán) or variability (tính biến đổi) of a probability distribution.

  ![](/static/uploads/screen-shot-2020-09-27-at-21-33-12.png)
* The **standard deviation** is another measure of the dispersion. It is the **square root of the variance**.