+++
categories = ["esper"]
date = 2020-10-10T08:58:07Z
layout = ""
tags = ["esper"]
title = "Esper Intro"

+++
Esper có 3 thành phần chính:

* EPL (giống SQL)
* Compiler (dịch EPL thành bytecode)
* Runtime (chạy bytecode, nhận event và filter even, thực hiện hành động nếu thoả mãn)

Data =======> EPL (filter) =======>Do action (Event Listener)

The Esper compiler compiles EPL source code into Java Virtual Machine (JVM) bytecode so that the resulting executable code runs on a JVM within the Esper runtime environment.

The Esper runtime runs on top of a JVM. You can run byte code produced by the Esper compiler using the Esper runtime.