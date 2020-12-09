
input:read0 `$":input/day-9.data";


.d9.p1:{
    pInput:"J"$input;

    :first (25_ pInput) where not .d9.validate[pInput; 25;] each 25_ til count pInput;
 };

.d9.validate:{[data; paSize; index]
    :any data[index] = sum each (cross). 2# enlist data neg[paSize]#til index;
 };


.d9.p2:{
    pInput:"J"$input;

    target:22477624;
    
    combinations:(til[1 + count pInput]#\:pInput),til[1 + count pInput]_\:pInput;
    matches:target = sums each combinations;

    validCombs:combinations[where any each matches] @' til each 1 + first each where each matches where any each matches;
    validCombs@:where 1 < count each validCombs;

    :sum (min; max)@\:first validCombs;
 };
