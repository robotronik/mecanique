$fn=100;
i=38;
epaisseur_bloc=14;
module empileur() {
	cube([38,10,20]);
	cube([7,22,20]);
	translate([31,0,0]) cube([7,22,20]);
	translate([10,-12,-50]) cube([20,12,100]);
	translate([7,10,-10]) cube([24,30,40]);
	translate([26,-17.5,-5]) cylinder(d=35,h=6.5);
	translate([26,-17.5,1.5]) cylinder(d1=35,d2=0,h=10);
}

module plaque() {
	intersection() {
		translate([i,0])circle(i);
		translate([0,-i])square([i,i]);
	}
	translate([i,-i])difference() {
		square([24,i]);
		translate([44-i,i])rotate([0,0,-65])
			square([50,30]);
	}
square([44,22]);
}

module pla() {
translate([-3,0,0])linear_extrude(height = epaisseur_bloc)plaque();
epaisseur_presse=5;
hauteur_presse=22.5;
translate([44+15-epaisseur_presse,-i,0])
cube([epaisseur_presse,10,hauteur_presse+epaisseur_bloc]);
}


difference() {
pla();
translate([0,0,epaisseur_bloc-10])empileur();
}

