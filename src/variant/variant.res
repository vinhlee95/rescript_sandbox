// In following example, Yes, No and Unsure are "variant constructors or tags.
// Note: a variant's constructors need to be capitalized.
type response = Yes | No | Unsure
let myResponse = Unsure

//
//------- CONSTRUCTOR ARGUMENTS -----------
//
type getUserData = {id: string, name: string}

// Inline records
type getUserResponse =
  | Success({status: int, data: getUserData})
  | Error({status: int, error: string})

// Rescript automatically infers getUserResponse as the type of following 2 variables
let successGetUserResponse = Success({status: 200, data: {id: "10", name: "Foo"}})
let failedGetUserResponse = Error({status: 404, error: "Not found"})

//
// ---------- PATTERN MATCHING ----------
//

let handleGetUserResponse = data =>
  switch data {
  | Success({data}) => Js.log(`User name is ${data.name}`)
  | Error({status, error}) =>
    Js.log(`Failed to get user. Status code: ${Belt.Int.toString(status)}. Error: ${error}`)
  }

handleGetUserResponse(successGetUserResponse)
handleGetUserResponse(failedGetUserResponse)