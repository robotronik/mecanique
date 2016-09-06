$fn = 100;


module plaque_av(){
    difference(){
        cube([270, 300, 3], center = true);
    
        translate([-124, -130, 0]) cylinder(h=4, d=4, center = true);
        translate([-124, 130, 0]) cylinder(h=4, d=4, center = true);
        
        translate([124, -130, 0]) cylinder(h=4, d=4, center = true);
        translate([124, 130, 0]) cylinder(h=4, d=4, center = true);
    }
}

module correction_plaque(){
    difference(){
        translate([1, 1, 0]) cube([268, 298, 3]);
        translate([35, 100, 0]) cube([200, 50, 3]);
    }
}


projection(cut = false)
correction_plaque();