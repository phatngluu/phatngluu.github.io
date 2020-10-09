+++
categories = ["siem"]
date = 2020-10-09T10:03:29Z
layout = ""
tags = ["siem"]
title = "SIEM System Requirements"

+++
# Monitoring a web server

Task is to implement SIEM system using CEP engine which monitors and reports potential attacks.

Requirements:

* Our web server is `httpd` . SIEM reads its log file and find different kinds of security related log entries (Eg. failed logins of protected websites, denied accesses to resources or SSL related issues). HTTP status codes can help.
* Use the CEP paradigm to process these events and find potential security threats: 
  * Define Event Hierarchy which denotes levels of abstraction you want to realise. 
  * This also implies event patterns of occurring events, which denote a particular potential threat. 
  * In the end, one or more alerts are produced.
* Classify eventually produced alert: low or high. (automatically prioritised SIEM events are error-prone, alerts have to be treated equally, user decide real priority of the alert.

Questions:

* \[Ask Martin\] The webserver will be given or create by ourselves?
* Find: webserver potential security threats? List them out.
* 