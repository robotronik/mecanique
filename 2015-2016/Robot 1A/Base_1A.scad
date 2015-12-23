$fn=100;
tr = 30;

module base()
{
color ("blue") cube([200,150,5]);
}


module moteur() {
    translate ([  0,111.5, 0]) rotate([90,0,0]) cube([40,55,111.5]);
    translate ([-20, 20.5,20]) rotate([0,90,0]) cylinder(d=7, h=80);
}

module moteurs() {
    translate([  3+tr,2.5,5])
        moteur();
    translate([157-tr,2.5,5])
        moteur();
}


module roue() {
    rotate([0,90,0]) cylinder(d=72,h=20);
}

module roues()
{
    translate([ -22+tr,23,25]) roue();
    translate([+204-tr,23,25]) roue();
}

base();
#moteurs();
roues();
