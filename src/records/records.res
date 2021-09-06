/**
 * Immutable person record type
 */
type person = {
  name: string,
  age: int,
  // Explicitly tell the compiler that "job" field is mutable
  mutable job: string,
}

let john: person = {name: "john", age: 12, job: "student"}
Js.log(`His name is ${john.name}. He is a ${john.job}`)

// Immutability
let updatedJohn = {...john, age: john.age + 1}

// Update mutable field
john.job = "teacher"
Js.log(`John's new job is ${john.job}`)
//john.age = 13 // failed

type monster = {age: int, hasTentacles: bool}
type human = {age: int, name: string}

// Rescript automatically infer entity type as human
// as human is the closest record type having "age" field
let getAge = entity => entity.age