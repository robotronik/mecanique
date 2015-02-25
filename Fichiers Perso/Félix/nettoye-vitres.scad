$fn=150 ;

module maSphere() {translate([0,0,-80]) sphere(100);}
module monCube() {translate([0,0,60]) cube(120, center=true);}
module monDome() {intersection() {maSphere();monCube();}}
module monAimant() {translate([-6.5,0,1]) cube([13,15+59.1,4]);}

module mesAimants() { 
    for(i=[0:3]) {
        rotate([0,0,i*120]) #monAimant();
    }
}

difference() {monDome(); mesAimants();};
//mesAimants();