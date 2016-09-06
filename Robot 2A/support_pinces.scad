include <../Modèles/xl320.scad>

$fn = 100;

module support_front(){
    difference(){
        union(){
            translate([-5, -11, -3]) cube([31, 50, 3]);
            translate([-5, 36, 0]) cube([31, 3, 24]);
            translate([-5, -11, 0]) cube([4.5, 48, 24]);
            translate([21.5, -11, 0]) cube([4.5, 48, 24]);
        }
        
        translate([-5.5, -11, 12]) cube([32, 42, 15]);
        translate([-5.1, 12.45, 2.1]) cube([4.6, 11.1, 10]);
        translate([21.5, 12.45, 2.1]) cube([4.6, 11.1, 10]);
        
        translate([-2.1, 5.5, 0]) cube([2.1, 7, 25]);
        translate([-2.1, 23.5, 0]) cube([2.1, 7.5, 25]);
        
        translate([21, 5.5, 0]) cube([2.1, 7, 25]);
        translate([21, 23.5, 0]) cube([2.1, 7.5, 25]);
        
        translate([-5.1, 39, -4]) linear_extrude(30) polygon([[-0.1, 0.1], [4, 0], [0, -4]]);
        translate([26, 39, -4]) linear_extrude(30) polygon([[0.1, 0.1], [-4, 0], [0, -4]]);
        
        translate([4.5, 3, -4]) cylinder(h=30, d=4);
        translate([16.5, 3, -4]) cylinder(h=30, d=4);
        translate([-6, -11, 24]) scale([1, 1, 2.28]) rotate([0, 90, 0]) cylinder(h=33, d=21);
    }
}

module attache_pince(){
    difference(){
        union(){
            cylinder(h = 3, d = 20, center = true);
            translate([0, 0, 3]) cylinder(h = 3, d = 15, center = true);
            
            translate([0, 20.5, 16]) cube([3, 35, 35], center = true);
            
            translate([2, -3.5, 1.5]) cube([7, 7, 3]);
            translate([-9, -3.5, 1.5]) cube([7, 7, 3]);
            translate([-3.5, -9, 1.5]) cube([7, 7, 3]);
        }
        
        cylinder(h = 20, d = 3, center = true);
        
        translate([0, -6, 0])cylinder(h = 20, d = 4, center = true);
        translate([6, 0, 0])cylinder(h = 20, d = 4, center = true);
        translate([-6, 0, 0])cylinder(h = 20, d = 4, center = true);
        
        translate([0, 10, 25]) rotate([0, 90, 0]) cylinder(d = 3, h = 4, center = true);
        translate([0, 30.5, 25]) rotate([0, 90, 0]) cylinder(d = 3, h = 4, center = true);
        translate([0, 30.5, 5]) rotate([0, 90, 0]) cylinder(d = 3, h = 4, center = true);
    }
}

translate([0, 0, 24]) rotate([0, 90, 0]) xl320();
support_front();
translate([10.5, 26, 28.5]) color("firebrick") attache_pince();