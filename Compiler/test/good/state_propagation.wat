(module
 (import "env" "readInt" (func $readInt (result i32)))
 (import "env" "readDouble" (func $readDouble (result f64)))
 (import "env" "printInt" (func $printInt (param i32)))
 (import "env" "printDouble" (func $printDouble (param f64)))
 (func $id (param $ix$0 i32) (result i32))
 (func $main (result i32) (local $iz$0 i32))
 (export "main" (func $main))
)