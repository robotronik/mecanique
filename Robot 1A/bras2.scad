$fn=100;

module bras()
{
	translate([0,-5,-3]) cube([75,10,8]); //bras principal
	translate([65,-25,5]) rotate([0,90,0]) cube([8,20,10]); //bras secondaire
	translate([45,-35,5]) rotate([0,90,0]) cube([8,20,50]); //maintien tapis
	translate([45,-27.5,-3]) rotate([0,90,0]) cube([5,5,50]);
	
	

	
	
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