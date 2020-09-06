# Chapter 2

Overview of real-time scheduling algorithms

- Clock-driven 
- Weighted round-robin 
- Priority driven
  - Dynamic vs. static 
  - Deadline scheduling: EDF and LST

Outline relative strengths, weaknesses

#### Task states

**Ready**: not executed, wait for scheduling point

**Running**: get scheduled to a processor

**Blocked**: not running & cannot be scheduled at the next scheduling point (delay, wait for data/resources)

**Suspended**: user/system wants to completely remove the task from being scheduled (user press the “pause” button)

<img src="Chapter%202.assets/image-20200606214558997.png" alt="image-20200606214558997" style="zoom:50%;" />





#### Feasible schedule
- A  **schedule that never misses any deadline** is called **feasible** 
- **A set of tasks** is **schedulable** if there exists **at least a feasible schedule** 
- A **scheduling algorithm is optimal** if it **always produces a feasible schedule** in case a given set of tasks is schedulable

#### Approaches to Real-time scheduling

- Weighted round-robin
  - Primarily used for scheduling real-time traffic in high-speed, switched networks
  - Rarely used in other real-time systems
- Clock-driven (time-driven)
  - Primarily used for hard real-time systems
  - All properties of all jobs are known at design time: Offline (at design time) scheduling techniques (complicated) can be used
- Priority-driven:
  - Primarily used for more dynamic real-time systems with a mix of time-based and event-based activities 
  - The system must adapt to changing conditions and events

#### Weighted round-robin: overview

##### Regular round-robin

It is commonly used for scheduling **time-shared applications**

- Every job joins a FIFO queue when it is ready for execution 
- When the scheduler runs, it schedules the job at the head of the queue to execute for at most one time slice
  - Sometimes called a quantum – typically O(tens of ms)
- If the job has not completed by the end of its quantum, it is preempted and placed at the end of the queue 
- When there are n ready jobs in the queue, each job gets one slice every n time slices (n time slices is called a round) 
- Only limited use in real-time systems

##### Weighted round-robin

- Each job $J_i$ is assigned a weight $w_i$ 
- The job will receive w i consecutive time slices each round
  - Equivalent to regular round robin if all weights equal 1
- Partitions capacity between jobs according to some ratio 
- Offers throughput guarantees
  - Each job makes a certain amount of progress each round
- Advantages:
  - Simple to implement, since it doesn’t require a sorted priority queue
  - Reasonable approach for jobs that can incrementally consume output from their predecessor
    - since they execute concurrently in a pipelined fashion
    - Jobs communicating using Unix pipes
    - Wormhole switching networks, where message transmission is carried out in a pipeline fashion and a downstream switch can begin to transmit an earlier portion of a message, without having to wait for the arrival of the later portion
- Drawbacks: ![image-20200608085656425](Chapter%202.assets/image-20200608085656425.png) 

#### Clock-driven scheduling: overview

- **Scheduling decision time**: point in time when **scheduler** decides which job to execute next 

- Scheduling decision time in clock-driven schedulers is **defined a priority** **before** the **system begins execution**

  - Hardware timer to periodically wake up the scheduler to generate a portion of the schedule

  <img src="Chapter%202.assets/image-20200608234533292.png" alt="image-20200608234533292" style="zoom:33%;" />

- **Special case**: When *job parameters are known a priority*, **schedule** can be **pre-computed** off-line, and **stored as a table** (table-driven schedulers)
  - Scheduling overhead at run-time can be minimized 
  - Simple and straight-forward, not flexible

### Priority scheduling: overview

- **Basic rule**: *never leave processor idle* when *there is work to be done*:
  - Work conserving scheduling 
  - Greedy scheduling 
  - List scheduling
- Possible implementation of **preemptive** priority-driven scheduling:
  - Assign priorities to jobs 
  - **Scheduling decisions are made** when
    - **Job** becomes **ready** 
    - **Processor** becomes **idle** 
    - **Priorities** of jobs **change**
  - At **each scheduling decision time**, **choose ready task** with **highest priority**
- In **non-preemptive** cases, **scheduling decisions** are made **only** when **processor** becomes **idle**

#### Scheduling decision points (priority driven)

<img src="Chapter%202.assets/image-20200609164655282.png" alt="image-20200609164655282" style="zoom: 33%;" />

1. The **running** process **blocks**, i.e. changes from running to waiting

2. The **running** **thread** **terminates**

3. A **waiting thread** becomes **ready**

