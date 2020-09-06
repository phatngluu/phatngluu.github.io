### Async & Await

#### Why?

Async & Await makes Promises easier to work with. Async & Await helps avoid Promise hell.

Explaination on Youtube: https://www.youtube.com/watch?v=V_Kr9OSfDeU

#### Async function declaration

1. `async function(...){...}`

2. `async (...) => {...}`

3. ```js
   class Google {
      constructor() { ... }
      async function() { ... }
   }
   ```

Với từ khóa `async` này, ta có thể đợi các `Promise` (thao tác bất đồng bộ) xử lý trong hàm đó mà không tạm dừng luồng chính bằng từ khóa `await` như ví dụ trên.

#### Async function characteristics

- `async` ensures that the function **returns a promise**, and wraps returned value (non-promises – called  `PromiseValue` ) in that promise.

#### Await characteristics

- **Pauses** the execution of an async function **and waits** for the resolution of a promise
- It then **resumes** the execution **and** **returns** the resolved value
- **Pausing** execution is **not going to cause blocking behavior**, Javascript engine can run and execute other tasks in the meantime via the event loop
- `await` is **valid only inside `async`** function.

### Example Async/Await:

```js
const astrosUrl = 'http://api.open-notify.org/astros.json';
const wikiUrl = 'https://en.wikipedia.org/api/rest_v1/page/summary/';
const peopleList = document.getElementById('people');
const btn = document.querySelector('button');

// Handle all fetch requests
async function getPeopleInSpace(url){
  const peopleResponse = await fetch(url);
  const peopleJSON = await peopleResponse.json();
  
  const profiles = peopleJSON.people.map( async (person) => {
    const craft = person.craft;
    const profileResponse = await fetch(wikiUrl + person.name);
    const profileJSON = await profileResponse.json();
  
    return {...profileJSON, craft}
  });
  
  // profiles stores array of promises
  return Promise.all(profiles);
}

// Generate the markup for each profile
function generateHTML(data) {
  data.map( person => {
    const section = document.createElement('section');
    peopleList.appendChild(section);
    section.innerHTML = `
      <img src=${person.thumbnail.source}>
      <span>${person.craft}</span>
      <h2>${person.title}</h2>
      <p>${person.description}</p>
      <p>${person.extract}</p>
    `;
  });
}

btn.addEventListener('click', async (event) => {
  event.target.textContent = "Loading...";
  
  const astros = await getPeopleInSpace(astrosUrl);
  generateHTML(astros);
  event.target.remove();
});
```

### Combine Async/Await with Promises

```js
btn.addEventListener('click', async (event) => {
  event.target.textContent = "Loading...";
  
  getPeopleInSpace(astrosUrl)
    .then(generateHTML)
    .finally( () => event.target.remove() );
});
```

### Error Handling with try...catch

**Using `try...catch` and async/await in the event listener:**

```js
btn.addEventListener('click', async (event) => {
  event.target.textContent = 'Loading...';
  try {
    const astros = await getPeopleInSpace(astrosUrl);
    generateHTML(astros);
  } catch(e) {
    astrosList.innerHTML = '<h3>Something went wrong!</h3>';
    console.error(e);    
  } finally {
    event.target.remove();
  }
});
```

### Load all the requested data before displaying anything

```js
function fetchData(url) {
  return fetch(url)
            .then(checkStatus)
            .then(res => res.json())
            .catch(err => console.log(err))
}

Promise.all([
  fetchData('https://dog.ceo/api/breeds/list'),
  fetchData('https://dog.ceo/api/breeds/image/random')  
])
.then(data => {
  const breedList = data[0].message;
  const randomImg = data[1].message;
  generateOptions(breedList);
  generateImage(randomImg);
})
```

### POST `fetch()`

`postData` which takes the parameter `e` for the event. Inside the function, cancel the browser's default submit behavior which `e.preventDefault()`. 

```js
function postData(e) {
  e.preventDefault();
  const name = document.getElementById('name').value;
  const comment = document.getElementById('comment').value;
  
  fetch('https://jsonplaceholder.typicode.com/comments', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({name: name, comment: comment})
  })
    .then(checkStatus)
    .then(res => res.json())
    .then(data => console.log(data))
}
```

