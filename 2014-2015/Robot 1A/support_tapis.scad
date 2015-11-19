$fn=100;

difference()
{
    union()
    {
	cube([130,14,10]);
    translate([0,14,0]) cube([30,2,10]);
    }
	translate([0,3.5,3]) cube([150,7,7]);
}