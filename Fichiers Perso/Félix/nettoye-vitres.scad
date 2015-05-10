$fn=100;

module maSphere() {translate([0,0,-80]) sphere(100);}
module monCube() {translate([0,0,60]) cube(120, center=true);}
module monCubeSup() {translate([0,0,70]) cube(120, center=true);}

module monDome() {
    difference() {
        intersection() {maSphere();monCube();};
        monCubeSup();
    }
}

module monAimant() {
    cube([13,15+59.1,4]);
    intersection() {
        translate([0,0,4])cube([13,15+59.1,2]);
        translate([6.5,0,-5.5])rotate([-90,0,0])cylinder(d=23,h=15+59.1);
    }
}
module mesAimants() { 
    for(i=[0:3]) {
        rotate([0,0,i*120]) translate([-6.5,0,1]) monAimant();
    }
}
module teteDeVisseuse() {
    union(){
        intersection() {
            translate([0,0,-17]) sphere(d=50);
            translate([0,0,  3]) cylinder(d=30,h=7);
        }
        cylinder(d=30,h=3);
        cylinder(d=9,h=30);
    }
}

module main() {
    difference() {
        monDome();
        mesAimants();
        teteDeVisseuse();
    }
}
//teteDeVisseuse();
main();
