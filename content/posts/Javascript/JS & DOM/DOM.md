# DOM Methods

### "Get" selection

```js
// Return first match HTML element
document.getElementById('a'); 
// Return HTML collection
document.getElementsByTagName('p');
document.getElementsByClassName('className');
```

### Query Selector

querySelector returns the first element it matches, while querySelectorAll returns all elements it matches. [MDN page for querySelector](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector) [MDN page for querySelectorAll](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelectorAll)

```js
// Selecting title attribute
document.querySelector('[title=MyTitle]');
document.querySelectorAll('[title=MyTitle]');
// Selecting id
const myElement = document.querySelector('#myId');
// Selecting class
const studentInfo = document.querySelectorAll('.student-info')
// Selecting descendants `a` in `nav`
let navigationLinks = document.querySelectorAll('nav a');
// Selecting descendants `a` in tag has id gallery
let galleryLinks = document.querySelectorAll('#gallery a');
```

# DOM Properties

- `textContent` and `innerHTML`: [MDN page for textContent](https://developer.mozilla.org/en-US/docs/Web/API/Node/textContent) & [MDN page for innerHTML](https://developer.mozilla.org/en-US/docs/Web/API/Element/innerHTML)
- Get value of input

  ```js
  var inputValue = document.getElementById('linkName').value;
  ```

- `Element.style` is an object "Style" . It has its own properties.

# Add/Remove DOM Elements

[MDN page for createElement](https://developer.mozilla.org/en-US/docs/Web/API/Document/createElement)

```js
Node.appendChild(newElement);
Node.removeChild(oldElement);
```

# DOM events

https://developer.mozilla.org/en-US/docs/Web/Events

### Passing a function as a parameter

```js
function add(num1, num2) {
  console.log(num1 + num2);
}
window.setTimeout(add, 5000, 2, 4); // func, time, para1, para2
```

### Listening for events with addEventListener()

```js
Element.addEventListener('click', () => {});
```

### Event Bubbling and Delegation

For example, if we set a click handler on the body, our callback will trigger **whenever any of its children are clicked**.

### The Event Object & Event Delegation

`event` = The event that occurs.

`event.target` = The object where event occurs.

[MDN page for the Event Object](https://developer.mozilla.org/en-US/docs/Web/API/Event)

[MDN page for the tagName property](https://developer.mozilla.org/en-US/docs/Web/API/Element/tagName)

```js
let section = document.getElementsByTagName('section')[0];

section.addEventListener('click', (e) => {
  if (e.target.tagName == "INPUT")
  e.target.style.backgroundColor = 'rgb(255, 255, 0)';
});
```

# Traversing the DOM

- `parentNode`: [MDN page for parentNode](https://developer.mozilla.org/en-US/docs/Web/API/Node/parentNode)
- `previousSibling`: [MDN page for previousSibling](https://developer.mozilla.org/en-US/docs/Web/API/Node/previousSibling)

- `previousElementSibling` : [MDN page for previousElementSibling](https://developer.mozilla.org/en-US/docs/Web/API/NonDocumentTypeChildNode/previousElementSibling)
- `insertBefore` : [MDN page for insertBefore](https://developer.mozilla.org/en-US/docs/Web/API/Node/insertBefore)
- `children` : [MDN page for children](https://developer.mozilla.org/en-US/docs/Web/API/ParentNode/children), return only HTML elements
- lastElementChild

Difference between `previousSibling` and `previousElementSibling`:

> `previousElementSibling` returns the previous sibling node as an element node (ignores text and comment nodes), but `previousSibling` not

How many nodes are needed to perform the `insertBefore` method?

> You need the parent, the sibling and the reference to the node you want to insert.

Code:

```html
<!-- HTML code -->
<ul>
  <li>
  	<button class="up">Up</button>
  	<button class="remove">Remove</button>
  </li>
	...
</ul>
```

```js
// JS code
listUl.addEventListener('click', (event) => { 
	if (event.target.tagName == 'BUTTON') {
    if (event.target.className == 'remove'){
      let li = event.target.parentNode;
      let ul = li.parentNode;
      ul.removeChild(li);
    }
    if (event.target.className == 'up'){
      let li = event.target.parentNode;
      let prevLi = li.previousElementSibling;
      let ul = li.parentNode;
      if (prevLi) {
        ul.insertBefore(li, prevLi);
    	}
  	}
  }
});
```

