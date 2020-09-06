## Discussed several dynamic-priority algorithms

![image-20200610174502293](Chapter%204.2.assets/image-20200610174502293.png)

## EDF Example

![image-20200610174604800](Chapter%204.2.assets/image-20200610174604800.png)

#### Another example

Schedule the following task set using the EDF algorithm: $T_1 = (2,0.5); T_2 = (4,1); T_3 = (5,1.5)$

## LST Example

![image-20200610174831027](Chapter%204.2.assets/image-20200610174831027.png)

## Comparing different algorithms

- Compare performance of RM, EDF, LST and FIFO scheduling
  - Assume a single processor system with 2 tasks: $T_1 = (2,1);\ T_2 = (5,2.5)$ => $H = 10$

- The total utilization is 1.0 => **no slack time**
  - Expect some of these algorithms to lead to missed deadlines!
  - This is one of the cases where EDF works better than RM/ DM

### Example

![image-20200611174748088](Chapter%204.2.assets/image-20200611174748088.png)

## Unpredictability of EDF Scheduling

![image-20200611174830380](Chapter%204.2.assets/image-20200611174830380.png)

![image-20200611175111476](Chapter%204.2.assets/image-20200611175111476.png)

## EDF - anomalies example

![image-20200611175145606](Chapter%204.2.assets/image-20200611175145606.png)

![image-20200611175158435](Chapter%204.2.assets/image-20200611175158435.png)

![image-20200611175214140](Chapter%204.2.assets/image-20200611175214140.png)

![image-20200611175225041](Chapter%204.2.assets/image-20200611175225041.png)

![image-20200611175232855](Chapter%204.2.assets/image-20200611175232855.png)

## EDF advantages vs. disadvantages

![image-20200611175245280](Chapter%204.2.assets/image-20200611175245280.png)

## Schedulable utilization: EDF

![image-20200611175320170](Chapter%204.2.assets/image-20200611175320170.png)

![image-20200611175345370](Chapter%204.2.assets/image-20200611175345370.png)

### See chapter 4.2 examples