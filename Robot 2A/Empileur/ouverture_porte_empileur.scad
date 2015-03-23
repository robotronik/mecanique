$fn=100;

include <../../Modèles/Servo.scad>

// Constantes
empileur_d=80;
empileur_h=100;
vis_empileur_d=5;
axe_d_int=5.5;
axe_d_ext=10.;
axe_d_tete=9;
long_securite = empileur_d/2 + 100;
hauteur_attache=10;
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
ecart_vis=10;

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
                #cylinder(d=vis_empileur_d,h=empileur_d/2+epaisseur_attache+0.1);
        }
        
    translate([empileur_d/2+4,7,-5])
        rotate([0,0,15])translate([10,10,0])
            #cylinder(d=3, h=30);
}

module attache() {
    difference() {
    cylinder(r=empileur_d/2+epaisseur_attache,h=hauteur_attache);
    translate([-long_securite,-long_securite,-empileur_h/2])
        cube([long_securite*2,long_securite,empileur_h]);
    translate([13.6,37.6,-empileur_h/2])rotate([0,0,15])
        cube([long_securite,long_securite,empileur_h]);
    }
    //translate([empileur_d/2+axe_d_ext/2,0,0])
    //    #cylinder(d=axe_d_ext,h=hauteur_attache);
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

module partie_simple() {
	difference() {
		union() {
			attache();
			translate([(empileur_d+axe_d_ext)/2-1,3.5,0])
				rotate([0,0,66])
					barre(17.3,largeur_bras,hauteur_attache);
		}
		vis_empileur();
		empileur();
	}
}
module partie_porte() {
	difference() {
		union() {
			attache();
			translate([(empileur_d+axe_d_ext)/2-1.5,0,0])
				rotate([0,0,-68])
					barre(20.5,largeur_bras,hauteur_attache);
		}
		vis_empileur();
		empileur();
	}
}

module partie_servo() {
	difference() {
		union() {
            charniere_simple();
            translate([empileur_d/2+4,7,-45+hauteur_attache]) 
                rotate([0,0,15])difference() {
                    union() {
                        translate([-4-16,-6.5,-3])cube([28+12,35,33]);
                        translate([-4-16,-6.5,-3])cube([20,44,38]);
                        
                    }
                    #servo();
                }
		}
    translate([-long_securite,-long_securite,-empileur_h/2])
        cube([long_securite*2,long_securite,empileur_h]);
		vis_empileur();
		empileur();
	}
}

mirror([0,1,0])
partie_servo();
translate([0,0,hauteur_attache]) partie_porte();
// Non utilisés :
//translate([empileur_d/2+4,7,-45+hauteur_attache])
//    rotate([0,0,15])translate([10,10,36]) cylinder(d=3, h=2);

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