//
// ------ LABEL ARGUMENTS --------
//
// The 3rd argument is unit type
// when passing the unit type in the function call, e.g. multiply(~integer1=4, ())
// we tell the compiler that we are done with passing arguments
// the compiler thus execute the function with given arguments, instead of returning a partial application

let multiply = (~integer1 as a, ~integer2 as b=?, ()) =>
  switch b {
  | None => Js.log(a)
  | Some(b) => Js.log(a * b)
  }

Js.log("Multiply results:")
multiply(~integer1=2, ~integer2=3, ())
multiply(~integer1=4, ())

let payload = Some(7)
multiply(~integer1=5, ~integer2=?payload, ())

let greet = (~name: string, ~additional=?, ()) =>
  switch additional {
  | None => Js.log(`Hello ${name}`)
  | Some(additional) => Js.log(`Hello ${name}. ${additional}`)
  }

Js.log("Greet results:")
greet(~name="Foo", ())

let sayHi = (~greet="Hello", ~name, ()) => Js.log(`${greet} ${name}`)
Js.log("Say hi results:")
sayHi(~name="Foo", ())
sayHi(~greet="Hi", ~name="Foo", ())

let partialSayHi = sayHi(~greet="Hi there")
partialSayHi(~name="Bar", ())

// Without passing optional argument (), Rescript will treat the returning value as a Partial application
let partialGreet = greet(~name="Foo")
partialGreet(~additional="Nice to meet you", ())

greet(~name="Bar", ~additional="Nice to meet you", ())

// ReScript's functions are curried by default
let add = (~base, ~addition) => {
  let result = base + addition
  Js.log(result)
}
let addOne = add(~base=1)

Js.log("Add results:")
addOne(~addition=3)