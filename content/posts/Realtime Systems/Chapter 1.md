# Chapter 1
Outline of terminology and a reference model:

- Jobs and tasks 
- Processors and resources 
- Time and timing constraints
  - Hard real-time 
  - Soft real-time
- Periodic, aperiodic and sporadic tasks 
- Precedence constraints and dependencies 

- Scheduling

## Examples

1. Systems process data at a regular and timely rate: Aircraft positioning system
2. Systems rapid response to irregular events: Over-temperature failure in a nuclear plant
3. Airline reservation counter

All three systems are real-time:

- process information within a specified interval 
- system failure

4. COVID-19 detector systems??? Not real-time

## System concepts

* **Software** = Systems programs + Application programs
* A **system** is a mapping of a set of inputs into a set of outputs

## Realtime systems
* **Typical realtime control system**
  - input: sensors + image device: analog => digital
  - output: control signals + display: digital => analog
* **Classic representation** of a realtime system
	- Sequence of jobs to be scheduled
	- Hidden hardware complexity
* A **real-time system** is a system that must satisfy explicit response-time constraints or risk severe consequences, including failure.
* **Failure**: inability of the system to perform according to system specification. *Eg: space shuttle, nuclear plant vs ATM.*
* **Reactive systems**: scheduling is driven by ongoing interaction with their environment. Eg: fire-control
* **Embedded systems**: inside a system (not ifself a computer). *Eg: embedded computers in an automobile: fuel injection, airbag deployment,...*
* **Block diagram** of a **generic real-time control system**
  ![](Chapter%201.assets/2020-06-03-16-02-51.png)

## Soft vs Hard
A **soft** real-time system is one in which performance is degraded but not destroyed by failure to meet response-time constraints  
A **hard** real-time system is one in which failure to meet a single deadline may lead to complete and catastrophic system failure  
A **firm** real-time system is one in which a few missed deadlines will not lead to total failure, but missing more than a few may lead to complete and catastrophic system failure  

## Deadlines come from

Underlying physical phenomena of the system under control  
– Images updated at approximately 30 frames/second
– Accelerations must be read at a rate based on the velocity of
the vehicle

## Response time & Punctuality
The time between the presentation of a set of inputs to a system and the realization of the required behavior, including the availability of all associated outputs, is called the response time of the system

Every response time has an average value, $t_R$ , with upper and lower bounds of $t_R$ + $ϵ_U$ and $t_R$ − $ϵ_L$ , respectively:

- $ϵ_U$ ,$ϵ_L$ → $0^+$ 
- jitter: $t ∈ [−ϵ_L , + ϵ_U ]$

#### Example

An elevator door is automatically operated and it may have a capacitive safety edge for sensing possible passengers between the closing door blades. Thus, the door blades can be quickly reopened before they touch the passenger and cause discomfort or even threaten the passenger’s safety

What is the required system response time from when it recognizes that a passenger is between the closing door blades and starting to reopen the door?

#### Solution

This response time consists of five independent latency components:

- Sensor: $t_{SEmin}$ = 5 ms; $t_{SEmax}$= 15 ms 

- Hardware: $t_{HWmin}$ = 1 μs; $t_{HWmax}$ = 2 μs 
- System software: $t_{SSmin}$ = 16 μs; $t_{SSmax}$ = 48 μs
- Application software: $t_{ASmin}$ = 0.5 μs; $t_{ASmax}$ = 0.5 μs 
- Door drive: $t_{DDmin}$ = 300 ms; $t_{DDmax}$ = 500 ms

Now, we can calculate the minimum and maximum values of the composite response time: $t_min$ ≈ 305 ms; $t_max$ ≈ 515 ms

## Common misconceptions
* Real-time systems are synonymous with “fast” systems
  * Many (but not all) hard real-time systems deal with deadlines in the tens of milliseconds; e.g. airline reservation system
