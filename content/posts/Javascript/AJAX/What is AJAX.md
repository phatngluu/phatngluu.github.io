> AJAX enables you update HTML without loading a new webpage

> It sends a request to server, and uses Javascript to update the response to current page.

> AJAX has another name: "XMLHttpRequest Object" (XHR)

#### How AJAX works

1. Create an XMLHTTP Request object.
2. Create a callback function.
3. Open a request. GET/POST?
4. Send the request.

##### Example

```js
var request = new XMLHttpRequest();
request.onreadystatechange = function () {
  if (request.readyState === 4) {
    document.getElementById("footer").innerHTML = request.responseText;
  }
};
request.open('GET', 'footer.html');
request.send();
```

```js
const xhr = new XMLHttpRequest();
  xhr.open('GET', url);
  xhr.onload = () => {
    if(xhr.status === 200) {
      let data = JSON.parse(xhr.responseText);
      console.log(data);
    }
  };
  xhr.send();
```

#### GET and POST

GET sends data thru request URL, POST sends data thru request body.

