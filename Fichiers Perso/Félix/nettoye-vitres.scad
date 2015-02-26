$fn=150 ;

module maSphere() {translate([0,0,-80]) sphere(100);}
module monCube() {translate([0,0,60]) cube(120, center=true);}
module monDome() {intersection() {maSphere();monCube();}}
module monAimant() {
cube([13,15+59.1,4]);
#intersection() {
translate([0,0,4])cube([13,15+59.1,2]);
translate([6.5,0,-5.5])rotate([-90,0,0])cylinder(d=23,h=15+59.1);
}
}

module mesAimants() { 
    for(i=[0:3]) {
        rotate([0,0,i*120]) translate([-6.5,0,1]) monAimant();
    }
}
module main() {
difference() {monDome(); mesAimants();};
}

main();


module aimantPetit() {
cube([13-2,15+59.1,4-1]);
}
