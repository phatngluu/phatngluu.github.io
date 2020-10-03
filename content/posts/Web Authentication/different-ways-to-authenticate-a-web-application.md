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

## Third party access 

If we have a need to expose our API’s outside of our system like third party app or even to access it from mobile apps we end up in two common ways to share the user information.

Via API-token which is same as JWT token, where the token will be send via Authorization header which will get handled at API gateway to authenticate the user. And the other option is via Open Authentication(OAuth),OAuth is a protocol that allows an application to authenticate against server as a user. The recommendation is to implement OAuth 1.0a or OAuth 2.0. OAuth 2.0 relies on HTTPS for security and it currently implemented by Google, Facebook, Twitter etc., OAuth 2 provides secured delegate access to a resource based on user. OAuth 2 does this by allowing a token to be issued by Identity provider to these third party applications, with the approval of user. The client then uses the token to access the resource on behalf of that user.

