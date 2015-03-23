module pales() {
	difference(){
        for (i = [0: 1: 4]){
		rotate([0, 0, i*30]) cube([3, 100, 35]);
        }
        cylinder(35, d=8);
	}
}

module attache() {
    difference(){
        translate([0,0,3]) cube([18,34,6],center=true);
	
        union() {
            translate([0,5.5-15,0]) cylinder(35, d=2.5);
            cylinder(20, d=8);
            translate([0,24.5-15,0]) cylinder(35, d=2.5);
            
        }
    }
}

module viscentrale() {
    difference(){
        cylinder(35, r=6);
        cylinder(35, d=8);
    }
}

pales();
attache();
viscentrale();
