# Chapter 3

Outline

- Assumptions and notation for clock-driven scheduling 
- Handling periodic jobs
  - Static, clock-driven schedules and the cyclic executive

- Handling aperiodic jobs
  - Slack stealing
- Handling sporadic jobs
-  Advantages and disadvantages of clock driven scheduling

## Assumptions

Clock-driven scheduling applicable to deterministic systems 

A **restricted** periodic task model:

- The parameters of all periodic tasks are **known a priori** 
- For each mode of operation, system has a fixed number $n$ periodic tasks
  - Each job in $T_i$ is released $p_i$ units of time after the previous job in $T_i$; i.e., $r_{i,k} = r_{i,k−1} + {p_i}$  
  - Each job $J_{i,k}$ is ready for execution at its release time $r_i,k$  
  - Variations in the inter-release times of jobs in a periodic task are negligible

- **Aperiodic jobs may exist**
  - Assume that the system maintains a **single queue for aperiodic jobs** 
  - Whenever the processor is available for aperiodic jobs, the job at the head of this queue is executed

- There are **no sporadic jobs** 
  - **Recall**: sporadic jobs have hard deadlines, aperiodic jobs do not

## Notations

- The 4-tuple $T_i = (ϕ_i , p_i , e_i , D_i )$ refers to a periodic task $T_i$ with phase $ϕ_i$ , period $p_i$ , execution time $e_i$, and relative deadline $D_i$ 
  - Default phase $ϕ_i = 0$, default relative deadline is the period ($D_i = p_i$ )
  - Omit elements of the tuple that have default values
- Example $T_1 = (1,10,3,6)$
  - ![image-20200615203529362](Chapter%203.assets/image-20200615203529362.png)
- Another examples: $T_1 = (10,3,6); T_2 = (10,3)$

## Clock-driven scheduling

Static, timer-driven schedule (version 1.0):

- Schedule calculated offline at design time 
- Can use complex algorithms to optimize some characteristics of the system 
- Relies on accurate timer interrupts, based on execution times of tasks

Structured cycle schedule (version 2.0):

- Make scheduling decisions on-line at periodic intervals 
- Easier to implement

### Static, timer-driven

This schedule specifies exactly when each job executes (off-line)

- During run-time, the scheduler dispatches the jobs according to this schedule 
- All deadline are surely met (as long as no job ever over-run) 
- Constructing a static schedule for the first hyper-period
  - If utilization of system, U, is less than 1

##### Example:

<img src="Chapter%203.assets/image-20200609201028473.png" alt="image-20200609201028473" style="zoom: 67%;" />

![image-20200609202234238](Chapter%203.assets/image-20200609202234238.png)

### Structured cycle schedule

- Make scheduling decisions at periodic intervals (frames) of length $f$ 
- Execute a fixed list of jobs with each frame, disallowing pre-emption except at frame boundaries
  - Need to define an appropriate frame size

- Require phase of each periodic task to be a non-negative integer multiple of the frame size
  - The first job of every task is released at the beginning of a frame 
  - $ϕ = k × f$ where $k$ is a non-negative integer

<img src="Chapter%203.assets/image-20200609202413496.png" alt="image-20200609202413496" style="zoom: 50%;" />

<img src="Chapter%203.assets/image-20200609202749023.png" alt="image-20200609202749023" style="zoom: 50%;" />

- Major cycle: frames in a hyper-period
- Gives two benefits:
  - Scheduler can **easily check for overruns** and **missed deadlines** **at the end of each frame** 
  - Can **use a periodic clock interrupt**, rather than **programmable timer**

#### Frame size constraints

1. To avoid preemption, want jobs to start and complete execution within a single frame:

   $f ≥ max(e1, e2, . . . , en)$

2. To minimize the number of entries in the cyclic schedule, the hyper-period should be an integer multiple of the frame size (=> **f divides evenly into the period of at least one task**):

   $∃i : mod(p_i, f ) = 0$

3. To allow scheduler to check that jobs complete by their deadline, should be at least one full frame between release time and deadline of any job:

   $2 × f − gcd(p_i, f ) < D_i$, for $i = 1,2,...,n$

##### Example: 

##### <img src="Chapter%203.assets/image-20200609204545848.png" alt="image-20200609204545848" style="zoom:33%;" />

