
input:"I"$read0 `$":input/day-1.data";

.d1.p1:{
    crossed:input cross input;
    :(*). first crossed where 2020 = sum each crossed;
 };

.d1.p2:{
    crossed:(cross/) 3#enlist input;
    :prd first crossed where 2020 = sum each crossed;
 };
