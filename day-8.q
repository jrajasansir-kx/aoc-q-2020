
input:read0 `$":input/day-8.data";

.d8.p1:{
    instructions:"SI"$'/:" " vs/:input;

    :last .d8.run instructions;
 };

.d8.p2:{
    instructions:"SI"$'/:" " vs/:input;

    results:.d8.runModify[;instructions] each where any each (first each instructions) =\: `nop`jmp;
    :first results where first each results;
 };


.d8.runModify:{[modPointer; origInstrs]
    iModify:origInstrs modPointer;

    $[`nop = first iModify;
        iModify:`jmp,last iModify;
    `jmp = first iModify;
        iModify:`nop,last iModify
    ];

    modifyInstrs:@[origInstrs; modPointer; :; iModify];

    :.d8.run modifyInstrs;
 };

.d8.run:{[instructions]
    acc:0;
    pointer:0;

    visited:til[count instructions]!count[instructions]#0b;

    while[1b;
        if[pointer = count instructions;
            :(1b; acc);
        ];

        current:instructions pointer;

        if[visited pointer;
            :(0b; acc);
        ];

        visited[pointer]:1b;

        if[`nop = first current;
            pointer+:1;
        ];

        if[`acc = first current;
            acc+:last current;
            pointer+:1;
        ];

        if[`jmp = first current;
            pointer+:last current;
        ];
    ];

 };
