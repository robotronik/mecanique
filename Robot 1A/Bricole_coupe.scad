$fn=100;

module anti_basculement(){
translate([5,2,-4])union(){
	
	cube([30,5,7]);
	translate([0,2.5,0])rotate([0,90,0])cylinder(d=5,h=30);
	}
difference(){
	translate([-50/2,0,3])cube([90,10,2]);
	
	translate([-17.5,5,1])cylinder(d=5.2,h=5);
	translate([57.5,5,1])cylinder(d=5.2,h=5);
	}	
}

anti_basculement();