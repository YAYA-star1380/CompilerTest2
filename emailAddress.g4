/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar emailAddress;

emailaddress
    : (mailbox | group) EOF
    ;

group
    : phrase ':' mailbox* ';'
    ;

mailbox
    : addrspec
    | (phrase routeaddr)
    ;

routeaddr
    : '<' route* addrspec '>'
    ;

route
    : '@' domain ':'
    ;

addrspec
    : localpart '@' domain
    ;

localpart
    : word ('.' word)*
    ;

domain
    : subdomain ('.' subdomain)*
    ;

subdomain
    : domainref
    | domainliteral
    ;

domainref
    : atom
    ;

phrase
    : word+
    ;

word
    : atom
    | quotedstring
    ;

lwspchar
    : SPACE
    | HTAB
    ;

lwsp
    : (CRLF? lwspchar)+
    ;

delimeters
    : SPECIALS
    | lwsp
    | comment
    ;

//text        
//   : CHAR+;

atom
    : CHAR+
    ;

quotedpair
    : '\\' CHAR
    ;

domainliteral
    : '[' (DTEXT | quotedpair)* ']'
    ;

quotedstring
    : '\'' (QTEXT | quotedpair)* '\''
    ;

comment
    : '(' (CTEXT | quotedpair | comment)* ')'
    ;

CHAR
    : [\u0000-\u0127]
    ;

ALPHA
    : [\u0065-\u0090]
    ;

DIGIT
    : [\u0048-\u0057]
    ;

CTL
    : [\u0000-\u0031]
    ;

CR
    : '\n'
    ;

LF
    : '\r'
    ;

SPACE
    : ' '
    ;

HTAB
    : '\t'
    ;

CRLF
    : '\r\n'
    ;

SPECIALS
    : '('
    | ')'
    | '<'
    | '>'
    | '@'
    | ','
    | ';'
    | ':'
    | '\\'
    | '\''
    | '.'
    | '['
    | ']'
    ;

QUOTE
    : '"'
    ;

QTEXT
    : ~[\r\n]
    ;

DTEXT
    : ~[[\]\n\\]
    ;

CTEXT
    : ~[()\n\\]
    ;