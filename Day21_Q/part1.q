{INPUT:" "vs/:"\n"vs x;
    hitpoints: "J"$INPUT[0;2];
    damage:    "J"$INPUT[1;1];
    armor:     "J"$INPUT[2;1];

    / Item shop elements
    weapons:   ([]cost:8 10 25 40 74;     
                  dmg:4 5 6 7 8;   
                  armor:0);

    armor:     ([]cost:13 31 53 75 102;  
                  dmg:0;           
                  armor:1 2 3 4 5);

    ring:      ([]cost:25 50 100 20 40 80;
                  dmg:1 2 3 0 0 0; 
                armor:0 0 0 1 2 3);

    w:        raze(enlist each weapons), /:\:(enlist[()], enlist each arm);
    wg:       raze w,/:\:enlist[()], (enlist each ring), ring distinct asc each raze til[count ring],/:'til[count ring] 

except/:til count ring;
    stat:sum each wg;
    stat:update isWin:(ceiling hitpoints%(1 | dmg-armor)) <= ceiling 100%1 | damage-arm from stat;
	/ Solve the challenge
    exec min cost from stat where isWin}