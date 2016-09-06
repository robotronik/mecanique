$fn = 100;

module demi_equerre(){
    difference(){
        union(){
            cube([21, 3, 12]);
            translate([21, 3, 6]) rotate ([90, 0, 0]) cylinder(d = 12, h=3);
            translate([21, 0, 0]) cube([6, 3, 6]);
        }
        
        translate([10, 1.5, 6]) rotate([90, 0, 0]) cylinder(d = 3.1, h=3.2, center = true);
        translate([20, 1.5, 6]) rotate([90, 0, 0]) cylinder(d = 3.1, h=3.2, center = true);
    }
    
}

module equerre_pince(){
    demi_equerre();
    translate([2.95, 0.52, 0]) rotate([0, 0, 100]) color("blue") demi_equerre();
}

module equerre_cote(){
    demi_equerre();
    translate([2.13, 2.1, 0]) rotate([0, 0, 135]) color("blue") demi_equerre();
}

equerre_cote();