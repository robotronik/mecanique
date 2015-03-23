module pales() {
	for (i = [0: 1: 4]){
		rotate([0, 0, i*30]) cube([3, 100, 20]);
	}
}

module vis() {
	difference(){
		cylinder(20, r=10);
		cylinder(20, r=5);
	}
}

vis();
difference() {
	pales();
	cylinder(20, r=5);
}
