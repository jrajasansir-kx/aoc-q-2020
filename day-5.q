
input:read0 `$":input/day-5.data";


.d5.map:"FLBR"!(first; first; last; last);

.d5.bsp:{[x;y] .d5.map[y] div[count x; 2] cut x };

.d5.p1:{
    sRows:first each (.d5.bsp/)[til 128;] @/: 7#/:input;
    sCols:first each (.d5.bsp/)[til 8;] @/: -3#/:input;

    :max sCols +' sRows * 8;
 };

.d5.p2:{
    sRows:first each (.d5.bsp/)[til 128;] @/: 7#/:input;
    sCols:first each (.d5.bsp/)[til 8;] @/: -3#/:input;

    sids:asc sCols +' sRows * 8;

    / Match is the seat after ours 
    :-1 + sids last where not 1 = deltas sids;
 };
