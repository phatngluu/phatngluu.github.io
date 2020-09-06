Download lynxrowser

Download ngrok

```
lynx https://ngrok.com/download
```

Unzip ngrok & Note down the path

Export to $PATH

Adding new directories to your user or global `$PATH` variable is pretty simple. This allows you to execute commands and scripts stored on nonstandard locations without needing to type the full path to the executable.

```
export PATH="/root/.ngrok2:$PATH"
```

Add token

```
ngrok authtoken YOUR_TOKEN
```

Run your localhost, please note down the port

Use ngrok to expose your localhost with above port

```
ngrok http 5500
```