![image-20200609204608671](Chapter%203.assets/image-20200609204608671.png)

##### Another example



##### <img src="Chapter%203.assets/image-20200609204709142.png" alt="image-20200609204709142" style="zoom:33%;" />

=> Use **Job slices**

#### Job Slices

![image-20200609210439230](Chapter%203.assets/image-20200609210439230.png)

#### Building a Structured cyclic schedule

- To construct a cyclic schedule, we need to make three kinds of **design decisions**:
  - Choose a frame size based on constraints 
  - Partition jobs into slices 
  - Place slices in frames
- These decisions cannot be taken independently:
  - Ideally want as **few slices as possible**, but **may be forced to use more** to get a feasible schedule

#### Implementation: a cyclic executive

- Modify previous table-driven cyclic scheduler to be frame based, schedule all types of jobs in a multi-threaded system

- Table that drives the scheduler has F entries, where
  - Each corresponding entry L(k) lists the names of the job slices that are scheduled to execute in frame k; called a scheduling block 
  - Each job slice implemented by a procedure, to be called in turn

- Cyclic executive executed by the clock interrupt that signals the start of a frame:
  - Determines the appropriate scheduling block for this frame 
  - Executes the jobs in the scheduling block in order 
  - Starts job at head of the aperiodic job queue running for remainder of frame

- Less overhead than pure table driven cyclic scheduler, since only interrupted on frame boundaries, rather than on each job

#### Aperiodic jobs

- Aperiodic jobs arrive on irregular intervals 
- Placed on idle slots in the schedule 
- In case an aperiodic job arrives when another aperiodic job is executing, the later job is placed in a FIFO queue until the first job is completed

#### <img src="Chapter%203.assets/image-20200609211026690.png" alt="image-20200609211026690" style="zoom:33%;" />

#### Schedule aperiodic

- Typically:
  - Scheduled in the background 
  - Their execution may be delayed

- But:
  - Aperiodic jobs are typically results of external events

- Therefore:
  - The sooner the completion time, the more responsive the system 
  - Minimizing response time of aperiodic jobs becomes a design issue

- Approach:
  - Execute aperiodic jobs **ahead of periodic jobs** whenever possible
  - This is called **Slack Stealing**

#### Slack stealing

- $x_k$ : amount of time allocated to slices executed during frame $F_k$ 

- $s_k$ : Slack during frame $F_k : s_k = f − x_k$ 

- **A natural way to improve the response times of aperiodic jobs is by executing the aperiodic jobs ahead of the periodic jobs whenever possible**

- The cyclic executive can execute aperiodic jobs for $s_k$ amount of time without causing jobs to miss deadlines

#### Example

![image-20200609211343512](Chapter%203.assets/image-20200609211343512.png)

#### Sporadic jobs

- Reminder: sporadic jobs have hard deadlines; the release time and the execution time are not known a priori. Worst-case execution time are known when job is released.

- Need acceptance test:
  $$
  S(c,l) = \sum_{i=c}^{l}S_i
  $$
  
- Acceptance test pseudo code:
  ```
  IF S(c,l) < e THEN 
  	reject job; 
  ELSE
  	accept job;
  	schedule execution; 
  END;
  ```

#### Scheduling accepted jobs

- **Static scheduling:**
  - Schedule as **large a slice** of the accepted job as possible in the **current frame** 
  - Schedule **remaining** portions as late as possible

- Mechanism:
  - Append slices of accepted job to list of periodic-task slices in frames where they are scheduled

- If more than one sporadic job arrives at once, they should be queued for acceptance in EDF order

##### Example

![image-20200609214146516](Chapter%203.assets/image-20200609214146516.png)

### Clock-driven scheduling: disadvantages

- Inflexible
  - Pre-compilation of knowledge into scheduling tables means that if anything changes materially, have to redo the table generation 
  - Best suited for systems which are rarely modified once built
- Other disadvantages:
  - Release times of all jobs must be fixed 
  - All possible combinations of periodic tasks that can execute at the same time must be known a priori, so that the combined schedule can be precomputed 
  - The treatment of aperiodic jobs is very primitive
    - Unlikely to yield acceptable response times if a significant amount of soft real-time computation exists

