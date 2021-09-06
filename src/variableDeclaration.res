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

/* Bindings are immutable */
let foo = "bar"
// foo = "foo" // Syntax error

/* Private let bindings */
/* baz is only accessible in this module */
%%private(let baz = "baz")
Js.log(baz)