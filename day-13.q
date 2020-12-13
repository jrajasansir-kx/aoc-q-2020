
input:read0 `$":input/day-13.data";

.d13.p1:{
    target:"J"$first input;
    buses:"J"$("," vs last input) except enlist enlist"x";

    nearest:buses - target mod buses;
    :(*). first each (buses; nearest)@\: where min[nearest] = nearest;
 };

/ Does not work
.d13.p2:{
    parsed:"J"$"," vs last input;

    offset:where not null parsed;
    buses:parsed offset;

    target:@[offset; 0; :; first buses];

    maxBus:first buses where max[buses] = buses;
    start:100000000000000 - 100000000000000 mod maxBus;
    calcOff:first offset where max[buses] = buses;

    :-[;calcOff] last ({ x[1]:(+). x; :x }/)[.d13.targetCheck[target; buses; calcOff;]; maxBus,start];
 };

/ vals[0]: The iterator
/ vals[1]: Current value
.d13.targetCheck:{[target; buses; calcOff; vals]
    :not all target = buses - (vals[1] - calcOff) mod buses
 };

