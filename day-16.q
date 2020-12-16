
input:read0 `$":input/day-16.data";

.d16.p1:{
    data:`rules`ticket`nearby!(0,1 + where "" ~/: input) cut input;

    rules:-1_ "I"$"-" vs/:/:" or " vs/: last each ": " vs/: data`rules;
    rules:raze each { x[0] + til 1 + (-). x 1 0 } @/:/: rules;

    nearby:"I"$"," vs/:1_ data`nearby;


    :sum raze nearby @' where each not any@/:/:flip each nearby in/:\: rules;
 };

.d16.p2:{
    data:`rules`ticket`nearby!(0,1 + where "" ~/: input) cut input;

    ruleNames:`$ssr[;" "; "_"] each -1_ first each ": " vs/: data`rules;

    rules:-1_ "I"$"-" vs/:/:" or " vs/: last each ": " vs/: data`rules;
    rules:raze each { x[0] + til 1 + (-). x 1 0 } @/:/: rules;

    nearby:"I"$"," vs/:1_ data`nearby;


    validNearby:nearby where all each any@/:/:flip each nearby in/:\: rules;
    validPos:where each all each ruleNames!flip validNearby in/:\: rules;

    fields:@[;`answer] (.d16.getFields/)[`track`answer!(validPos; ()!()); til count validPos];
 
    ticketVals:@[;fields] "J"$"," vs data[`ticket] 1;

    :prd ticketVals key[ticketVals] where key[ticketVals] like "departure*";
 };

.d16.getFields:{[x; y]
    matchKeys:where 1 = count each x`track;

    updTrack:matchKeys _ x[`track] except\:first each x[`track] matchKeys;
    updAnswr:x[`answer],matchKeys!first each x[`track] matchKeys;

    :`track`answer!(updTrack; updAnswr);
 };

