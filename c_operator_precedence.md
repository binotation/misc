| Precedence | Operator                                                      | Description                                                                                                                                                                     | Associativity |
|------------|---------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------|
| 1          | ++ --<br>()<br>[]<br>.<br>-><br>(type)[list)                  | Suffix increment/decrement<br>Function call<br>Array subscripting<br>Structure and union member access<br>Structure and union member access through pointer<br>Compound literal | Left-to-right |
| 2          | ++ --<br>+ -<br>! ~<br>(type)<br>*<br>&<br>sizeof<br>_Alignof | Prefix increment/decrement<br>Unary plus/minus<br>Logical/bitwise not<br>Cast<br>Dereference<br>Address-of<br>Size-of<br>Alignment requirement                                  | Right-to-left |
| 3          | * / %                                                         |                                                                                                                                                                                 | Left-to-right |
| 4          | + -                                                           |                                                                                                                                                                                 | Left-to-right |
| 5          | << >>                                                         |                                                                                                                                                                                 | Left-to-right |
| 6          | < <= > >=                                                     |                                                                                                                                                                                 | Left-to-right |
| 7          | == !=                                                         |                                                                                                                                                                                 | Left-to-right |
| 8          | &                                                             |                                                                                                                                                                                 | Left-to-right |
| 9          | ^                                                             |                                                                                                                                                                                 | Left-to-right |
| 10         | \|                                                            |                                                                                                                                                                                 | Left-to-right |
| 11         | &&                                                            |                                                                                                                                                                                 | Left-to-right |
| 12         | \|\|                                                          |                                                                                                                                                                                 | Left-to-right |
| 13         | ?:                                                            | Ternary conditional                                                                                                                                                             | Right-to-left |
| 14         | = += -= *= /= %=<br><<= >>= &= ^= \|=                         |                                                                                                                                                                                 | Right-to-left |
| 15         | ,                                                             |                                                                                                                                                                                 | Left-to-right |