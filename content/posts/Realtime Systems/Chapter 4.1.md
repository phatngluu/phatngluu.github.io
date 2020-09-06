![image-20200610162329584](Chapter%204.1.assets/image-20200610162329584.png)

## Assumptions

Priority-driven scheduling of **periodic tasks** on a **single processor**

Assume a restricted periodic task model:

- **A fixed** number of **independent periodic tasks** exist
  - Are **ready** for execution **as soon as** they are **released** 
  - Can be **pre-empted** at any time 
  - **Never** **suspend** themselves
- **New tasks** only **admitted** **after** an **acceptance test**; **may** be **rejected** 
- The **period of a task** defined as **minimum inter-release time of jobs in task** 
- There are **no aperiodic or sporadic tasks** 
- **Scheduling decisions** made immediately upon **job release and completion** 
- **Context switch** overhead negligibly **small**; **unlimited** **priority levels**

## Fixed priority vs. Dynamic priority

A **priority-driven scheduler** is an **on-line scheduler**

- It does **not pre-compute** a **schedule** of tasks/jobs: instead **assigns priorities t**o jobs when **released**, **places** them on a **run queue in priority order**
- When **pre-emption is allowed**, a **scheduling decision** is made whenever a job is **released** or **completed**
- **At each scheduling decision time**, the scheduler **updates** the **run queues** and **executes the job at the head of the queue**

**Fixed (static) priority**: All jobs in task have same priority

**Dynamic priority**: May assign different priorities to individual jobs

## Rate-Monotonic (RM) algorithm

- Best known fixed-priority algorithm is rate monotonic scheduling / Very widely studied and used

- **Assigns priorities** to tasks **based on** their **periods**
  - The **shorter** the **period**, the **higher** the **priority** 
  - $rate=\frac{1}{period}$, so jobs with **higher rate** have **higher priority**

### Example

![image-20200610163152031](Chapter%204.1.assets/image-20200610163152031.png)

## Deadline Monotonic (DM) algorithm

- **Assigns task priority** according to **relative deadlines**
  - The **shorter the relative deadline**, the **higher the priority**

- When task has $Relative\_Deadline = Period$, then RM is **the same** as DM
- **When** the **relative deadlines are arbitrary**:
  - **DM** can **sometimes** produce a **feasible schedule** in cases where **RM** **cannot**
  - But, **RM** **always fails** **when** **deadline monotonic fails** 
- Deadline monotonic **outperforms** (vượt trội) to rate monotonic
  - If deadline ≠ period

### Example

![image-20200610164131316](Chapter%204.1.assets/image-20200610164131316.png)

## DM vs RM

![image-20200610164811199](Chapter%204.1.assets/image-20200610164811199.png)

## Schedulable utilization

![image-20200610170128638](Chapter%204.1.assets/image-20200610170128638.png)

## Schedulable utilization of RM

![image-20200610170421210](Chapter%204.1.assets/image-20200610170421210.png)

### Example

![image-20200610170510623](Chapter%204.1.assets/image-20200610170510623.png)

### See chapter 4.1 exercises