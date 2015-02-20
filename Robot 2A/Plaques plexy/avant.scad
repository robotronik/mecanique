module trou_vis() { circle(5); }

difference() {
square([600,300]);
union() {
	translate([100,20,0]) trou_vis();
	translate([500,20,0]) trou_vis();
}
}