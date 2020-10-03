+++
categories = ["web authentication"]
date = 2020-10-03T16:04:59Z
layout = ""
tags = ["web authentication"]
title = "JWT - JSON Web Token"

+++
See video: https://www.youtube.com/watch?v=7Q17ubqLfaM

# How JWT is created and verified:

![](/static/uploads/2020-10-03-22-35-04.png)

# Structure of JWT and encode/decode

![](/static/uploads/2020-10-03-23-10-31.png)

![](/static/uploads/2020-10-03-22-36-57.png)

# How different services work with JWT

![](/static/uploads/2020-10-03-22-38-55.png)

Your system has 2 services are running. They share the same secret key for JWT.

Suppose a client has logged in the "Bank" service and client's browser keep a JWT. So if the client want to log in "Retirement" service, the client can use JWT for authentication.

# For very detail
https://topdev.vn/blog/json-web-token-la-gi/

# JWT Authentication Tutorial - Node.js
https://www.youtube.com/watch?v=mbsmsi7l3r4