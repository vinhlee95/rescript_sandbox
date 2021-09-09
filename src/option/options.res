let getResult = () => Js_math.random() > 0.5 ? Some("result") : None
let result = getResult()

switch result {
| None => Js.log("Cannot get result")
| Some(_) => Js.log(`Has result`)
}