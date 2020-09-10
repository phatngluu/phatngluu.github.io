---
title: "[Advanced] JPA - What is it?"
date: 2020-09-10T09:53:14.000+07:00

---
# What is it?

>  Bất kỳ một ứng dụng nào cũng đều cần phải thực hiện các tháo tác (CRUD) đến database bằng việc lưu trữ, truy vấn dữ liệu. Chúng ta cần phải viết nhiều code để thực hiện các việc này. Với công nghệ [JDBC](https://gpcoder.com/5188-huong-dan-ket-noi-co-so-du-lieu-voi-java-jdbc/) trước đây, chúng ta phải thực hiện các việc: mở kết nối vào Database, tạo các Statement, ResultSet, … và sau cùng phải đóng tất cả các thứ đó lại. Dẫn đến code sẽ trở nên cồng kềnh, khó mở rộng và bảo trì. Chúng ta cũng cần phải làm việc với cả Java code và SQL. Thực tế, từng Database khác nhau thì câu SQL có một số phần khác nhau, nên đòi hỏi chúng ta phải nắm được sự khác biệt này để viết code cho phù hợp. Khi ứng dụng muốn chuyển từ database sang database khác (ví dụ từ MySQL sang Oracle) thì chắc chắn sẽ có một số phần của câu SQL cần phải đổi. Công việc sửa code lại đòi hỏi phải test lại ứng dụng. Điều này sẽ tốn thời gian, chi phí phát triển và cũng gặp không ít rủi ro. Để khắc phục nhược điểm này, đã có rất nhiều Framework ra đời với mục đích giúp xóa đi vấn để về tương thích giữa các Database, giúp tập trung vào phần xử lý nghiệp vụ.

>  Trong phần tiếp theo của bài viết này, tôi sẽ giới thiệu với các bạn JPA (Java Persistence API) – một chuẩn đặc tả cho các ORM Framework giải quyết vấn đề trên.

>  JPA chỉ là một API định nghĩa các đặc tả cần thiết và không có code hiện thực từ những đặc tả đó. Nó chỉ chứa những hướng dẫn để hiện thực ORM. Do đó cần phải có một cài đặt ORM để hoạt động và persist các đối tượng Java. Các ORM Framework có thể sử dụng cho JPA như: Hibernate, iBatis, Eclipse Link, OpenJPA, ….