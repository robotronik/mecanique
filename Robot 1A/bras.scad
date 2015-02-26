$fn=100;

module bras()
{
	rotate([0,90,0]) cylinder(d=25,h=5);
	translate([0,-5,-5]) cube([75,10,10]);
	translate([65,-5,5]) rotate([180,0,0]) cube([10,30,10]);

}


bras();