* There are universal, widely accepted methodologies for real-time systems specification and design
  * There is still no methodology available that answers all of the challenges of real-time specification and design all the time and for all applications
* There is no more a need to build a real-time operating system, because many commercial products exist
  * Commercial solutions have certainly their place, but choosing when to use an off-the-shelf solution and choosing the right one are continuing challenges

## Realtime System Design Issue

**Complex sub-discipline of computer systems engineering**: Programming Languages, Algorithms Data, Structures, Operations Research, Queuing Theory, Operating Systems, Software Engineering, Real-Time Systems, Control Theory, Systems Theory, Computer Architecture.

## Realtime System

- Mars Exploration Rover: a solar-powered, autonomous real-time system with radio-communication links and a variety of sensors and actuators
- Aerospace: Flight control, Navigation, Pilot interface
- Industrial: Crane, Paper machine, Welding robot
- Automotive: Airbag deployment, Antilock braking, Fuel injection
- Multimedia: – Home theater, Simulator ,  Console game
- Household: Microwave oven, Rice cooker, Washing machine
- Medical: Intensive care monitor, Magnetic resonance imaging, Remote surgery

### Informal description

![image-20200615132201077](Chapter%201.assets/image-20200615132201077.png)

## Reference model is characterized by:  

* A workload model: describes the application supported by the system
* A resource model describes resources available to the applications
* Scheduling algorithms define how the application
system uses the resources at all times

## Jobs and Tasks
A **job** is a unit of work that is scheduled and executed by a system: e.g. computation of a control-law, computation of an FFT on sensor data, transmission of a data packet, retrieval of a file

A **task** is a set of related jobs which jointly provide some function: e.g. the set of jobs that constitute the “maintain constant altitude” task, keeping an airplane flying at a constant altitude

## Execution time
A job $J_i$ will execute for time $e_i$  

- This is the amount of time required to complete the execution of when it executes alone and has all the resources it needs  
- Value of depends upon complexity of the job and speed of the processor on which it is scheduled; may change for a variety of reasons: 
  - *Conditional branches*
  - *Cache memories and/or pipelines*
  - *Compression*
- Execution times fall into an interval [$e_i^−$ , $e_i^+$ ]; assume that we know this interval for every hard real-time job, but not necessarily the actual $e_i$

  - Terminology: (x, y] is an interval starting immediately after x, continuing up to and including
- Often, we can validate a system using $e_i^+$ for each job; we assume $e_i$ = $e _i^+$ and ignore the interval lower bound.
  - Inefficient, but safe bound on execution time

## Release and Response time
**Release time:** the instant in time when a job becomes available for execution

- May not be exact: **release time jitter** so $r_i$ is in the interval [$r_i^−$ , $r_i^+$ ] 
- A job can be scheduled and executed at **any time at, or after,** its release time

**Response time:** the length of time **from** the **release time** of the job **to the time instant when it completes**

![image-20200606220725529](Chapter%201.assets/image-20200606220725529.png)

## Deadlines and Timing constraints
* Completion time: the instant at which a job completes execution  

* Relative deadline (D_i): the maximum allowable job response time  

* Absolute deadline (d_i):  the instant of time by which a job is required to be completed (often called simply the deadline)  

  * `absolute deadline = release time + relative deadline`
  * Feasible interval for a job J i is the interval (ri , di ]

* Deadlines are examples of timing constraints

  ![](Chapter%201.assets/2020-06-03-16-04-39.png)

## Task
* Unit of computation is a task
  * A task can be executed multiple times
  * An instance of task is a job
  * The functionality of the job is defined in the task
* A processor executes a task
* Types of task:
  * Periodic: set of jobs that are executed repeatedly at regular time intervals can be modelled as a periodic task
    * The most common type of task used in real-time systems
  * Aperiodic
  * Sporadic
* Different execution time patterns for the jobs in the task
* Must be modelled differently
  * Differing scheduling algorithms
  * Differing impact on system performance
  * Differing constraints on scheduling

