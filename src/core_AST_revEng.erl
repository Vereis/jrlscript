-module(core_AST_revEng).
-export([boolean/0,
    integer/0,
    string/0,
    addition/1,
    subtraction/1,
    multiplication/1,
    division/1,
    remainder/1,
    intDivision/1,
    equality/2,
    notEquality/2,
    lessThan/2,
    lessThanOrEq/2,
    moreThan/2,
    moreThanOrEq/2,
    echo/1]).

boolean() -> true.
integer() -> 3.
string() ->"Hello, world!".

addition(Var) -> Var + 3.
subtraction(Var) -> Var - 3.

multiplication(Var) -> Var * 3.
division(Var) -> Var / 3.

remainder(Var) -> Var rem 3.
intDivision(Var) -> Var div 3.

equality(Var1,Var2)->Var1==Var2.
notEquality(Var1,Var2)->Var1/=Var2.
lessThan(Var1,Var2)->Var1<Var2.
lessThanOrEq(Var1,Var2)->Var1=<Var2.
moreThan(Var1,Var2)->Var1>Var2.
moreThanOrEq(Var1,Var2)->Var1>=Var2.

echo(Var)->Var.
