
input:read0 `$":input/day-14.data";

.d14.p1:{
    maskGroups:where[input like "mask*"] cut input;
    mem:()!();

    :sum 0b sv/:(.d14.processGroup/)[mem; maskGroups]; 
 };

.d14.processGroup:{[mem; maskGroup]
    mask:((64-36)#"X"),last " = " vs first maskGroup;

    maskLoc:where not "X" = mask;
    maskVal:"B"$/:mask where not "X" = mask;

    mems:1_ maskGroup;
    mems:("I"$-1_ 4_; 0b vs "J"$)@'/:" = " vs/: mems;

    mem[first each mems]:@[; maskLoc; :; maskVal] each last each mems;
    :mem;
 };


.d14.p2:{
    maskGroups:where[input like "mask*"] cut input;
    mem:()!();

    :sum (.d14.processGroupAsDecoder/)[mem; maskGroups]; 
 };

.d14.processGroupAsDecoder:{[mem; maskGroup]
    mask:((64-36)#"0"),last " = " vs first maskGroup;

    maskFloat:where "X" = mask;

    mems:1_ maskGroup;
    mems:("J"$-1_ 4_; "J"$)@'/: " = " vs/: mems;

    addrs:0b vs/: first each mems;
    addrs:addrs |\: "B"$/:@[mask; where "X" = mask; :; "0"];

    :(.d14.writeAllAddrs[maskFloat;;]/)[mem; (enlist each addrs),'last each mems];
 };

.d14.writeAllAddrs:{[floatingBits; mem; addrs]
    floatCombos:(cross/) count[floatingBits]#enlist 10b;
    floatAddrs:0b sv/: @[addrs 0; floatingBits; :;] each floatCombos;

    mem[floatAddrs]:addrs 1;
    :mem;
 };
