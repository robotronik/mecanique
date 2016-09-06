$fn = 100;

module support_servo_haut(){
    difference(){
        union(){
            translate([-0.5, 10, 0]) cube([31, 21, 3]);
            translate([-0.5, -2, -9]) cube([3, 33, 34]);
            translate([27.5, 9, -9]) cube([3, 22, 34]);
            translate([30, 5, -9]) cylinder(h=3, d=14); 
            translate([-0.5, -2, -9]) cube([31, 14, 3]);
        }
        translate([27+1.5, 35, 13.5]) rotate([0, 90, 0]) cylinder(h=10, d = 20, center=true);
        translate([5.5, 15.25, 1]) cube([7, 7, 2.1]);
        translate([17.5, 15.25, 1]) cube([7, 7, 2.1]);
        
        translate([15, 12.75, 7.5]) rotate([0, 90, 0]) cylinder(h=32, d=4, center = true);
        translate([15, 12.75, 19.5]) rotate([0, 90, 0]) cylinder(h=32, d=4, center = true);
        
        translate([10, 5, 2]) cylinder(h=25, d = 4, center=true);
        translate([20, 5, 2]) cylinder(h=25, d = 4, center=true);
        translate([30, 5, 2]) cylinder(h=25, d = 4, center=true);
        
        translate([-1, -2, 25]) rotate([0, 90, 0]) linear_extrude(32) polygon([[-0.1, -0.1], [0, 12], [12, 0]]);
        
        //translate([5.5, 22, -0.1]) cube([19, 9.1, 3.2]);
        //translate([5.5, 22.1, 1]) cube([19, 3, 2.1]);
    }
}

module support_parasol(){
    support_servo_haut();
    translate([-0.5, 10, -9]) cube([31, 21, 9]);
}

support_parasol();