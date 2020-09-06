#### Package Managers

- npm
- yarn

#### Module Bundlers

Module bundlers combine all of your source code (and all of its dependencies) into a single, [minified](https://en.wikipedia.org/wiki/Minification_(programming)) JavaScript file before it's served to the browser. Module bundlers commonly used today in JavaScript development are [Webpack](https://webpack.js.org/), [Rollup](https://rollupjs.org/guide/en) and [Browserify](http://browserify.org/). [Parcel](https://parceljs.org/) is also a new open source JavaScript module bundler that recently launched.

#### Compilers

Javascript runtime environments (like the browser) only understand standard JavaScript. Modern, complex JavaScript applications often require more than pure JavaScript.

 [TypeScript](https://www.typescriptlang.org/) and [CoffeeScript](http://coffeescript.org/) are different "flavors" of JavaScript that do not run natively in the browser. If you try their code in the browser, you'll get all sorts of errors. Since these languages cannot be understood and ran by browsers, you need to transform them to standard JavaScript using a [compiler](https://en.wikipedia.org/wiki/Compiler).

A compiler is a tool that translates source code written using a special type of syntax into code that can work in the browser. Typescript, for instance, has a built-in compiler that converts a TypeScript file to plain JavaScript.

 [Babel](https://babeljs.io/) is the most popular JavaScript compiler used by developers.

#### Task Runners

Anything you might do manually over and over again could be automated and handed off to a task runner. For example:

- Minifying your JavaScript so it can be loaded quickly and efficiently into the browser
- Running tests on your code
- Starting up a development server on your computer to run your app
- Automatically reloading the browser for you whenever a JavaScript file is saved
- Compiling source code from one type of syntax to another

[Gulp](https://gulpjs.com/) is a common task runner, and [npm](https://www.npmjs.com/) (the node package manager) can also run automated tasks and is now the preferred task runner of many developers.

