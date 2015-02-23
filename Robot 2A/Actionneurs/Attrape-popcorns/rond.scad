$fn=150;

module coupe() {
	difference(){
		square([65,40]);
		#union() {
			translate([37.5,21]) circle(d=45);
			translate([18.75,21]) square([45,45], center=true);
		}
	}
}


module rond(){
	intersection(){
		translate([5,0,0])rotate_extrude()rotate([90,0,0]) #coupe();
		translate([-15,0,0])
		#cube([90,140,100], center=true);
	}
}
rond();

