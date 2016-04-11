include <../Modèles/xl320.scad>

$fn = 100;

p = 200; // profondeur 
w = 165; // largeur

e_ac = 0.5; // epaisseur acier
e_pl = 2; // epaisseur plexiglas

e = 20; // ecart;

//epaisseur du cadre
c=5;

module plaques(){
    %translate([0, 0, -e_pl/2]) cube([w, p, e_pl]);
    color("gray") translate([0, -e-1.25, e+e_pl/2+1.25]) cube([w, p, e_ac]);
}

module attache_plexi(){
    difference(){
        translate([-2.5, -12, 0])
        difference(){
            color("firebrick") union(){
                rotate([0, 90, 0]) cylinder(h=3, d = 25, center= true);
                translate([3, 0, 0]) rotate([0, 90, 0]) cylinder(h = 3, d = 15, center = true);
                
                translate([-1.5, 3.5, -2.5]) cube([12, p/2, 5]);
            }
            rotate([0, 90, 0]) cylinder(h = 20, d = 3, center = true);
        }
        
        translate([-20, 0, -e_pl/2]) cube([w, p, e_pl]);
        
        translate([2, 5, 0]) cylinder(h=10, d=3, center=true);
        translate([2, 30, 0]) cylinder(h=10, d=3, center=true);
        translate([2, 60, 0]) cylinder(h=10, d=3, center=true);
        translate([2, 85, 0]) cylinder(h=10, d=3, center=true);
    }
}

module attache_acier(){
    difference(){
        translate([-2.5, -13, 0])
        difference(){
            color("firebrick") union(){
                rotate([0, 90, 0]) cylinder(h=3, d = 25, center= true);
                translate([-1.5, 0, 0]) rotate([0, 90, 0]) cylinder(h = 12, d = 15, center = true);
                translate([-7.5, 3.5, -2.5]) cube([12, p/2, 5]);
            }
            rotate([0, 90, 0]) cylinder(h = 20, d = 3, center = true);
        }
        
        translate([-20, 0, -0.05]) cube([w, p, e_ac+0.1]);
       
        translate([-4, 5, 0]) cylinder(h=10, d=3, center=true);
        translate([-4, 30, 0]) cylinder(h=10, d=3, center=true);
        translate([-4, 60, 0]) cylinder(h=10, d=3, center=true);
        translate([-4, 85, 0]) cylinder(h=10, d=3, center=true);
    }
}

module support_servo_haut(){
    difference(){
        union(){
            cube([30, 31, 3]);
            cube([3, 31, 25]);
            translate([27, 9, 0]) cube([3, 26, 25]);
            translate([30, 6, 0]) cylinder(h=3, d=12);
        }
        translate([27+1.5, 35, 13.5]) rotate([0, 90, 0]) cylinder(h=3.2, d = 20, center=true);
        translate([5.5, 15.25, 1.5]) cube([7, 7, 1.6]);
        translate([17.5, 15.25, 1.5]) cube([7, 7, 1.6]);
        
        translate([15, 12.75, 7.5]) rotate([0, 90, 0]) cylinder(h=32, d=4, center = true);
        translate([15, 12.75, 19.5]) rotate([0, 90, 0]) cylinder(h=32, d=4, center = true);
        
        translate([10, 6, 2]) cylinder(h=5, d = 4, center=true);
        translate([20, 6, 2]) cylinder(h=5, d = 4, center=true);
        translate([30, 6, 2]) cylinder(h=5, d = 4, center=true);
        
        translate([-1, 0, 25]) rotate([0, 90, 0]) linear_extrude(32) polygon([[-0.1, -0.1], [0, 10], [10, 0]]);
    }
}

module support_servo_bas(){
    difference(){
        union(){
            translate([0, 0, -16.5]) cube([30, 31, 19.5]);
            translate([0, 28.5, -16.5]) cube([27, 36, 3]);
            translate([0, 28.5, -16.5]) cube([3, 36, 22.5]);
            translate([27, 28.5, -16.5]) cube([3, 15, 22.5]);
            translate([0, 28, -16.5]) cube([30, 3, 22.5]);
            
            
        }
        translate([5.5, 26+28.5, -15]) cube([7, 7, 1.6]);
        translate([17.5, 26+28.5, -15]) cube([7, 7, 1.6]);
        translate([5.5, 8+28.5, -15]) cube([7, 7, 1.6]);
        translate([17.5, 8+28.5, -15]) cube([7, 7, 1.6]);
        
        translate([-5, 34, 3]) rotate([0, 90, 0]) cylinder(h=40, d=4);
        translate([-5, 34, -9]) rotate([0, 90, 0]) cylinder(h=40, d=4);
        
        translate([26.5, 43.5, 6]) rotate([0, 90, 0]) linear_extrude(4) polygon([[-0.1, 0.1], [0, -5], [5, 0]]);
        translate([-0.5, 64.5, 6]) rotate([0, 90, 0]) linear_extrude(4) polygon([[-0.1, 0.1], [0, -5], [5, 0]]);
        
        scale([1, 1.75, 1]) translate([-0.5, 0, -16]) rotate([0, 90, 0]) cylinder(h=32, d=32);
        
        translate([4, 6, 0]) cylinder(h=30, d = 4, center=true);
        translate([14, 6, 0]) cylinder(h=30, d = 4, center=true);
        translate([24, 6, 0]) cylinder(h=30, d = 4, center=true);
    }
}

//plaques();

module ensemble(){
translate([55, 0, 0]) attache_plexi();
translate([55, -e-1.25, e+e_pl/2+1.25]) attache_acier();
translate([-7+55, -39, 10.5]) rotate([0, 180, 0]) xl320();
translate([-13+55, -39-e-1.25, 33]) rotate([0, 180, 0]) xl320();

color("blue") translate([15, -70, 9]) support_servo_haut();
color("green") translate([21, -70, 3]) support_servo_bas();

translate([w-51, 0, 0]) mirror([1, 0, 0]) attache_plexi();
translate([w-51, -e-1.25, e+e_pl/2+1.25]) mirror([1, 0, 0]) attache_acier();
translate([-19+w-25, -39, 10.5]) mirror([1, 0, 0]) rotate([0, 180, 0]) xl320();
translate([-13+w-25, -39-e-1.25, 33]) mirror([1, 0, 0]) rotate([0, 180, 0]) xl320();

color("blue") translate([w-11, -70, 9]) mirror([1, 0, 0]) support_servo_haut();
color("green") translate([w-17, -70, 3]) mirror([1, 0, 0]) support_servo_bas();
}


//ensemble();
//color("dimgray") translate([0, -92, 6]) cube([w, 50, 3]);