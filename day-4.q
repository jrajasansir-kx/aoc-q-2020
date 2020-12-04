
input:read0 `$":input/day-4.data";

.d4.p1:{
    validFields:("byr"; "iyr"; "eyr"; "hgt"; "hcl"; "ecl"; "pid");

    allKeys:first@/:/:":" vs/:/:" " vs/:input;
    allKeys:except[;(""; "cid")] @/: raze each (0,where enlist[""] ~/: allKeys) cut allKeys;

    :count where count[validFields] = count each validFields inter/: allKeys;
 };


.d4.hgt:`in`cm!(59 76; 150 193);

.d4.validation:()!();
.d4.validation[`byr]:{ within["I"$x;1920 2002] };
.d4.validation[`iyr]:{ within["I"$x;2010 2020] };
.d4.validation[`eyr]:{ within["I"$x;2020 2030] };
.d4.validation[`hgt]:{ within["I"$-2_ x; 0W^ 2#.d4.hgt `$-2#x] };
.d4.validation[`hcl]:{ all (7 = count x; "#" = first x; all (1_x) in .Q.n,6#.Q.a) };
.d4.validation[`ecl]:{ (`$x) in `amb`blu`brn`gry`grn`hzl`oth };
.d4.validation[`pid]:{ not[null "J"$x] & 9 = count x };


.d4.p2:{
    allData:":" vs/:/:" " vs/:input;
    allData:raze each (0,where enlist[""] ~/: first each allData) cut allData;
    allData:@[allData; where enlist[""] ~/: first each allData; 1_];

    dataDict:(!)./:("S*")$'/:flip each allData;
    dataDict:enlist[`cid] _/: dataDict;

    / Part 1 answer
    dataDict@:where all each key[.d4.validation] in/: key each dataDict;

    :count where all each .d4.validation @'/: dataDict;
 };
