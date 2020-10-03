+++
categories = ["web authentication"]
date = 2020-10-03T16:35:51Z
layout = ""
tags = ["web authentication"]
title = "OAuth"

+++
See video: [https://www.youtube.com/watch?v=SXDce0e3Ue4](https://www.youtube.com/watch?v=SXDce0e3Ue4 "https://www.youtube.com/watch?v=SXDce0e3Ue4")

User / Twitter / App (3rd Party)

 1. App requests access to user's Twitter
 2. User says OK
 3. App asks Twitter for request token – Token 1
 4. Twitter sends Token1 to App
 5. App sends Token1 to User to authorize
 6. User tells Twitter to authorize Token1
 7. Twitter sends User authorized token – Token2
 8. User sends Token 2 to App
 9. App sends to Twitter Token2 to request send a new authorization token
10. Twitter turns Token2 to authorization token – Token 3
11. From now on, App uses Token 3 to communicate with Twitter.

Other more technical video: [https://www.youtube.com/watch?v=3pZ3Nh8tgTE](https://www.youtube.com/watch?v=3pZ3Nh8tgTE "https://www.youtube.com/watch?v=3pZ3Nh8tgTE")