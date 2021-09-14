//
//------- UNNAMED FUNCTIONS -----------
//
(lang => Js.log(`I speak ${lang}`))("Spanish")

//
//-------- PATTERN MATCHING --------------
//
type user = {id: string, name: string}
type result = Left(string) | Right(user)

let handleResult = result =>
  switch result {
  | Right(user) => Js.log(`Got user: ${user.name}`)
  | Left(error) => Js.log(`Failed to get user. Error: ${error}`)
  }

handleResult(Left("404"))
handleResult(Right({id: "1", name: "Foo"}))

// It is weird that this syntax does not work 🤷🏻‍
//let handleResultFn =
//  fun
//  | Right(user) => Js.log(`Got user: ${user.name}`)
//  | Left(error) => Js.log(`Failed to get user. Error: ${error}`)

// Function as an argument
let compute = (calcFn, value) => calcFn(value)

// This add function is curried by default
let add = (step, val) => step + val
let addOne = add(1)

let val = compute(addOne, 9)
Js.log(`Value is ${Belt.Int.toString(val)}`)

//
//--------- COMPOSITION -----------
//
let compose = (func1, func2, val) => func1(func2(val))

let multiply = (step, val) => step * val
let multiplyTwo = multiply(2)

let addOneThenMultiplyTwo = compose(multiplyTwo, addOne)

Js.log(addOneThenMultiplyTwo(10) === 22)