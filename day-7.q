
input:read0 `$":input/day-7.data";

.d7.p1:{
    keyvals:" bags contain " vs/:-1_/:input;

    bagKeys:`$ssr[;" ";"_"] @/:first each keyvals;
    bagNums:"I"$first@/:/:" " vs/:/:", " vs/: last each keyvals;
    bagContains:`$"_" sv/:/: -1_/:/:1_/:/:" " vs/:/:", " vs/: last each keyvals;

    ignoreKeys:bagKeys where null first each bagNums;

    containsDict:ignoreKeys _ bagKeys!bagContains;

    :count where `shiny_gold in/: ({ x union' distinct each raze each containsDict @ x }/) containsDict;
 };

.d7.p2:{
    keyvals:" bags contain " vs/:-1_/:input;

    bagKeys:`$ssr[;" ";"_"] @/:first each keyvals;
    bagNums:0i^"I"$first@/:/:" " vs/:/:", " vs/: last each keyvals;
    bagContains:`$"_" sv/:/: -1_/:/:1_/:/:" " vs/:/:", " vs/: last each keyvals;

    numsDict:bagKeys!bagNums;
    containsDict:bagKeys!bagContains;

    :.d7.iterate[containsDict; numsDict; `shiny_gold];
 };

.d7.iterate:{[containsDict; numsDict; bag]
    if[null bag;
        :0i;
    ];

    :sum numsDict[bag],numsDict[bag] * .z.s[containsDict; numsDict;] each containsDict bag;
 };
