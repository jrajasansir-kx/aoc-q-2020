
input:read0 `$":input/day-18.data";


.d18.p1:{
    tracking:`level`stack!(0; 0N 0i!(::; 0+));

    res:(.d18.process/)[tracking;] each " " vs/: input;
    :sum res .\: `stack,0i;
 };


.d18.process:{[track; elem]
    open:where "(" = elem;
    close:where ")" = elem;

    if[0 < count open;
        newLvls:track[`level] + 1 + til count open;
        track:(.[;;:;]/)[track; `stack,/:newLvls; count[newLvls]#(::)];

        track[`level]+:count newLvls;
    ];

    elemVal:get elem except "()";

    level:track`level;

    if[elemVal in (+;*);
        op:elemVal[track[`stack] level;];
        track:.[track; `stack,level; :; op];
    ];

    if[-7h = type elemVal;
        existing:track[`stack] level;

        if[(::) ~ existing;
            track:.[track; `stack,level; :; elemVal];
        ];

        if[not (::) ~ existing;
            calc:track[`stack][level] @ elemVal;
            track:.[track; `stack,level; :; calc];
        ];
    ];

    if[0 < count close;
        if[1 = count close;
            closeLvls:enlist track`level;
            pop:track[`stack] track[`level];
        ];
        
        if[1 < count close;
            closeLvls:track[`level] - til count close; 
            pop:(.) track[`stack] reverse closeLvls;
        ];

        track[`level]-:count close;
        
        calc:track[`stack][track`level] @ pop;
        track:.[track; `stack,track`level; :; calc];

        track[`stack]:closeLvls _ track`stack;
    ];

    :track;
 };
