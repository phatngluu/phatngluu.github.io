# CORBA Demo
## Preparing virtual machine (using Docker)

- Ubuntu
- OpenJDK 8

**In host's terminal:**

```
cd ~/Github/DS/CORBA

# Build image
docker build --tag corba:latest .

# Run container
docker run -it --publish 1050:1050 --detach --name corba corba:latest

# Open container's terminal
docker exec -it corba /bin/sh; exit
```

**In container's terminal:**

```
cd ~/corba/calc

# build project & compile
idlj -fall Calc.idl
javac *.java CalcApp/*.java
orbd -ORBInitialPort 1050&

# run server
java CalcServer -ORBInitialPort 1050 -ORBInitialHost localhost&
```

**To run client, open new container's terminal:**

```
cd ~/corba/calc
java CalcClient -ORBInitialPort 1050 -ORBInitialHost localhost
```



**Remove built project:**

```
rm *.class
rm -r CalcApp
rm -r orb.db
```

### The basic steps for CORBA development include:

http://www.ois.com/Products/what-is-corba.html

![img](http://www.ois.com/images/stories/ois/266_red_bullet1.gif) **Create the IDL to Define the Application Interfaces**
The IDL provides the operating system and programming language independent interfaces to all services and components that are linked to the ORB. The IDL specifies a description of any services a server component exposes to the client. The term "IDL Compiler" is often used, but the IDL is actually translated into a programming language.

*![267_red_bullet2.gif](http://www.ois.com/images/stories/ois/267_red_bullet2.gif)* **Translate the IDL**
An IDL translator typically generates two cooperative parts for the client and server implementation, stub code and skeleton code. The stub code generated for the interface classes is associated with a client application and provides the user with a well-defined Application Programming Interface (API). In this example, the IDL is translated into C++.

![268_red_bullet3.gif](http://www.ois.com/images/stories/ois/268_red_bullet3.gif) **Compile the Interface Files
**Once the IDL is translated into the appropriate language, C++ in this example, these interface files are compiled and prepared for the object implementation.

![269_red_bullet4.gif](http://www.ois.com/images/stories/ois/269_red_bullet4.gif) **Complete the Implementation
**If the implementation classes are incomplete, the spec and header files and complete bodies and definitions need to be modified before passing through to be compiled. The output is a complete client/server implementation.

*![270_red_bullet5.gif](http://www.ois.com/images/stories/ois/270_red_bullet5.gif)* **Compile the Implementation
**Once the implementation class is complete, the client interfaces are ready to be used in the client application and can be immediately incorporated into the client process. This client process is responsible for obtaining an object reference to a specific object, allowing the client to make requests to that object in the form of a method call on its generated API.

![271_red_bullet6.gif](http://www.ois.com/images/stories/ois/271_red_bullet6.gif) **Link the Application
**Once all the object code from steps three and five have been compiled, the object implementation classes need to be linked to the C++ linker. Once linked to the ORB library, in this example, ORB*express*, two executable operations are created, one for the client and one for the server.

![272_red_bullet7.gif](http://www.ois.com/images/stories/ois/272_red_bullet7.gif) **Run the Client and Server
**The development process is now complete and the client will now communicate with the server. The server uses the object implementation classes allowing it to communicate with the objects created by the client requests.



In its simplest form, the server must perform the following:

- Create the required objects.
- Notify the CORBA environment that it is ready to receive client requests.
- Process client requests by dispatching the appropriate servant.



### How CORBA works

https://voer.edu.vn/m/corba-va-mo-hinh-phan-tan/2ef24490

![img](https://voer.edu.vn/file/25855)
- Phần cài đặt đối tượng Corba trên máy chủ diễn ra như sau:
  - Đặc tả đối tượng bằng ngôn ngữ IDL của Corba.
  - Chuyển đặc tả đó thành mô tả của ngôn ngữ cụ thể. Dựa vào đặc tả IDL yêu cầu trình biên dịch tạo ra lớp trung gian _SKel.
  - Cài đặt đối tượng trên bằng ngôn ngữ java.

- Phần kết nối với đối tượng máy khách.
  - Dùng đặc tả IDL của đối tượng yêu cầu trình biên dịch tạo lớp trung gian _Stub.
  - Khi trình khách triệu gọi đến đối tượng chủ, lời gọi sẽ được chuyển qua _Stub trên máy khách, gửi đến trình môi giới ORB. Trình ORB máy khách gửi đến trình ORB máy chủ theo giao thức IIOP. Trình ORB máy chủ chuyển lời gọi cho _Skel máy chủ. Cuối cùng đối tượng Corba trên trình chủ sẽ thực thi phương thức của nó. 

Giao thức IIOP làm nền tảng cho tất cả các đối tượng có thể giao tiếp với nhau trên mạng Internet một cách dễ dàng.