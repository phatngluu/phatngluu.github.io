## Web Service

### Problem:

New business model:

- Dine-in

- Take away

- Delivery

  NEC ------------------------ Delivery App

(order system)	|

​						      |

​						Toreta

​			(reservation system)

Solution:

NEC ---------  Webserver  --------------- Delivery App

​      						|

​						      |

​						Toreta

​			(reservation system)

Webserver: receives orders, table reservations; sends delivery requests

### In this chapter:

To connect 2 systems, webservice is required.

![image-20200608094306580](Lecture%205%20note.assets/image-20200608094306580.png)

### Information system interaction

Why would we have interaction between 2 systems?

=> Because we want a new system have features of those 2 systems by using them (not develope any new system with the same feature, because the cost and wasting time)

- Business and technology change is instantaneous
- The evolution of information systems



#### 2 sub models:

- Integration: a new system contains 2 existed systems
- Interoperability: communication make 2 systems work together

Analyse the problem in 2 models => Choose which model is easier/low cost

Communication needs interface.

System interface: a connection between 2 systems.







### Integration vs Interoperability

Why need integration?

=> 

### Web Service

https://www.vs.inf.ethz.ch/edu/WS0405/VS/VS-050117.pdf

Example: https://www.youtube.com/watch?v=oTzNRv6X51o

### Web services are important in distributed systems: 

It solve these problem of distributed systems:
-	Transperency
-	Heterogeneity
-	Openness
-	Security



### Web service & API

API needs access from browser while WS does not

https://www.guru99.com/api-vs-web-service-difference.html

### SOAP vs REST

|             | SOAP                                                         | REST                                                         |
| ----------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| Model       | SOAP-based Web Service Model [link](https://www.researchgate.net/profile/Sanjay_Garg7/publication/282148271/figure/fig1/AS:391502577586181@1470352896964/SOAP-based-Web-Service-Model.png) | Server/Client                                                |
| Protocol    | HTTP, SMTP, TCP, UDP/XML-based messaging *protocol*          | HTTP                                                         |
| Data Format | XML                                                          | variety formats (plaintext, HTML, JSON, XML...)              |
| Use case    | Enterprise apps, high-security apps, distributed environment, financial services, payment gateways, telecommunication services. | Public APIs for web services, mobile services, social networks. |

Details: https://raygun.com/blog/soap-vs-rest-vs-json/#table 

