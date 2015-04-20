$fn=100;

module pale() {
    difference(){
        cube([3.5, 100, 35]);
        translate([-0.1,100,20]) rotate([75, 0, 0]) cube([4, 100, 100]);
    }
}

module pales() {
	difference(){
        for (i = [0: 1: 4]){
		rotate([0, 0, i*30]) pale();
        }
        cylinder(35, d=8);
	}
}

module attache() {
    rotate([0,0,-35])difference(){
        translate([0,0,35]) mirror([0,0,1])linear_extrude(height=15, scale=0.2)square([18,34],center=true);
	
        union() {
            translate([0,5.5-15,0]) cylinder(35, d=2.5);
            cylinder(35, d=8);
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

module eventail() {
    pales();
    attache();
    viscentrale();
}
eventail();
