+++
categories = ["web authentication"]
date = 2020-10-03T10:16:21Z
layout = ""
tags = ["web authentication"]
title = "Different ways to Authenticate a Web Application"

+++
OP: [https://medium.com/@vivekmadurai/different-ways-to-authenticate-a-web-application-e8f3875c254a](https://medium.com/@vivekmadurai/different-ways-to-authenticate-a-web-application-e8f3875c254a "https://medium.com/@vivekmadurai/different-ways-to-authenticate-a-web-application-e8f3875c254a")

Various ways of authentication:

* Cookie-Based authentication
* Token-Based authentication (SPA & RESTful)
* Third-party access(OAuth, API-token)
* OpenId
* SAML

![](/static/uploads/1-tsj9zpscf2imqiucgqmg3w.png)

## Cookie-Based

The client **posts the login credential** to the server, **server verifies** the credential and **creates session id** which is **stored in server(state-full)** and **returned to client** via set-cookie. On subsequent **request** the **session id** from the cookie is **verified** in the server and the **request get processed**. 

Upon **logout session id** will be **cleared** from **both client cookie and server**.

## Token-Based

There are **different ways** to **implement token based** authentication.

Most commonly used is **JSON Web Token(JWT)**. Client **sends the credentials**, the **server validates the credentials** and **generates a signed JWT** which **contains the user information**. Note, the **token will never get stored in server**(stateless). On subsequent **request** the **token** will be **passed** to server and gets **verified**(**decoded**) in the server. 

The token can be maintained at client side in local storage, session storage or even in cookies.