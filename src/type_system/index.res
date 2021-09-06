/* Type inference */
let score = 10 // score has int type
let add = (a, b) => a + b // a and b have int type
let myArrOfString = ["foo", "bar"] // inferred as array<string>

/* Type annotation */
let myInt = 10
let myStr = "10"
let subtract = (a, b) => a - b
Js.log(subtract(myInt, 3))
// Js.log(subtract(myStr, 2)) // compilation failed

/**
 * Type alias
 */
type myIntType = int
let myNumb: myIntType = 10
// let myNumbStr: myIntType = "10" // compilation failed

/**
 * Object types
 */
type user = {"name": string, "age": int, "address": string, "job": string}

let myUser: user = {
  "name": "foo",
  "age": 12,
  "address": "Street 1",
  "job": "Teacher",
}

/**
 * Generic types
 */
type rectangle<'a> = ('a, 'a)
let firstRect: rectangle<int> = (10, 20)

type result<'a, 'b> = Ok('a) | Error('b)
type fetchUserData = {"user_id": string}
type fetchUserResult = result<fetchUserData, string>

let fetchUserResultSuccess: fetchUserResult = Ok({"user_id": "123"})
let fetchUserFail: fetchUserResult = Error("failed to fetch user data")

/**
 * Recursive type
 */
type rec person = {"name": string, "friends": array<person>}
let john: person = {"name": "John", "friends": []}
let harry: person = {"name": "Harry", "friends": [john]}

/**
 * Type escape hatch
 */
external convertToFloat: int => float = "%identity"
let age = 10
let gpa = 2.1 +. convertToFloat(age)