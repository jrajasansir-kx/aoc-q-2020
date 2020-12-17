
input:read0 `$":input/day-17.data";

.d17.p1:{
    neighbours:1_ (cross/) 3#enlist 0 1 -1;

    data:enlist[0]!enlist input;

    :sum count each where each "#" =/: raze each (.d17.cycle[neighbours;;]/)[data; til 6];
 };

.d17.cycle:{[neighbours; data; x]
    newXys:".",/:/:data,\:\:".";
    blankRow:enlist count[newXys[0]0]#".";

    newXys:blankRow,/:newXys,\:blankRow;

    newZs:(-1; 1) + (min; max)@\:key data;
    newZData:count[newXys 0]#blankRow;

    newData:newXys,newZs!2#enlist newZData;


    coords:(cross/) enlist[key newData],til each count[first newData],count first first newData;
    neighActive:count each where each "#" =/: newData ./:/: coords +/:\: neighbours;

    updated:.d17.update each (newData ./: coords),'neighActive;

    :(.[;;:;]/)[newData; coords; updated];
 };

.d17.update:{
    if["#" = x 0;
        :".#" x[1] in 2 3;
    ];

    if["." = x 0;
        :".#" 3 = x 1;
    ];
 };


.d17.p2:{
    neighbours:1_ (cross/) 4#enlist 0 1 -1;

    data:enlist[0]!enlist enlist[0]!enlist input;

    :sum { sum count each where each "#" =/: raze each x } each (.d17.cycleP2[neighbours;;]/)[data; til 6];
 };

.d17.cycleP2:{[neighbours; data; x]
    newXys:".",/:/:/:data,\:\:\:".";
    blankRow:enlist count[newXys[0][0]0]#".";

    newXys:blankRow,/:/:newXys,\:\:blankRow;

    newZs:(-1; 1) + (min; max)@\:key first data;
    newZData:count[newXys[0] 0]#blankRow;
    newZData:newXys,\:newZs!2#enlist newZData;

    newWs:(-1; 1) + (min; max)@\:key data;
    newWData:key[newZData 0]!count[key newZData 0]#enlist count[newZData . 0 0]#enlist count[newZData . 0 0 0]#".";

    newData:newZData,newWs!2#enlist newWData;


    coords:(cross/) enlist[key newData],enlist[key newData 0],til each count[newData . 0 0],count newData . 0 0 0;
    neighActive:count each where each "#" =/: newData ./:/: coords +/:\: neighbours;

    updated:.d17.update each (newData ./: coords),'neighActive;

    :(.[;;:;]/)[newData; coords; updated];
 };
