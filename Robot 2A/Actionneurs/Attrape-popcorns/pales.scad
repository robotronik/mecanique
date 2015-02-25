$fn=150;
module pale() {
	translate([-1.5,0,0])cube([3,45,20]);
}

module pales() {
union() {
	for	 (i=[0:4]) {rotate([0,0,i*360/5])pale();}
	cylinder(20,d=10);
}
}


difference(){
	pales();
	cylinder(20, d=5);
}


