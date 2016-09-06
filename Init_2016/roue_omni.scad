$fn=50;
module bille_jockey() {
	difference() {
	cylinder(d=30.2, h=1.5);
	translate([0,12.6,-1])cylinder(d=3,h=3);
	rotate([0,0,-120])translate([0,12.6,-1])cylinder(d=3,h=3);
	rotate([0,0,120])translate([0,12.6,-1])cylinder(d=3,h=3);
	}
	translate([0,0,1.5])cylinder(h=8, r1=10, r2=7);
	difference() {
	translate([0,0,-1.5])sphere(r=10.5);
	translate([0,0,0]) cylinder(d=21,h=5);
	}
}

bille_jockey();