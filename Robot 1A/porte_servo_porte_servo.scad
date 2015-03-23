$fn=100;

module base()
{
		translate([0,25,-28]) cube([5,8,25]);
}

module vis()
{
	#rotate([0,90,0]) translate([8,29,0]) cylinder(d=2, h=10);
	#rotate([0,90,0]) translate([25,29,0]) cylinder(d=2, h=10);
}

module servo()
{
	translate([0,0,0])       cube([20,43,36]);
   #translate([0,-6.5,25]) cube([20,57,10]);
   translate([10,10,36]) cylinder(d=15, h=2);
}

module porte_servo()
{
	difference()
	{
		translate([0,25,-3]) rotate([180,0,0]) cube([56.4,24,32]);
		translate([50,20,-6]) rotate([180,0,270]) servo();
		//translate([50,7,-9]) cube([7,9,3]);
		#translate([49,13,-25]) cube([8,6,2]);
		translate([-1,13,-25]) cube([9,6,2]);
        #translate([49,3,-25]) cube([8,6,2]);
		translate([-1,3,-25]) cube([9,6,2]);
	}
}

difference()
{
	union()
	{
		base();
		porte_servo();
	}
		vis();
	
}
