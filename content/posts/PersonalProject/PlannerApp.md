## From idea to reality

1. Ý tưởng loé sáng: giai đoạn này là giai đoạn rất sơ khai về ý tưởng, những chi tiết về ý tưởng vẫn chưa đầy đủ và chúng có rất ít liên kết với nhau

2. Lặn sâu vào ý tưởng: ý tưởng được mở rộng, chi tiết hơn. Ý tưởng này có những trở ngại gì, đưa ra giải pháp vượt qua trở ngại. Bổ sung thêm những chi tiết của ý tưởng chính, tìm ra sự bất đồng giữa những chi tiết và sửa chúng.

3. Lên kế hoạch triển khai cho ý tưởng: Bước ở bên trên đã giúp chúng ta liệt kê được khung sườn (đường đi) để hoàn thành ý tưởng. Từ khung sườn đó, liệt kê các bước để thực hiện ý tưởng. Ước lượng khoảng thời gian cho từng ý tưởng. Ước lượng thời gian hoàn thành ý tưởng.

4. Thực hiện: mang các bước thực hiện ý tưởng bỏ vào lịch và thực hiện theo lịch. Trong quá trình làm có thể sẽ có những vấn đề phát sinh, thực hiện điều chỉnh bước 3 (chỉnh sửa khung sườn), và điều chỉnh bước 4 và tiếp tục thực hiện.

## Ví dụ: làm app Sitary

### 1. Ý tưởng: ứng dụng phân chia & liệt kê tasks, lên kế hoạch thực hiện, nhắc nhở.

### 2. Thêm chi tiết:

  1. Features of this app?
     1. Allow user create tasks and its subtasks:
        1. Categorize tasks and subtasks
        2. Add start time (time have to start working). Optional: deadline (Work duration since the start time)
        3. Every tasks have 4 status: TODO (added, unplanned), PLANNED (added to calendar), DONE (task completed), OVERDUE (=> allow this kind of tasks to renew, and get planned)
     2. Remind PLANNED, OVERDUE tasks
     3. Delete, Restore, Permantly Delete Tasks
     4. View Mode:
        1. Listview: When user clicks on the "master" task, all subtasks will be shown
        2. Calendarview: It only displays the planned tasks the corresponding calendar
        3. Boardview: view tasks by grouping them. Eg: status...
  2. App development: 
     1. This app is made for macOS (main) & Windows, iOS (in the future)
     2. App architecture: 
        1. Server (store, sync data between client and send notifications)
        2. Client (perform CRUD operations, allow user to do above feature with friendly UI)
     3. Which platform?: 
        1. Server: NodeJS on Heroku
        2. Client: Electron on macOS
     4. App notification: currently, send via Messenger is the most convienient way. In the future, server will send noti to the client.

### 3. Lên kế hoạch triển khai: vì nhu cầu dùng app là rất cần thiết, nên quá trình thực hiện dự án được chia thành 2 giai đoạn như sau:
   1. First stage: Develop the Client
      1. Design the client app: 
         1. Data tier: how does it store data and retrieve them
            1. Which database is suitable? Eg: (constraint) can be extend without changes when migrating to work with server, database can work EASILY with NodeJS on any platform (macOS, Windows)
            2. Define set of **data methods** corresponding to functionalities of the app. Eg: method create tasks with priority and its group.
         2. Logic tier: retrieve data & send nofications.
            1. Retrieve data from presentation tier then use **data methods** to store in database.
            2. Take responsibilities sending remind notification: running in background to check & send notification in macOS
         3. Presentation tier: capture input -> send to logic tier, render data from logic tier
            1. Which view components it contains
               1. Which component to show a list (contains buttons)
               2. Component to show calendar & tasks
            2. Capture input then send to logic tier: 
               1. add tasks, 
               2. drags & drops, 
      2. Learn develop macOS app with Electron: 
         1. https://www.lynda.com/Electron-tutorials/Electron-Building-Cross-Platform-Desktop-Apps/5019843-2.html
         2. https://www.youtube.com/watch?v=iyjM39a0MWE
         3. https://www.youtube.com/playlist?list=PLC3y8-rFHvwiCJD3WrAFUrIMkGVDE0uqW 
         4. https://www.youtube.com/watch?time_continue=213&v=kN1Czs0m1SU&feature=emb_title
         5. https://www.udemy.com/course/master-electron/?LSNPUBID=jU79Zysihs4&ranEAID=jU79Zysihs4&ranMID=39197&ranSiteID=jU79Zysihs4-oNEbdRY.zOsMTda7UY7Xsg&utm_medium=udemyads&utm_source=aff-campaign
         6. Organize the code: https://blog.axosoft.com/electron-things-to-know/
   2. Second stage: Develop the Server (soon)
   3. Final stage: Extend the Client and connect it with Server (soon)