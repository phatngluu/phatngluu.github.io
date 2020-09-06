# What is port?

- In [computer networking](https://en.wikipedia.org/wiki/Computer_networking), a **port** is a communication endpoint.
- At the software level, within an [operating system](https://en.wikipedia.org/wiki/Operating_system), a port is a logical construct that identifies a specific [process](https://en.wikipedia.org/wiki/Process_(computing)) or a type of [network service](https://en.wikipedia.org/wiki/Network_service).

- A port number is always associated with an [IP address](https://en.wikipedia.org/wiki/IP_address) of a host and the type of transport protocol used for communication. It completes the destination or origination [network address](https://en.wikipedia.org/wiki/Network_address) of a message. 

- Reserved ports is to identify specific services so that an arriving packet can be easily forwarded to a running application. For this purpose, the lowest-numbered 1024 port numbers identify the historically most commonly used services and are called the [well-known port numbers](https://en.wikipedia.org/wiki/Well-known_port_numbers). Higher-numbered ports are available for general use by applications and are known as [ephemeral ports](https://en.wikipedia.org/wiki/Ephemeral_port).

# Port number

- A port number is a 16-bit unsigned integer, thus ranging from 0 to 65535.
- For **TCP**, port `0` is reserved. **UDP**, port `0` means no port.

# Use in URLs

By default, HTTP uses port 80 and HTTPS uses port 443, but a URL like `http://www.example.com:8080/path/`specifies that the [web browser](https://en.wikipedia.org/wiki/Web_browser) connects instead to port 8080 of the HTTP server.

## Opening ports

```
sudo lsof -i -P -n
```

