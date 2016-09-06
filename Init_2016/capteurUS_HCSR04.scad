$fn=100;

module capteurUS_HCSR04(){
	difference(){
		cube([45,20,1.5]);
		translate([0.85,0.85,0])cylinder(d=1.5,1.5);
		translate([45-0.85,0.85,0])cylinder(d=1.5,1.5);
		translate([0.85,20-0.85,0])cylinder(d=1.5,1.5);
		translate([45-0.85,20-0.85,0])cylinder(d=1.5,1.5);
	}
	translate([9.5,10,0])cylinder(d=16,h=12);
	translate([45-9.5,10,0])cylinder(d=16,h=12);
	translate([45/2-10.8/2,0.8,1.5])quartz();
	rotate([0,-180,0])translate([-10.3-17.35,20-2.56,0])connecteur_coude();
}
module quartz(){
	translate([2.2,0,0])cube([6.4,4.4,3.3]);
	translate([2.2,2.2,0])cylinder(d=4.4,3.3);
	translate([8.6,2.2,0])cylinder(d=4.4,3.3);
}

module connecteur_coude(){
	cube([10.3,2.56,3.5]);
	translate([1.025,0,3.5])cube([8.25,8.2,0.7]);
	
		
}
capteurUS_HCSR04();

