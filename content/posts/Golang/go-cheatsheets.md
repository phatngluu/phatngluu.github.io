+++
categories = ["golang"]
date = 2020-09-21T04:22:52Z
layout = ""
tags = ["golang"]
title = "Go Cheatsheets"

+++
# Variables

* Variable declaration:

      var foo int
      var foo int = 42
      foo := 23

  **Note**: `foo := 23` is short-form declaration, which can be valid in block scope.
* Can't redeclare variables, but can **shadow** them:

      package main
      ...
      var foo int = 1
      
      func main() {
      	var foo int = 2
          fmt.Println(foo)
      }
      # Output: 2
* All variables must be used, if not then the compiler will throw an error.
* Visibility:

      package main
      ...
      var myVar int # package scope
      var MyVar int # export globally
      func main(){
      	var myvar int # block scope
      }

Type conversion:

    var i int = 3
    var f float32 = float32(i) # convert int to float32
    var s string = strconv.Itoa(i) # convert int to string

## Primitives

See details: [https://golang.org/pkg/builtin/](https://golang.org/pkg/builtin/ "https://golang.org/pkg/builtin/")

### Integer

* `int int8 int16 int32 int64`
* `uint uint8 uint16 uint32 uint64 uintptr`
* Can't mix types (`uint16 + uint32` is invalid)
* `byte` is alias for `uint8`.  `rune` is alias for `int32` , represents a Unicode.
* `int, uint, uintptr`: 32 bits wide on 32-bit systems and 64 bits wide on 64-bit systems.

### Decimal

    float32: [-3.4E38, -1.18E-38] U [1.18E-38, 3.4E38]
    float64: [-1.8E308, -2.23E-308] U [2.23E-308, 1.8E308]
    n := 3.14
    n = 13.7e72
    n = 2.1E-14

### Complex

    var n complex64 = 1 + 2i
    // var n complex64 = complex(1,2)
    real(n) // return real part (float32)
    imag(n) // return imagine part (float32)
    // float64 for complex128

### String

* Cannot reassign an element of a string

      s := "This is a string"
      s[2] = "u"
* Concatenate:

      var s string = "This is "
      s = s + "a string"
* Byte slices

      s := "This is a string"
      b = []byte(s)

# Constants

    const a int = 8
    var b int = 8
    a + b // success
    var c int8 = 9
    a + c // mismatched types error
    const d = 42 // inferred type: int
    d + c // d will be replaced by 42 as below
    42 + c // inferred type int8

## Iota

* iota is a counter, it increases whenever we specify a new enumeric constant:

      const (
      	a = iota // 0
      	b = iota // 1
      	c = iota // 2
      )
* iota is inferred:

      const (
      	a = iota // 0
      	b		 // 1
      	c		 // 2
      )
* iota resets in a new const block:

      const (
      	a = iota // 0
      	b		 // 1
      )
      const (
      	c = iota // 0
      )
* Formular with iota is also inferred:

      const (
      	a = iota + 5 // 0 + 5
      	b		 // 1 + 5
      	c		 // 2 + 5
      )
* Ignore values of iota:

      const (
      	_ = iota	// 0
      	a			// 1
      	_			// 2
      	c			// 3
      )

# Pointers

* Like C pointer
* Zero value is `nil`
* No pointer arithmetic

# Structs

A `struct` is a collection of fields.

    type Vertex struct {
    	X int
    	Y int
    }
    v := Vertex{1, 2}
    v.X = 4
    fmt.Println(v.X)

Pointer to struct:

    	v := Vertex{1, 2}
    	p := &v
    	(*p).X or "cleaner": p.X

Struct literals:

    v1 = Vertex{1, 2}  // {1 2}  
    v2 = Vertex{X: 1}  // {1 0}
    v3 = Vertex{}      // {0 0}
    p  = &Vertex{1, 2} // &{1 2}

# Arrays, Slices & Maps

## Arrays

* Not resizable.
* Declarations - must specify **number** (or `...`) inside `[]`

      var a [3]int = [3]int{1, 2, 3}
      a := [3]int{1, 2, 3}
      a := [...]int{1, 2, 3}
* Copy an array:
  * New array is created (no pointer used):

        a := [...]int{1,2,3}
        b := a // create new from a and assign to b
  * Using pointer, no new array is created:

        a := [...]int{1,2,3}
        b := &a // a,b points to the same array

## Slices

* Resizable
* Declarations - no number inside `[]`

      grades := []int{1,2,3}
* Sub-array:

      var a [10]int
      a[1:4] // index 1,2,3
      a[0:10] == a[:10] == a[0:] == a[:]
* Facts about slices:

  > _A slice does not store any data, it just describes a section of an underlying array. Changing the elements of a slice modifies the corresponding elements of its underlying array. Other slices that share the same underlying array will see those changes._
* `len()` and `cap()`
  * The length of a slice is the number of elements it contains.
  * The capacity of a slice is the number of elements in the underlying array, counting from the first element in the slice.

        s := []int{2, 3, 5, 7, 11, 13} // len: 6, cap: 6
        s = s[:4] // len: 4, cap: 6
* `make()` : allocates a zeroed array and returns a slice that refers to that array.

      a := make([]int, 5)  // len(a)=5
      b := make([]int, 0, 5) // len(b)=0, cap(b)=5
* `append()` : The first parameter `s` of `append` is a slice of type `T`, and the rest are `T` values to append to the slice.

### `Range` - Looping thru arrays and slices

    var pow = []int{1, 2, 4, 8, 16, 32, 64, 128}
    for i, v := range pow {...}
    for i, _ := range pow {...}
    for i := range pow {...}
    for _, v := range pow {...}

## Maps

* Basic usage:

      type Vertex struct {
      	Lat, Long float64
      }
      var m map[string]Vertex = make(map[string]Vertex)
      m["Bell Labs"] = Vertex{40.68433, -74.39967}
* Map literals:

      var m = map[string]Vertex{
      	"Bell Labs": Vertex{
      		40.68433, -74.39967,
      	},
      	"Google": Vertex{
      		37.42202, -122.08408,
      	},
      }
      // Shorter
      var m = map[string]Vertex{
      	"Bell Labs": {40.68433, -74.39967},
      	"Google":    {37.42202, -122.08408},
      }
* Mutaing maps:

      // Insert or update
      m[key] = elem
      // Retrieve an element
      elem = m[key]
      // Delete an element
      delete(m, key)
      // Contain key?
      elem, ok := m[key]

  **Note:** If `key` is in `m`, `ok` is `true`. If not, `ok` is `false`. If `key` is not in the map, then `elem` is the zero value for the map's element type.

# Functions

* Functions can be passed around just like other values:
  * Function values may be used as function arguments (1) and return values (2):

    ![](/static/uploads/untitled.png)

        func main() {
        	hypot := func(x, y float64) float64 {
        		return math.Sqrt(x*x + y*y)
        	}
        	fmt.Println(compute(hypot))
        	fmt.Println(compute(math.Pow))
        }

_A closure is a function value that **references variables from outside its body.** The function may access and assign to the referenced variables => function is "bound" to the variables._ For example, the `adder` function returns a closure. Each closure is bound to its own `sum` variable.

    func adder() func(int) int {
    	sum := 0
    	return func(x int) int {
    		sum += x
    		return sum
    	}
    }
    func main() {
    	pos, neg := adder(), adder()
    	for i := 0; i < 10; i++ {
    		fmt.Println(
    			pos(i),
    			neg(-2*i),
    		)
    	}
    }

# Methods

Referenced from: [https://tour.golang.org/methods/1](https://tour.golang.org/methods/1 "https://tour.golang.org/methods/1")

* Go does not have classes.
* However, you can define methods on types.
* In this example, the `Abs` method has a receiver of type `Vertex` named `v`

      func (v Vertex) Abs() float64 {
          return math.Sqrt(v.Xv.X + v.Yv.Y)
      }
* You can declare a method on non-struct types, too.

      type MyFloat float64
      func (f MyFloat) Abs() float64 {
        if f < 0 {
          return float64(-f)
        }
        return float64(f)
      }
* **Pointer receivers:** Methods with pointer receivers can modify the value to which the receiver points (as `Scale` does here):

      func (v *Vertex) Scale(f float64) {
      	v.X = v.X * f
      	v.Y = v.Y * f
      }

  Since methods often need to modify their receiver, pointer receivers are more common than value receivers.
* Method and pointer indirection:

      var v Vertex = Vertex{3,4}
      v.Scale(5)  // OK
      p := &v
      p.Scale(10) // OK
* Chosing **value** or **pointer receiver**: There are two reasons to use a pointer receiver: method can modify the value that its receiver points to, and avoid copying the value on each method call (more efficient if the receiver is a large struct).

# Interfaces

* An **_interface type_** = a **set of method signatures**
* A **value of interface** type can hold **any value that implements those methods**.
* Interfaces are implemented **implicitly**

## Basic usage:

1. Interface:

       type Abser interface {
       	Abs() float64
       }
2. `MyFloat` and `*Vertex` (not `Vertex`) implement `Abs` of interface `Abser`:

       type MyFloat float64
       func (f MyFloat) Abs() float64 {
       	if f < 0 {
       		return float64(-f)
       	}
       	return float64(f)
       }
       type Vertex struct {
       	X float64
       	Y float64
       }
       func (v *Vertex) Abs() float64 {
       	return math.Sqrt(v.X*v.X + v.Y*v.Y)
       }

   Note: See pointer receiver in Methods.
3. Usage:

       var a1 Abser = MyFloat(-math.Sqrt2)
       var a2 Abser = &Vertex{3, 4} // 
       a1.Abs()
       a2.Abs()

   Note: `*Vertex` implements `Abs()`, interface value must be `&Vertex` 

## Interface values

An i**nterface value** holds a **value** of a specific underlying **concrete type**: `(value, type)`. 

**Calling a method on an interface value** executes the **method of the same name on its underlying type.**

    fmt.Printf("%v - %T", a2, a2)
    // Output
    &{3 4} - *main.Vertex