## Periodic tasks: parameters
Periodic task $T_i$ has sequence of jobs $J_{i,1}, J_{i, 2}, ..., J_{i, n}$  
* The **release time** ($r_i$): time instant of first job J(i, 1) is ready for execution
* The **period** ($p_i$): the minimum time between release times of consecutive jobs
* The **execution time** ($e_i)$: the maximum execution time of all jobs in the periodic task
* The **relative deadline** ($D_i)$: the interval of time by which a job is required to be completed from released
  * In case no deadline specified $D_i$ = $p_i$
* **Slack time: **The relative deadline is smaller than the time between jobs, allowing some **slack time** for other jobs. `Slacktime = Period - Relative deadline`



#### Example:

A system to monitor and control a heating furnace

- The system takes 20 ms to initialize when turned on 
- After initialization, every 100 ms, the system execute the following behavior:
  - Samples and reads the temperature sensor 
  - Computes the control-law for the furnace to process temperature readings, determine the correct flow rates of fuel, air and coolant
  -  Adjusts flow rates to match computed values

#### Solution: How can we model the system?

The system consists of 1 task T (performing all behaviors) The periodic task T is executed n time (J0 , J2 , . . . , Jn−1 ):

- The periodic of T: 100 ms The release time of J k (0 ≤ k < n): 20 + (k × 100) ms 
- Each job must complete before the release of the next job: D = p = 100 ms 
- Absolute deadline for Jk (0 ≤ k < n): 20 + [(k + 1) + 100] ms 
-  <img src="Chapter%201.assets/2020-06-03-16-05-23.png" style="zoom: 50%;" />

## Further terminology

* **Feasibility interval** between release time and deadline `(r, r + D]`  
* **Phase of task** = release time of the first job

<img src="Chapter%201.assets/image-20200608195124422.png" alt="image-20200608195124422" style="zoom:50%;" />

## Modelling periodic tasks

**Hyper-period *H***: Time after which the pattern of job release/execution times starts to repeat, limiting analysis needed. 

Example: $T1: p_1= 3; e_1= 1$   and $T2 : p_2 = 5; e_2 = 2$

<img src="Chapter%201.assets/image-20200608200047658.png" alt="image-20200608200047658" style="zoom: 33%;" />

### Utilization

The ratio $u_i = \frac{e_i}{p_i}$ is the utilization of task $T_i$, the fraction of time of a periodic task with period $p_i$ and execution time $e_i$ keeps a processor busy.

**Total utilization** of the system $U = \sum{u_i}$ : the sum of the ultilizations of all tasks.

For the jobs in a task, we usually assume the **relative deadline** = **period** of the task. Or it can **sometimes be shorter** than period, to allow **slack time**

> Many useful, real-world, systems fit this model; and it is easy to reason about such periodic tasks

### Sporadic & Aperiodic job

- Many real-time systems are required to respond to external events 

- The jobs resulting from such events are sporadic or aperiodic jobs
  - A **sporadic job** has a **hard deadlines** 
  - An **aperiodic job** has either a **soft deadline** or **no deadline**
- The release time for sporadic or aperiodic jobs can be modelled as a random variable with some probability distribution, $A(x)$
  - $A(x)$ gives the probability that the release time of the job is not later than $x$

### Precedence constraints and Dependencies

- The jobs in a task, whether periodic, aperiodic or sporadic, may be constrained to execute in a **particular order**
  - This is known as a **precedence constraint**
  - A job $J_i$ is a predecessor of another job $J_k$ (and $J_k$ is a successor of $J_i$ ) if $J_k$ cannot begin execution until the execution of $J_i$ completes. Says $J_i < J_k$
  - $J_i$ is an immediate predecessor of $J_k$ if $J_i < J_k$ and there is no other job $J_l$ such that $J_i < J_l < J_k$
  - $J_i$ and $J_k$ are independent when neither $J_i < J_k$ nor $J_i > J_k$
