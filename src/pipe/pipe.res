type personType = {name: string, age: int}
let parseData = data => {
  {
    name: data.name,
    age: data.age,
  }
}
let getAge = (person: personType) => person.age
let validateAge = (age: int) => {
  if age >= 18 {
    "over 18 years old"
  } else {
    "under 18 years old"
  }
}

let john: personType = {name: "John", age: 20}
let daniel: personType = {name: "Daniel", age: 17}
let people = [john, daniel]

/**
 * This function is similar to following code in JavaScript
 * validateAge(getAge(parseData(person)))
 */
let validateAgeThenPrint = (person: personType) => {
  Js.log(`${person.name} is ${person->parseData->getAge->validateAge}`)
}

Belt.Array.forEach(people, validateAgeThenPrint)

// Another example of pipe
let wrappedFilter = list => List.filter(el => el > 2, list)
let myList = List.flatten(list{list{1, 2}, list{3, 5}})->wrappedFilter->List.rev

//
//-------- PIPE PLACEHOLDER -----------
//
let add = (x, y) => x + y

// Leave a placeholder in the 2nd argument
// This will be filled in in later function
let addThree = add(3, _)

Js.log(addThree(2))

// Use the placeholder to tell Rescript to fill the list in the 2nd argument
let anotherList = List.flatten(list{list{1, 2}, list{3, 5}})->List.filter(el => el > 2, _)->List.rev