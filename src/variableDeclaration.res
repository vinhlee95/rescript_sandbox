let greeting = "hello"
Js.log(greeting)

// Block scope
let message = {
    let foo = "foo"
    let bar = "bar"
    
    Js.log(foo ++ " " ++ bar)
}

/* block-scope variables foo and bar are not accessible here */
// Js.log(foo) // The value of foo can't be found