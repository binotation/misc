# Expression precedence
Operator/Expression					| Associativity
:---								|:---
Paths								|
Method calls						|
Field expressions					| left to right
Function calls, array indexing		|
?									|
Unary - * ! & &mut					|
as									| left to right
\* / %								| left to right
\+ -								| left to right
<< >>								| left to right
&									| left to right
^									| left to right
\|									| left to right
== != < > <= >=						| Require parentheses
&&									| left to right
\|\|								| left to right
.. ..=								| Require parentheses
= += -= *= /= %= &= \|= ^= <<= >>=	| right to left
`return` `break` closures			|
