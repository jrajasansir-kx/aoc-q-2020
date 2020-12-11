
input:read0 `$":input/day-11.data";

.d11.p1:{
    planSeats:where each "L" = input;
    sCoords:raze ((count each planSeats)#'til count planSeats),''planSeats;

    finalPlan:(.d11.updatePlan[sCoords;]/) input;
    :sum count each where each "#" = finalPlan;
 };

.d11.updatePlan:{[seats; plan]
    adjCoords:(-1 0 1 cross -1 0 1) except enlist 0 0;
    existingOccu:count each where each "#" = plan ./:/: seats +/:\: adjCoords;

    occu:seats where 0 = existingOccu;
    free:seats where 4 <= existingOccu;

    newPlan:(.[;;:;"#"]/)[plan; occu];
    newPlan:(.[;;:;"L"]/)[newPlan; free];

    :newPlan;
 };


.d11.p2:{
    planSeats:where each "L" = input;
    sCoords:raze ((count each planSeats)#'til count planSeats),''planSeats;

    finalPlan:(.d11.updatePlanP2[sCoords;]/) input;
    :sum count each where each "#" = finalPlan;
 };

.d11.updatePlanP2:{[seats; plan]
    existingOccu:count each where each "#" = .d11.findNearestSeats[plan;] each seats;

    occu:seats where 0 = existingOccu;
    free:seats where 5 <= existingOccu;

    newPlan:(.[;;:;"#"]/)[plan; occu];
    newPlan:(.[;;:;"L"]/)[newPlan; free];

    :newPlan;
 };

/ Horrendous
.d11.findNearestSeats:{[plan; coord]
    maxCoord:count[plan],count first plan;

    up:plan ./: 1_ (.d11.genDirection[maxCoord; -1 0;]\) coord;
    down:plan ./: 1_ (.d11.genDirection[maxCoord; 1 0;]\) coord;
    left:plan ./: 1_ (.d11.genDirection[maxCoord; 0 -1;]\) coord;
    right:plan ./: 1_ (.d11.genDirection[maxCoord; 0 1;]\) coord;
    diagUpLeft:plan ./: 1_ (.d11.genDirection[maxCoord; -1 -1;]\) coord;
    diagUpRight:plan ./: 1_ (.d11.genDirection[maxCoord; -1 1;]\) coord;
    diagDownLeft:plan ./: 1_ (.d11.genDirection[maxCoord; 1 -1;]\) coord;
    diagDownRight:plan ./: 1_ (.d11.genDirection[maxCoord; 1 1;]\) coord;

    :{ first x where x in "L#" } each (up;down;left;right;diagUpLeft;diagUpRight;diagDownLeft;diagDownRight);
 };

.d11.genDirection:{[stopAt; dir; initial]
    :stopAt & -1 | initial + dir;
 };

