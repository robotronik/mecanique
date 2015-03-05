$fn=100;

module bras()
{
	translate([0,-5,-4]) cube([75,10,8]); //bras principal
	translate([65,-45,4]) rotate([0,90,0]) cube([8,40,10]); //bras secondaire
	translate([45,-55,4]) rotate([0,90,0]) cube([8,20,50]); //maintien tapis
	translate([45,-47.5,-4]) rotate([0,90,0]) cube([5,5,50]);
	
	

	
	
}

module vis()
{
	rotate([0,90,0]) translate([0,8.5,0]) cylinder(d=2, h=10);
	rotate([0,90,0]) translate([0,-8.5,0]) cylinder(d=2, h=10);
}

module base()
{
	difference()
	{
		rotate([0,90,0]) cylinder(d=25,h=5);
		translate([-5,-12.5,5]) cube([15,25,10]);
		translate([-5,-12.5,-15]) cube([15,25,10]);
	}
}


difference () 
{
	union() 
	{
		bras();
		base();
	}
	vis();
}