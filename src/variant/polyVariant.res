//
//-------- TYPE DECLARATION ---------
//
type color = [#red | #green | #blue]
let render = (color: color) => {
  switch color {
  | #blue => Js.log("Blue")
  | #red => Js.log("Red")
  | #green => Js.log("Green")
  }
}

let redColor = #red
render(redColor)

//
//------ COMBINE TYPES & PATTERN MATCHING --------
//
type iPhone = [#iPhone5 | #iPhone6 | #iPhone7]

type samsungPhone = [#galaxyNote10 | #galaxyFold3]
type googlePhone = [#pixel2 | #pixel5]
type androidPhone = [samsungPhone | googlePhone]

let foosPhone: androidPhone = #pixel2

// Pattern matching to match on constructors
let printManufacturer = (phone: [iPhone | androidPhone]) =>
  switch phone {
  | #...iPhone => Js.log(`${(phone :> string)} is an iPhone`)
  | #...samsungPhone => Js.log(`${(phone :> string)} is a Samsung phone`)
  | #...googlePhone => Js.log(`${(phone :> string)} is a Google phone`)
  }

let iPhone5 = #iPhone5
printManufacturer(iPhone5)

let pixel5 = #pixel5
printManufacturer(pixel5)