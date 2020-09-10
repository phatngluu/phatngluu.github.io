---
title: "[Advanced] Reflection"
date: 2020-09-10T09:51:45.000+07:00

---
Read detail at: 

* [https://o7planning.org/vi/10155/huong-dan-java-reflection](https://o7planning.org/vi/10155/huong-dan-java-reflection "https://o7planning.org/vi/10155/huong-dan-java-reflection")
* [https://viblo.asia/p/java-reflection-and-anotation-DbmvmWRMeAg](https://viblo.asia/p/java-reflection-and-anotation-DbmvmWRMeAg "https://viblo.asia/p/java-reflection-and-anotation-DbmvmWRMeAg")

# Reflection

> **Java Reflection** giới thiệu một cách tiếp cận khác, bạn có thể truy cập vào một trường của một đối tượng nếu bạn biết tên của trường đó. Hoặc bạn có thể gọi một phương thức của đối tượng nếu bạn biết tên phương thức, các kiểu tham số của phương thức, và các giá trị tham số để truyền vào ...

> **Java Reflecion** cho phép bạn đánh giá, sửa đổi cấu trúc và hành vi của một đối tượng tại thời gian chạy (runtime) của chương trình. Đồng thời nó cho phép bạn truy cập vào các thành viên **private** (private member) tại mọi nơi trong ứng dụng, điều này không được phép với cách tiếp cận truyền thống.

# "java.lang.Class" API

[https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html](https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html "https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html")

Properties:

* 

Methods

* [**`getAnnotations`**](https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html#getAnnotations--)`()` : Returns annotations that are _present_ on this element.
* `getAnnotation(Class<A> annotationClass)`: Returns this element's annotation for the specified type if such an annotation is _present_, else null.
* [**getMethods**](https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html#getMethods--)()
* [**getModifiers**](https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html#getModifiers--)()
* [**getMethod**](https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html#getMethod-java.lang.String-java.lang.Class...-)([**String**](https://docs.oracle.com/javase/8/docs/api/java/lang/String.html "class in java.lang") name, [**Class**](https://docs.oracle.com/javase/8/docs/api/java/lang/Class.html "class in java.lang")<?>... parameterTypes)