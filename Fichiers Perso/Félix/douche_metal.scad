$fn=160;

module metal() {
    translate([0,0,0])    cylinder(d=21,h=3.5);
    translate([0,0,3.5])  cylinder(d=5.90,h=8);
    translate([0,0,3.5+7])cylinder(d=13,h=50);

    translate([0,0,3.5])difference() {
        cylinder(d=21,h=4);
        translate([-20,-8.6,0])cube([40,20,4]);
    }
}

translate([0,0,-3.5])#metal();
