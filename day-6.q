
input:read0 `$":input/day-6.data";

.d6.p1:{
    :sum count each distinct each raze each (0,where "" ~/:input) cut input;
 };

.d6.p2:{
    split:(0,where "" ~/:input) cut input;
    split:@[split; where "" ~/: first each split; 1_];

    :sum count each (inter/) @/: split;
 };
