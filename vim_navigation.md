Cursor movement									|Editing												|Global
:---											|:---													|:---
h - move left									|r - replace a character								|:h keyword
j - move down									|R - replace more than one character until ESC			|:sav file
k - move up										|J - join line below to current line with space between	|:clo
l - move right									|gJ - join line below to current line					|:ter
gj - move down (wrapped line)					|gwip - reflow											|
gk - move up (wrapped line)						|g~ - switch case up to motion							|
H - top of screen								|gu - change to lowercase up to motion					|
M - middle of screen							|gU - change to uppercase up to motion					|
L - bottom of screen							|S - replace entire line								|
w - jump forwards to start of word				|C - replace to end of line								|
e - jump forwards to end of word				|ciw - replace entire word								|
b - jump backwrads to start of word				|cw - replace to end of word							|
ge - jump backwards to end of word				|s - delete character and substitute text				|
% - move to matching character () {} []			|xp - transpose two letters (cut and paste)				|
0 - jump to start of line						|u - undo												|
^ - jump to first non-blank in line				|U - undo last changed line								|
$ - jump to end of line							|Ctrl + r - redo										|
g_ - jump to last non blank of line				|. - repeat last command								|
3H - go to line 3								|i - insert before cursor								|
fx - jump to next occurence of x				|a - insert after cursor								|
tx - jump to before next occurence of x			|I - insert start of line								|
Fx - jump to previous occurence of x			|A - insert end of line									|
Tx - jump to before previous occurence of x		|o - new line before current line						|
; - repeat previous f,t,F,T movement			|O - new line after current line						|
, - repeat previous f,t,F,T movement backwards	|														|
} - jump to next function/block					|														|
{ - jump to previous function/block				|														|
Ctrl + e - move screen down						|														|
Ctrl + y - move screen up						|														|
Ctrl + b - move back one screen					|														|
Ctrl + f - move forward one screen				|														|
Ctrl + d - move forward 1/2 screen				|														|
Ctrl + u - move back 1/2 screen					|														|

Marking text (visual mode)					|Cut and paste									|Search and replace
:---										|:---											|:---
v - start visual mode						|yy - yank a line								|/pattern - search for pattern
V - start linewise visual mode				|yw - copy from cursor to start next word		|?pattern - search backward for pattern
o - move to other end of marked area		|yiw - copy word under cursor					|:\%s/old/new/g - replace all
Ctrl + v - start visual block mode			|Y - copy to end of line						|:\%s/old/new/gc - replace with confirmation
O - move to other corner of block			|p - paste after cursor							|
aw - mark a word							|P - paste before cursor						|
ab - a block with ()						|dw - delete word to the start of next word		|
aB - a block with {}						|diw - delete word								|
at - a block with <> tags					|daw - delete word with whitespaces				|
ib - inner block with ()					|D - delete to end of line						|
iB - inner block with {}					|x - cut character								|
it - inner block with <> tags				|>> - indent									|
\> - shift text right						|<< - de-indent									|
< - shift text left							|												|
y - yank									|												|
d - delete									|												|
~ - switch case								|												|
u - lowercase								|												|
U - uppercase								|												|
