

board_L = 97;
board_l = 66;
board_e = 1.5;

//barette(20,2);
stm32f4();

module barette(a, b) {
    translate([-1.25,-1.25,-8.5])
    cube([2.5*a, 2.5*b, 14]);
}

module stm32f4() {
    cube([board_L, board_l, board_e]);
    translate([2.22,6.33,0])
        barette(25,2);
    translate([2.22,board_l-6.33,0])
        mirror([0,1,0])barette(25,2);
    
    translate([board_L-3.34,6.33,0])mirror([1,0,0])
        barette(2,1);
    translate([board_L-3.34,board_l-6.33,0])mirror([1,0,0])
        mirror([0,1,0])barette(2,1);
    
    translate([board_L-11,board_l-6.33,0])mirror([1,0,0])
        mirror([0,1,0])barette(6,1);
    
}