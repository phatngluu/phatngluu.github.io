Full article: https://www.baeldung.com/maven

# POM - Project Object Model

Describes the project, manages dependencies and configures plugins for building the software.

Defines the relationships among modules of multi-module projects.

## Project Identifier

Identifiers is to uniquely identify a project and specify how the project artifact should be packaged:

- *groupId* – a unique base name of the company or group that created the project
- *artifactId* – a unique name of the project
- *version* – a version of the project
- *packaging* – a packaging method (e.g. *WAR*/*JAR*/*ZIP*)

The first three of these (*groupId:artifactId:version*) combine to form the unique identifier to specify which versions of external libraries (e.g. JARs) your project will use.

## Dependencies

To declare a dependency, you need to provide the *groupId, artifactId*, and the *version*.

## Repositories

> A repository is used to **hold build artifacts and dependencies** of **varying types**.

> If **an artifact or a plug-in** is **available** in the **local** repository, **Maven uses it**. Otherwise, it is **downloaded** from a central repository and **stored in the local** repository.

> **Some libraries** are **not available** at the **central** repository **but** at an **alternate** repository. For those libraries, you need to **provide the URL to the alternate** repository inside *pom.xml* file.

**Please note that you can use multiple repositories in your projects.**

## Properties

> Custom properties can help to **make your *pom.xml* file easier to read and maintain**. In the **classic use case**, you would use custom properties to **define version**s for your project's dependencies.

Maven properties are value-placeholders and are accessible anywhere within a `pom.xml` by using the notation `${name}`, where *name* is the property.

Properties are also often used to define build path variables.

## Build

It provides information about the default Maven *goal*, the directory for the compiled project, and the final name of the application. The default *build* section looks like this:

```xml
<build>
    <defaultGoal>install</defaultGoal>
    <directory>${basedir}/target</directory>
    <finalName>${artifactId}-${version}</finalName>
    <filters>
      <filter>filters/filter1.properties</filter>
    </filters>
    //...
</build>
```

The default output folder for compiled artifacts is named \*target\*, and the final name of the packaged artifact consists of the \*artifactId\* and \*version\*, but you can change it at any time.

## Profiles

A *profile* is basically a set of configuration values. By using *profiles*, you can customize the build for different environments such as Production/Test/Development.

# Maven Build Lifecycles

Every Maven build follows a specified *lifecycle*. You can execute several build *lifecycle* *goals*, including the ones to *compile* the project’s code, create a *package,* and *install* the archive file in the local Maven dependency repository.

## Lifecycle Phases

The following list shows the most important Maven *lifecycle* phases:

- *validate* – validate the project is correct and all necessary information is available
- *compile* – compiles the provided source code into binary artifacts
- *test* – executes unit tests
- *package* – packages compiled code into an archive file
- *integration-test* – executes additional tests, which require the packaging
- *verify* – checks if the package is valid
- *install* – installs the package file into the local Maven repository
- *deploy* – deploys the package file to a remote server or repository

## Plugin and Goals

