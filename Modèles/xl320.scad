$fn=100;

module petit_carre(){
    difference(){
        cube([6, 6, 1.5]);
        translate([3, 3, 1]) cylinder(h=3, d=4, center=true);
    }
}
    

module xl320(){
    difference(){
        cube([24, 36, 21]);
        
        translate([3, -1, -1]) cube([18, 7, 26]);
        translate([-1, -0.1, -0.1]) rotate([0, 90, 0]) linear_extrude(26) polygon([[0, 0], [0, 3.1], [-3.1, 0]]);
        translate([-1, -0.1, 21.6]) rotate([-90, 0, 0]) rotate([0, 90, 0]) linear_extrude(26) polygon([[0, 0], [0, 3.1], [-3.1, 0]]);
        translate([-1, 36.1, 21.6]) rotate([180, 0, 0]) rotate([0, 90, 0]) linear_extrude(26) polygon([[0, 0], [0, 3.1], [-3.1, 0]]);
        translate([-1, 36.1, -0.1]) rotate([90, 0, 0]) rotate([0, 90, 0]) linear_extrude(26) polygon([[0, 0], [0, 3.1], [-3.1, 0]]);
        
        translate([-1, 3, 10.5]) rotate([0, 90, 0]) cylinder(h=26, d=4);
        translate([-1, 3, 16.5]) rotate([0, 90, 0]) cylinder(h=26, d=4);
        translate([-1, 3, 4.5]) rotate([0, 90, 0]) cylinder(h=26, d=4);
    }
    
    color("dimgray") translate([-1.5, 26, 10.5]) rotate([0, 90, 0])
    difference(){
        cylinder(h=3.1, d = 17, center = true);
        for(i = [0:3]){
            translate([6*cos(i*90), 6*sin(i*90), 0]) cylinder(h=3.2, d=1, center=true);
            translate([6*cos(i*90+45), 6*sin(i*90+45), 0]) cylinder(h=3.2, d=4, center=true);
        }
        cylinder(h=3.2, d=3, center=true);
    }
    
    translate([3, 6, 21]) petit_carre();
    translate([3, 24, 21]) petit_carre();
    translate([15, 6, 21]) petit_carre();
    translate([15, 24, 21]) petit_carre();
    
    translate([3, 6, -1.5]) petit_carre();
    translate([3, 24, -1.5]) petit_carre();
    translate([15, 6, -1.5]) petit_carre();
    translate([15, 24, -1.5]) petit_carre();
}

//xl320();