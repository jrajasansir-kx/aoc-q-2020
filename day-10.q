
input:read0 `$":input/day-10.data";

.d10.p1:{
    :(*). @[;1 3] count each group deltas asc raze (::; { 3 + max x })@\:"J"$input;
 };

.d10.p2:{
    ordered:asc "J"$input;
    ordered,:max[ordered] + 3;

    optional:ordered -1 + where (1 = deltas ordered) & 0 = deltas deltas ordered;
    optionalGrp:(0,where 1 < deltas optional) cut optional;

    optCombos:.d10.comboGen each optionalGrp;

    totalCombs:prd count each optCombos;

    :prd count each {[list; combo] where not any each 3 < deltas each asc each (list except distinct raze combo),/:combo }[ordered;] each optCombos;
 };


.d10.comboGen:{
    vals:distinct asc each (cross/) (2|count x)#enlist 0N,x;
    :except[;0N]@/:vals where not any each 1 </: count@/:/:enlist[0N]_/:group each vals;   
 };
