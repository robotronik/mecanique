$fn=30;

module rond(){
	intersection(){
		rotate_extrude()rotate([90,0,0])difference(){
			square([65,40]);
			translate([15,21])union() {
				translate([15,0]) circle(d=43);
				square([30,43], center=true);
			}
		}
		translate([-15,0,0])
		cube([90,110,100], center=true);
	}
}
rond();
for	 (i=[0:4]) {
	rotate([0,0,i*360/5])
	translate([0,0,10])cube([3,35,20]);
}