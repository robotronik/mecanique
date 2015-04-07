
largeur=50;
longueur=60;

diam_trou=4;
espacement_x=8;
marge_x=8;
espacement_y=8;
marge_y=8;


module plaque() {
square([longueur,largeur]);
}

module trou(x,y) {
translate([marge_x+espacement_x*x,
           marge_y+espacement_y*y])
/*circle(d=diam_trou, $fn=100);*/
square([espacement_x,6]);
}

module trous() {
	trou(0,0);
	trou(0,1);
	trou(0,4);
	trou(1,1);
	trou(1,2);
	trou(1,3);
	trou(2,0);
	trou(2,1);
	trou(2,4);
	trou(3,1);
	trou(3,2);
	trou(3,3);
	trou(4,0);
	trou(4,1);
	trou(4,4);
	trou(5,1);
	trou(5,2);
	trou(5,3);
}

linear_extrude(height=2) difference() {
plaque();
trous();
}
