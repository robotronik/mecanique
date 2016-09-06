$fn=100;

module fixation_etage2(L,e) {
	 // e = epaisseur
	cube([25,L,e]); 
	difference() {
		rotate([0,90,0])cube([20,L,e]);
		translate([-1,5,-10])rotate([0,90,0])cylinder(d=4,h=7);
		translate([-1,L-5,-10])rotate([0,90,0])cylinder(d=4,h=7);
	}
	translate([0,L,0]) rotate([90,0,0])linear_extrude(height = L)polygon(
		points=[ [0,0],[7,0],[0,-7] ],
		paths=[ [0,1,2] ]
	);	
}

fixation_etage2(80,3);