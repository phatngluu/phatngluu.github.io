# What is it?

## The DevOps Cycle

> There are different parts of the DevOps life-cycle: Version Control, Continuous Integration, Continuous Delivery, and Continuous Deployment.

### What is CI

> This is the part where your code gets compiled, reviewed, and tested.
>
> Big goals with DevOps in general: detecting and fixing bugs and security issues as early as possible, it's important when you are deploying changes multiple times a week or even a day. This saves you time by stopping the rest of the pipeline from running when an issue occurs. You aren’t waiting until the very end to get feedback to developers.
>
> Most DevOps pipelines will be triggered from a push to a branch or some other set of conditions around commits. This starts the build phase which is the beginning of most pipelines.

> In the build phase all of your code is compiled to make the artifacts that will eventually get deployed. Right after your app has been built, the first round of testing will start.
>
> Unit tests will run and weed out any of those simple code bugs. If any tests fail here, it will send a notification to the developer or team that worked on those changes.

> The point of all of these checks in the initial stages is to make sure that problems get addressed as early as possible.
>
> Once the unit tests finish, it’s likely your artifact will get deployed to a staging or quality assurance environment.

### What is CD

>  The “CD” part of CI/CD actually represents two stages in the DevOps flow: continuous delivery and continuous deployment. 

>  Continuous delivery is the automation behind **pushing applications to different environments**.



### Pros of CI/CD

- Deployment of code changes is less risky.
- Removes the manual deployment steps.
- Faster shipping speed.
- Increased code coverage.

### Cons of CI/CD

- It takes a lot of upfront investment to set up a CI/CD pipeline.
- A lot of automated tests have to be written.
- There has to be a cultural shift within the company for DevOps to work.
- Legacy systems often don’t support CI/CD.

## Considerations before trying CI/CD

If you’re wondering whether or not you should try to implement a CI/CD pipeline for your project, here are a few things to think about.

- Are there a lot of manual steps in your deploy process?
- Do bugs get to production regularly and frequently?
- Do you have to coordinate multiple services and code bases?
- Is there only one person on the team that knows the whole deploy process?
- Would you have to make large upgrades to the code base?
- Can you get support from other parts of the company to get this started?
- Have you had issues with compliance audits?
- How often are you able to security testing with your current process?
- Can you consistently and reliably get small code changes to production?
- Would this help decrease the number of support tickets your team has to handle?

