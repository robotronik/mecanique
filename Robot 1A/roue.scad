$fn=100;
difference(){
		union()
		{
		cylinder(20,d=35);
		for(i=[1:1:15]){
			rotate([0,0,360/15*i]) translate([17,0,15]) 
				linear_extrude(5)
					polygon([[0,0],[-5,8],[7,3.5]]);
		}

		cylinder(20,d=35,center=true);
		}
	translate([0,0,-10.1]) cylinder(30.2,d=7);
	translate([6,6,-10.1]) cylinder(15,d=7);
	}











