// Functions are only evaluated after all arguments are passed
let toInt = (lang, speed) => int_of_string("learn " ++ lang ++ speed)

let partiallyAppliedFn = toInt("ReScript")
//partiallyAppliedFn("10 day/course") // Compiler error here

// Partial evaluation
let concatListsPartial = (list1, list2) => {
  // This will be evaluated after passing first 2 list arguments
  let newList = List.append(list1, list2)
  list3 => List.append(list3, newList)
}

let partialConcat = concatListsPartial(list{"Orange"}, list{"Apple"})
//let evaluateAsWrongPartialConcat = concatListsPartial(list{"Orange"}, ["Apple"])

let finalList = partialConcat(list{"Banana"})
Js.log(finalList)