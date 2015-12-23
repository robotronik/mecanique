module courbe() {
	intersection() {
		difference() {
			cylinder(20, r=70);
			cylinder(20, r=65);
		}
		cube([70, 70, 20]);
    }
    difference() {
        cylinder(20, r=5);
        cylinder(20, r=2);
    }
}

module pales() {
	for (i=[0:1:4]){
		rotate([0,0,90*i/4])
			translate([65,0,0])
				cube([50,3,20]);
	}
	rotate([0,0,45])cube([65,3,20]);
}
				
courbe();
pales();