4. The **current thread** is **preempted**, i.e. switches from running to ready

##### Example: slide 13. Solution: Book p.63.

<img src="Chapter%202.assets/image-20200608235604016.png" alt="image-20200608235604016" style="zoom:33%;" />

##### Exercise: slide 14. Solution: not found

<img src="Chapter%202.assets/image-20200609163851932.png" alt="image-20200609163851932" style="zoom: 33%;" />

#### Priority scheduling

**Note**: The ability to preempt lower priority jobs slowed down the overall completion of the task

- This is not a general rule, but shows that priority scheduling results can be non-intuitive

- Different priority scheduling algorithms can have very different properties
- **Most scheduling algorithms used in non/soft real-time** systems are priority-driven
  - FIFO/LIFO: Assign priority based on release time
  - Shortest/Longest -Execution-Time-First: Assign priority based on execution time
- **Real-time priority scheduling** assigns priorities **based on deadline or some other timing constraint**:
  - Earliest deadline first
  - Least slack time first

#### Priority scheduling based on Deadlines

- **Earliest deadline first (EDF)** — mainly used
  - Assign priority to jobs based on deadline 
  - Earlier the deadline, higher the priority 
  - Simple, just requires knowledge of deadlines

- **Least Slack Time first (LST)**
  - Assign priority to jobs based on slack time: $t_slack$ 
  - The **smaller the slack time, the higher the priority** 
  - A job $J_i$ has deadline $d_i$ , execution time $e_i$ , and was released at time $r_i$  
  - At time $t < d_i$ :
    - Remaining execution time $t_{rem}= e_i − e_i^′$ ; where $e_i^′$ is the amount of time the processor has processed the job
    - Slack time $t_{slack} = d_i − t − t_{rem} = d_i − t − (e_i − e_i^′)$
  - More complex, requires knowledge of execution times and deadlines
    - Knowing the **actual execution time is often difficult a priori**, since it depends on the data, need to use worst case estimates (=> poor performance)

##### Optimality of EDF/LST

- These algorithm are **optimal**. (they will always produce a feasible schedule if one exists). 

- **Constraints**: single processor, preemption, no resources contending (không xảy ra tranh chấp tài nguyên).

- Fact: : any feasible schedule can be transformed into an EDF schedule.<img src="Chapter%202.assets/image-20200609170918544.png" alt="image-20200609170918544" style="zoom:33%;" />

  

##### Non-optimality of EDF/LST

These algorithm is **non-optimal** when either: **if jobs are non-preemptable** or **if there is more than one processor**. Example:   

 <img src="Chapter%202.assets/image-20200609171333069.png" alt="image-20200609171333069" style="zoom: 33%;" />

### Dynamic vs Static system

### <img src="Chapter%202.assets/image-20200609171646118.png" alt="image-20200609171646118" style="zoom: 33%;" />

### Effective Release times and Deadlines

Problem: Sometimes, **release time** of a job may **later than its successors** or **deadline** may be **earlier than** its **predecessors**. => Make no sense!

Definition:

- Effective release time
  - If a job has **no predecessors**, its effective release time is its release time 
  - If it has **predecessors**, *its effective release time* is the **maximum** of *its release time* and the *effective release times* of its predecessors

- Effective deadline

  - If a job has **no successors**, its effective deadline is its deadline 
  - It if has **successors**, its **effective deadline** is the **minimum** of *its deadline* and the *effective deadline of its successors*


  <img src="Chapter%202.assets/image-20200609172730743.png" alt="image-20200609172730743" style="zoom:33%;" />

##### Example

##### <img src="Chapter%202.assets/image-20200609172757757.png" alt="image-20200609172757757" style="zoom:33%;" />



Solution:

- $J_1$: no precedence. Effective: (2, 10)
- $J_2$: no precedence. Effective: (0, 7)
- $J_3$: $J_1$, $J_2$. ert = max (1, 2, 0) = 2, edt = min(12, 10, 7) = 7. Effective (2, 7)
- J_4: J_3. ert = max (4, 2) = 4, edt = min(9, 7) = 7. Effective(4, 7)
- J_5: J_3. ert = max (1, 2) = 2, edt = min(8, 7) = 7. Effective(2,7)
- J_6: J_5, J_4. ert = max(0, 4, 2) = 4, edt = min(20, 7,7) = 7. Effective(4, 7)
- J_7: J3, J4. ert = max(6, 2, 4) = 6, edt = min(21, 7, 7) = 7. Effective(6,7)
