$fn=100;

difference()
{
    union() {
        cylinder(d=8,h=30);
        translate([-4.5,-4.5,0]) cube([13,9,2]);
            }
    cylinder(d=3,h=31);
}
difference()
{
    translate([6.5,-4.5,0]) cube([2,9,10]);
    #rotate([0,90,0]) translate([-6,0,6]) cylinder(d=3,h=3);
}
