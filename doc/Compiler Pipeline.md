# Jrlscript Transpiler Pipeline

## Coregen
### Essentially our lexer, syntax and semantic analyser and intermediate code generator + optimiser
Coregen is an Erlang module which can compile normal Erlang source code files into both CoreErlang and a CoreErlang AST. This can be simply done via:

1) Compiling the `coregen.erl` file in Erlang (i.e via `c("coregen").` in the Erlang Shell)
2) Running either the `coregen:er2ce(...)` function or the `coregen:er2ast(...)` function, both of which take a module name as per the BIF `c(...)`, i.e
   ```erlang
   coregen:er2ce("somemodule").
   ```
   or
   ```erlang
   coregen:er2ast("somemodule").
   ```
   Which will generate the files `somemodule.core` and `somemodule.ast` respectively. The default output directory is the directory containing the source files awaiting compilation.
 
3) Both `coregen:er2ce(...)` and `coregen:er2ast(...)` take a filepath as a second argument to specify output directory. Both `coregen:er2ce/2` and `coregen:er2ast/2` will create the specified directory if it doesn't already exist. Do note that any files in the directory will be overwritten if they already exist.

## ASTtrans
### Intermediate code translator
ASTtrans will be a AST manipulator, taking the CoreErlang AST as input and translating it to a valid and equivalent `ESTree AST`. Documentation for the `ESTree AST` can be found at the [estree GitHub repo](https://github.com/estree/estree). To do this we will likely need to manually implement all of the interfaces defined in that spec.

## esAST
### Target language specification
jAST will be a simple Erlang Module which implements all of the interfaces defined in the [estree GitHub repo](https://github.com/estree/estree), which `ASTtrans` will hook into and call to generate valid `ESTree Nodes`. The interface is fairly basic and upon first impressions, it shoudn't be remarkably difficult to map a CoreErlang AST into an ESTree.

## escodegen
### Target code generator
Once that's done, we can pass our generated `ESTree AST` into a `ESTree AST` -> `ESx` generator such as [escodegen](https://github.com/estools/escodegen) to generate our JavaScript output.
