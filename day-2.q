
input:read0 `$":input/day-2.data";

.d2.p1:{
    parsed:("I"$"-" vs; first; ::) @'/:" " vs/:input;
    
    charCounts:count@/:/:group each parsed@\:2;
    :count where (charCounts @' parsed@\:1) within' parsed@\:0;
 };

.d2.p2:{
    parsed:(-1 + "I"$"-" vs; first; ::) @'/:" " vs/:input;

    charMatches:(parsed@\:1) =' (@).' parsed@\:2 0;
    :count where 1 = count each where each charMatches;
 };
