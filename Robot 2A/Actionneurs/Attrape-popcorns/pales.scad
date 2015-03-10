$fn=150;

hauteur=5;
longueur_pales=62;

module pale() {
	translate([-1.5,0,0])cube([3,longueur_pales,hauteur]);
}

module pales() {
union() {
	for	 (i=[0:4]) {rotate([0,0,i*360/5])pale();}
	cylinder(hauteur,d=10);
}
}


difference(){
	pales();
	cylinder(hauteur, d=5);
}


