module vis(l) {
    cylinder(d=1,5, h=10);
}

module servo() {
    translate([0,0,0])       cube([20,41,36]);
    translate([0,-6.5,23.5]) cube([20,54,10]);

	translate([ 5.5,  -3.25,14]) vis();
	translate([14.5,  -3.25,14]) vis();
	translate([ 5.5,41+3.25,14]) vis();
	translate([14.5,41+3.25,14]) vis();

    translate([10,10,36]) cylinder(d=15, h=2);
}