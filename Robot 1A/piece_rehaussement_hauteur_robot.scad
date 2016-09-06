$fn=100;

module bille_jockey() {
	difference() {
	cylinder(d=30.2, h=1.5);
	
	}
	//translate([0,0,1.5])cylinder(h=8, r1=10.5, r2=7);
	
	difference() {
	translate([0,0,-1.5])sphere(r=10.5);
	translate([0,0,0]) cylinder(d=21,h=5);
	}
}

ep=1;
offset=0.2;

module rehausse_bille(){
	difference(){
	cylinder(d=30.2,h=ep);
		union(){
			cylinder(h=ep, r=10.5+offset/2);
			translate([0,12.6,0])cylinder(d=3+offset,h=ep);
			rotate([0,0,-120])translate([0,12.6,])cylinder(d=3+offset,h=ep);
			rotate([0,0,120])translate([0,12.6,0])cylinder(d=3+offset,h=ep);
		}
	}
}

rehausse_bille();