$fn = 100;

module avant_pince(){
    difference(){
        cube([50, 250, 3], center = true);
        
        translate([15, -110, 0]) cylinder(h=4, d=3, center = true);
        translate([15, 110, 0]) cylinder(h=4, d=3, center = true);
        translate([5, -110, 0]) cylinder(h=4, d=3, center = true);
        translate([5, 110, 0]) cylinder(h=4, d=3, center = true);
        
        translate([-15, -0, 0]) cube([20, 50, 4], center = true);
    }
}

module pince(){
    difference(){
        cube([60, 250, 3], center = true);
        
        translate([-20, -110, 0]) cylinder(h=4, d=3, center = true);
        translate([-20, 110, 0]) cylinder(h=4, d=3, center = true);
        translate([-10, -110, 0]) cylinder(h=4, d=3, center = true);
        translate([-10, 110, 0]) cylinder(h=4, d=3, center = true);
    }
}

module plaque_arr(){
    difference(){
        cube([158, 300, 3], center =  true);
        
        translate([-44, -110, 0]) cylinder(h=4, d=4, center = true);
        translate([-44, 110, 0]) cylinder(h=4, d=4, center = true);
        
        translate([44, -110, 0]) cylinder(h=4, d=4, center = true);
        translate([44, 110, 0]) cylinder(h=4, d=4, center = true);
    }
}

module plaque_av(){
    difference(){
        cube([270, 300, 3], center = true);
    
        translate([-124, -130, 0]) cylinder(h=4, d=4, center = true);
        translate([-124, 130, 0]) cylinder(h=4, d=4, center = true);
        
        translate([124, -130, 0]) cylinder(h=4, d=4, center = true);
        translate([124, 130, 0]) cylinder(h=4, d=4, center = true);
    }
}

module plaque_cote(){
    difference(){
        cube([164, 300, 3], center = true);
        
        translate([72, -130, 0]) cylinder(h=4, d=3, center = true);
        translate([62, -130, 0]) cylinder(h=4, d=3, center = true);
        translate([72, 130, 0]) cylinder(h=4, d=3, center = true);
        translate([62, 130, 0]) cylinder(h=4, d=3, center = true);
        
        translate([72, -110, 0]) cylinder(h=4, d=4, center = true);
        translate([72, 110, 0]) cylinder(h=4, d=4, center = true);
        
        translate([-71, -110, 0]) cylinder(h=4, d=4, center = true);
        translate([-71, 110, 0]) cylinder(h=4, d=4, center = true);
        
        translate([0, -30, 0]) cube([125, 40, 4], center = true);
    }
}

module plaque_angle(){
    difference(){
        cube([80, 300, 3], center = true);
        
        translate([30, -130, 0]) cylinder(h=4, d=3, center = true);
        translate([20, -130, 0]) cylinder(h=4, d=3, center = true);
        translate([30, 130, 0]) cylinder(h=4, d=3, center = true);
        translate([20, 130, 0]) cylinder(h=4, d=3, center = true);
    }
}


//projection(cut = false)
module plexi1(){
translate([25, 175, 0]) union(){
    avant_pince();
    translate([60, 0, 0]) pince();
    translate([180, -25, 0]) plaque_arr();
    translate([100, 170, 0]) rotate([0, 0, 90]) avant_pince();
    translate([100, 230, 0]) rotate([0, 0, 90]) pince();
    translate([310, -25, 0]) plaque_angle();
}
}

module plexi2(){
    translate([35, 175, 0]) union(){
    translate([400, -25, 0]) plaque_av();
    
    translate([590, -25, 0]) plaque_angle();
    translate([440, 180, 0]) rotate([0, 0, 90]) plaque_angle();
    
    }
}

module plexi3(){
    translate([35, 175, 0]) union(){
        translate([630, -25, 0]) plaque_cote();
    
        translate([450, -25, 0]) plaque_cote();
    }
}


module plexi_cartes(){
    cube([130, 160, 3]);
    translate([140, 0, 0]) cube([160, 160, 3]);
    translate([310, 0, 0]) cube([130, 160, 3]);
    
    translate([310, 170, 0]) cube([80, 80, 3]);
    translate([400, 170, 0]) cube([80, 80, 3]);    
}

% difference(){
    translate([0, 0, -1]) cube([500, 400, 1]);
    translate([0, 170, -1.1]) cube([280, 230, 1.2]);
}
//projection(cut = false) 
plexi_cartes();