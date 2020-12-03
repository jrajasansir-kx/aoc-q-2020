
input:read0 `$":input/day-3.data";


.d3.p1:{
    / Co-ordinates are y x for list lookup
    coords:1_ { count[input] > first x } (1 3+)\ 0 0;
    coords:@[; 1; mod[;count first input]] each coords;

    :count where "#" = input ./: coords;
 };

.d3.p2:{
    moves:(1 1; 1 3; 1 5; 1 7; 2 1);
    allCoords:.d3.getCoords each moves;

    :prd count each where each "#" = input ./:/:allCoords;
 };


.d3.getCoords:{[move]
    coords:1_ { count[input] > first x } (move+)\ 0 0;
    coords:@[; 1; mod[;count first input]] each coords;

    :coords;
 };