- *A job with a precedence constraint* becomes **ready for execution** once when **its release time has passed** and when **all predecessors have completed**

### Task graphs

Can represent the precedence constraints among jobs in a set $J$ using a directed graph $G = (J, < )$; each node represents a job; a **directed edge** goes from $J_i$ to $J_k$ if $J_i$ is an **immediate predecessor** of $J_k$ 

Example: ![image-20200608212924501](Chapter%201.assets/image-20200608212924501.png)

##### Dependencies & Contraints

**AND** constraint: wait for the completion of all immediate predecessors. Ký hiệu: unfilled circle

**OR** constraint: begin after its release time if **only some** of the immediate predecessors have completed. Ví dụ bên trên, ô vuông bên trái cần thoả 2/3 predecessor jobs là successor job có thể chạy. Ký hiệu: **unfilled square**

**Filled circle** represents *conditional branches* and *joins*

### Processor

A job executes – or is executed by the operating system – on a processor and may depend on some resources

- A processor, P, is an active component on which jobs scheduled 
- Examples:
  - Threads scheduled on a CPU
  - Data scheduled on a transmission link 
  - Read/write requests scheduled to a disk 
  - Transactions scheduled on a database server
- Each processor has a speed attribute which determines the rate of progress a job makes toward completion
  - May represent instructions-per-second for a CPU, bandwidth of a network, etc.
- Two processors are of the same type if they are functionally identical and can be used interchangeably

### Resource

- A resource, R, is a passive entity upon which jobs may depend
  - Examples:
    - memory
    -  sequence numbers
    -  mutexes
    -  database locks
  - Resources have different types and sizes, but do not have a speed attribute 
  - Resources are usually reusable, and are not consumed by use

#### Use of resources:

- If the system contains ρ (“rho”) types of resource, this means:
  - There are ρ different types of serially reusable resources 
  - There are one or more units of each type of resource, only one job can use each unit at once (mutually exclusive access) 
  - A job must obtain a unit of a needed resource, use it, then release it
- A resource is **plentiful** if no job is ever prevented from executing by the unavailability of units of the resource
  - Jobs never block when attempting to obtain a unit of a plentiful resource 
  - We typically omit such resources from our discussion, since they don’t impact performance or correctness

### Functional parameters

- Jobs may have priority, and in some cases may be interrupted by a higher priority job
  - **A job is preemptable** if its execution **can be interrupted** in this manner 
  - **A job is non-preemptable** if it **must run to completion once started**
    - Many preemptable jobs have periods during which they cannot be preempted; for example when **accessing certain resources**
  - The **ability to preempt** a job (or not) **impacts** the scheduling algorithm 
  - The context switch time is the time taken to switch between jobs
    - Forms an overhead that must be accounted for when scheduling jobs

- **Response to missing a deadline** can vary
  - **Some jobs have optional parts**, that can be **omitted to save time** (at the expense of a poorer quality result) 
  - Usefulness of late results varies; some applications tolerate some delay, others do not

### Scheduling

- Jobs scheduled and allocated resources according to a chosen set of scheduling algorithms and resource access-control protocols
  - Scheduler implements these algorithms
- A scheduler specifically assigns jobs to processors A schedule is an assignment of all jobs in the system on the available processors.
- A valid schedule satisfies the following conditions:
  - Every processor is assigned to at most one job at any time 
  - Every job is assigned at most one processor at any time 
  - No job is scheduled before its release time 
  - The total amount of processor time assigned to every job is equal to its maximum or actual execution time 
  - All the precedence and resource usage constraints are satisfied

- A valid schedule is also a feasible schedule if every job meets its timing constraints.
  - Miss rate is the percentage of jobs that are executed but completed too late
  - Loss rate is the percentage of jobs that are not executed at all

- A hard real time scheduling algorithm is **optimal** if the algorithm always produces a feasible schedule if the given set of jobs has feasible schedules

- Many scheduling algorithms exist: main focus of this module is understanding real-time scheduling

