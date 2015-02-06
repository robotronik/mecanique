$fn=100;
difference(){
		union()
		{
		cylinder(20,d=35);
		for(i=[1:1:15]){
			rotate([0,0,360/15*i]) translate([16,0,13]) 
				linear_extrude(7)
					polygon([[0,-5],[0,5],[8,0]]);
		}

		
		}
	translate([0,0,-10.1]) cylinder(30.2,d=9);
	translate([7,7,-10.1]) cylinder(15,d=7);
	}











