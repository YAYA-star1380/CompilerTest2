/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

grammar emil2;

start: EMAIL EOF;

EMAIL: LOCAL_SUBPART ('.' LOCAL_SUBPART)* '@' DOMAIN_SUBPART ('.' DOMAIN_SUBPART)+;

fragment LOCAL_SUBPART : [a-zA-Z0-9!$&()*+,;=:_~-]+;
fragment DOMAIN_SUBPART : [a-zA-Z0-9-]+;