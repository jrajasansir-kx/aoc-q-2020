
input:read0 `$":input/day-12.data";

.d12.p1:{
    track:`coord`dir!(0 0; 90);

    dirs:()!();
    dirs[`N]:@[;1;+;];
    dirs[`S]:@[;1;-;];
    dirs[`E]:@[;0;+;];
    dirs[`W]:@[;0;-;];

    dirMap:0 90 180 270!`N`E`S`W;

    parsed:"SI"$'/:(1#; 1_)@\:/:input;

    finalPos:(.d12.move[dirs;dirMap;;]/)[track; parsed];

    :sum abs finalPos`coord;
 };

.d12.move:{[dirs; dirMap; track; move]
    action:dirs move 0;

    $[move[0] in `R`L;
        track[`dir]:mod[;360] ((-;+) `R = move 0)[track`dir; move 1];
    `F = move 0;
        track[`coord]:dirs[dirMap track`dir][track`coord; move 1];
    / else
        track[`coord]:action[track`coord; move 1]
    ];

    :track;
 };


.d12.p2:{
    track:`coord`waypCoord!(0 0; 10 1);

    dirs:()!();
    dirs[`N]:@[;1;+;];
    dirs[`S]:@[;1;-;];
    dirs[`E]:@[;0;+;];
    dirs[`W]:@[;0;-;];

    / Parse as longs for 'over' iterate argument (bug?)
    parsed:"SJ"$'/:(1#; 1_)@\:/:input;

    finalPos:(.d12.moveP2[dirs;;]/)[track; parsed];

    :sum abs finalPos`coord;
 };

.d12.moveP2:{[dirs; track; move]
    action:dirs first move;

    if[move[0] in `R`L;
        wpPosRotate:((::;360-) `L = move 0) move 1;
        track[`waypCoord]:(.d2.waypointMove/)[wpPosRotate div 90; track`waypCoord];

        :track;
    ];

    $[`F = move 0;
        track[`coord]:track[`coord] + last[move] * track`waypCoord;
    / else
        track[`waypCoord]:action[track`waypCoord; last move]
    ];

    :track;
 };

/ Positive 90 degree move only
.d2.waypointMove:{
    :reverse (neg; ::) @' x;
 };

/ q)(`E`N;`E`S;`W`S;`W`N)!(10 1; 1 -10; -10 -1; -1 10)
/ E N| 10  1
/ E S| 1   -10
/ W S| -10 -1
/ W N| -1  10
