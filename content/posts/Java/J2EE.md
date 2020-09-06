https://niithanoi.edu.vn/j2ee-la-gi.html

#### Mục đích của J2EE

**Kiến trúc J2EE cung cấp các dịch vụ để đơn giản hóa các khó khăn phổ biến nhất mà các lập trình viên gặp phải khi xây dựng các ứng dụng / website hiện đại.**

**Ví dụ, một khó khăn phổ biến đối với phát triển website là làm thế nào để nhận / xử lý / trả về kết quả theo yêu cầu đến từ khách hàng trên website.**

*Để đơn giản hóa vấn đề này J2EE cung cấp Servlet và Java Server Page (JSP) APIs, chúng cung cấp các phương thức như tìm xem khách hàng gõ gì vào trường nhập liệu trong from hoặc thực hiện lưu trữ cookie trên trình duyệt của người dùng.*

**Một nhiệm vụ phổ biến khác là làm thế nào để lưu trữ và truy xuất thông tin trong cơ sở dữ liệu.**

*Để giải quyết mục tiêu này, Java EE cung cấp Java Persistence API (JPA,) giúp dễ dàng ánh xạ dữ liệu được sử dụng trong một chương trình tới thông tin được lưu trữ trong các bảng và hàng của cơ sở dữ liệu.*

**Ngoài ra, việc tạo các web service hoặc các thành phần logic có khả năng mở rộng cao được đơn giản hóa thông qua việc sử dụng đặc tả Enterprise JavaBeans (EJB).**

#### **Công nghệ lõi của J2EE là gì?**

Ngoài 4 API đã nói ở trên, có hơn 30 Java API được bao gồm dưới dạng các công nghệ lõi của Java EE, với con số đó đã gần 50 ở phiên bản J2EE 8.

Các công nghệ lõi Java EE gồm:

- **HTTP client technology**: Công nghệ này sử dụng để xử lý các máy khách dựa trên HTTP, J2EE cũng bao gồm API Java cho lập trình WebSocket, API để xử lý JSON, API JSF và Servlet và JSP Standard Tag Library (JSTL).

- **Công nghệ truy cập CSDL và tài nguyên**: Các công nghệ này sử dụng để tương tác với các hệ thống bên ngoài và hệ thống Back end. Java EE bao gồm JavaMail, Standard conenctor Architecture, Java Message Service (JMS) API và Java Transaction API (JTA).

- **Công nghệ REST và Web Service**: Để giúp lập trình và triển khai các dịch vụ web dựa trên REST-, SOAP-, XML và JSON, các API Java cho Dịch vụ web RESTful (JAX-RS) và các dịch vụ web dựa trên XML (JAX-WS), cùng với các API cho thông báo XML và đăng ký XML (JAXR).

- **Java EE security and container management**: Để triển khai bảo mật Java EE tùy chỉnh và quản lý các thùng chứa Java EE, các lập trình viên phần mềm có quyền truy cập vào Java Authorization Contract cho các Container và Java Authentication Service Provider Interface cho các container.

#### **Java khác gì với J2EE?**

"**Java**" vừa là tên của ngôn ngữ lập trình hướng đối tượng Java vừa là thuật ngữ dành cho "Mọi thứ về Java". Hầu hết mọi người nghĩ đến "Java core" hoặc "JSE" (Phiên bản tiêu chuẩn Java) khi họ sẽ nói "Java".
"**J2EE**" (hiện nay được gọi là JEE) là Phiên bản Java dành cho doanh nghiệp, bao gồm Java Core cộng với một bộ thư viện mạnh mẽ.Các thư viện này hầu hết hữu ích nếu các ứng dụng bạn đang phát triển là cần đến tính đa tầng (multi-tier), chịu lỗi và / hoặc phân tán, chạy trên các máy chủ ứng dụng.

#### **So sánh J2EE với Java SE**

Các API được liệt kê ở trên chỉ là một phần của các thành phần J2EE khác nhau có sẵn cho các lập trình viên.

Tất cả các API được định nghĩa trong **Phiên bản Java tiêu chuẩn** hoặc **Java SE**, cũng được cung cấp cho các ứng dụng J2EE.

- Nhiệm vụ chính của Java SE là: Phát triển các ứng dụng Desktop

- Nhiệm vụ chính của Java EE là: Phát triển website, web service, networking, server side và các ứng dụng dựa trên web.

Java EE không cạnh tranh với Java SE, mà thay vào đó là một siêu API của các API xây dựng trên nền tảng được cung cấp bởi Java SE và Bộ công cụ phát triển Java tiêu chuẩn (JDK).

Các ứng dụng Java EE được xây dựng dựa trên nền tảng do Java SE cung cấp và tất cả các ứng dụng Java EE chạy trên **[máy ảo Java](https://niithanoi.edu.vn/hieu-ngay-may-ao-java-jvm-va-kien-truc-cua-may-ao-java.html)** hỗ trợ tất cả các API được định nghĩa bởi Java SE.

#### **So sánh J2EE với Spring Framework**

Nó có trọng tâm là phát triển front end Với Servlets và JSP và phát triển back end đang được thực hiện với EJB.

Vì thế, để thay thế J2EE, với trọng tâm quan trọng là loại bỏ việc sử dụng EJB của J2EE, **[Rod Johnson](https://en.wikipedia.org/wiki/Rod_Johnson_(programmer))** đã tạo ra **[Spring Framework](https://spring.io/)**. Spring Framework đã nhanh chóng chứng minh rằng các ứng dụng cấp doanh nghiệp có thể được viết bằng Java mà không cần toàn bộ J2EE stack. Spring Framework đã sử dụng một cách tiếp cận nhẹ nhàng hơn để phát ứng dụng doanh nghiệp dựa trên ngôn ngữ lập trình Java và các lập trình viên đã bắt đầu chấp nhận cách tiếp cận đơn giản hơn này để tạo ra các website bằng Java ngày nay.

*`Hiện nay, Spring Framework là cách phổ biến nhất được các lập trình viên sử dụng để lập trình web với Java.`*





#### Guide to get started with J2EE

https://medium.com/javarevisited/everything-you-need-to-know-about-getting-started-with-java-ee-57c8702198fa

