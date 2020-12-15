
input:"J"$read0 `$":input/day-15.data";

.d15.p1:{
    :last (.d15.turn/)[{not 2020=count x}; input];
 };

.d15.turn:{
    lastSpoke:1 + where last[x] = x;

    $[1 = count lastSpoke;
        x,:0;
    / else
        x,:(-). desc -2#lastSpoke
    ];

    :x;
 };


.d15.p2:{
    dict:input!enlist each 1 + til count input;

    :first where 30000000 in/: (.d15.turnP2/)[dict; count[input] _ 1 + til 30000000];
 };

.d15.turnP2:{[d;x]
    dv:value d;

    lastSeen:dv first where (x - 1) = dv@\:1;

    toUp:(-). reverse 0^-2#lastSeen;

    d[toUp]:-2#d[toUp],x;

    if[0 = x mod 100000;
        -1 string x;
    ];

    :d;
 };
