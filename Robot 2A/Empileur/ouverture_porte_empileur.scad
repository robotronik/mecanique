$fn=100;

// L'axe du servo doit être (à peu près) à 35mm de la surface de l'empileur :)

// Constantes
empileur_d=80;
empileur_h=40;
vis_empileur_d=5;
axe_d_int=5.5;
axe_d_ext=10.;
axe_d_tete=9;
long_securite = empileur_d/2 + 10;
hauteur_attache=10;
hauteur_partie_servo=6;
epaisseur_attache=4;

//bras porte
longueur_bras=25;
largeur_bras=7;
long_trou_bras=4;
larg_trou_bras=4;
angle_bras=-20;
//bras servo
longueur_bras_servo=20;
largeur_bras_servo=7;
long_trou_bras_servo=0;
dia_vis=2;
dia_milieu=4;
pos_milieu=40;
ecart_vis=15;

module empileur() {
    translate([0,0,-empileur_h/2]) {
        cylinder(d=empileur_d,h=empileur_h);
    translate([-long_securite,-long_securite])
        cube([long_securite,long_securite*2,empileur_h]);
    rotate([0,0,70])
        cube([long_securite,long_securite,empileur_h]);
    }
}
module vis_empileur() {
    translate([0,0,hauteur_attache/2])
        for(i=[1,2]) {
            rotate([0,90,i*70/3])
                cylinder(d=vis_empileur_d,h=long_securite);
        }
    translate([empileur_d/2+axe_d_ext/2,0,-empileur_h/2])
        cylinder(d=axe_d_int,h=empileur_h+0.2);
    translate([empileur_d/2+axe_d_ext/2,0,hauteur_attache])
        cylinder(d=axe_d_tete,h=empileur_h+0.2);
}

module attache() {
    difference() {
    cylinder(r=empileur_d/2+epaisseur_attache,h=hauteur_attache);
    translate([-long_securite,-long_securite,-empileur_h/2])
        cube([long_securite*2,long_securite,empileur_h]);
    translate([13.6,37.6,-empileur_h/2])rotate([0,0,15])
        cube([long_securite,long_securite,empileur_h]);
    }
    translate([empileur_d/2+axe_d_ext/2,0,0])
        cylinder(d=axe_d_ext,h=hauteur_attache);
}

module trous_servo(haut) {
    translate([0,0,-0.1]) cylinder(d=dia_milieu,h=haut+0.2);
    translate([ecart_vis/2,0,-0.1]) cylinder(d=dia_vis,h=haut+0.2);
    translate([-ecart_vis/2,0,-0.1]) cylinder(d=dia_vis,h=haut+0.2);
}


module barre(long, larg, haut){
	translate([0,-larg/2,0])
		cube([long,larg,haut]);
	cylinder(d=larg,h=haut);
	translate([long,0,0])
		cylinder(d=larg,h=haut);
}

module bras_type_b(long, larg, long_trou) {
	difference() {
		barre(long,larg,hauteur_attache);
		translate([long, 0, -0.1])
			barre(0, larg_trou_bras, hauteur_attache+0.2);
	}
}
module charniere_simple() {
	difference() {
        attache();
		vis_empileur();
		empileur();
	}
}

module partie_porte() {
	difference() {
		union() {
			attache();
			translate([(empileur_d+axe_d_ext)/2,0,0])
				rotate([0,0,-20])
					bras_type_b(longueur_bras,largeur_bras,long_trou_bras);
		}
		vis_empileur();
		empileur();
	}
}

module partie_servo() {
 	difference() {
        union() {
		translate([-9,0,0])
            barre(longueur_bras_servo+9,largeur_bras,hauteur_partie_servo);
        translate([20,0,0]) rotate([0,0,45])barre(20,largeur_bras,hauteur_partie_servo);
        translate([10,0,0]) rotate([0,0,90])barre(30,largeur_bras,hauteur_partie_servo);
        }
        trous_servo(hauteur_partie_servo);
	}
}

partie_servo();
// Non utilisés :

module renfort()
{
    difference() {
        cube([10,10,hauteur_attache]);
        translate([10,10,-0.1])
            cylinder(d=15,h=hauteur_attache+0.2);
    }
}

module rotate_bras(angle)
{
	translate([longueur_bras-2*larg_trou_bras,0,0])
		rotate(angle,v=[0,0,1])
			translate([-longueur_bras+2*larg_trou_bras,0,0])
				child();
}