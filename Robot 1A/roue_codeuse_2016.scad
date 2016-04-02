$fn=100;
diametre_roue_ext=60;
diametre_roue_int=0;
diametre_axe=20;
longueur_axe=17;
diametre_alesage=6;
epaisseur_roue=12;
diametre_1=56;
diametre_2=47;
hauteur=5;
diametre_bande_roulement=64;
largeur_bande_roulement=10;
diametre_vis=3;
longueur_vis=8;

module roue_codeuse_new(){
	difference(){
		union(){
			translate([0,0,1])cylinder(d=diametre_bande_roulement,h=largeur_bande_roulement);
			cylinder(d=diametre_roue_ext,h=epaisseur_roue);
		}
		cylinder(h=hauteur,d1=diametre_1,d2=diametre_2);
		mirror([0,0,1])translate([0,0,-epaisseur_roue])cylinder(h=hauteur,d1=diametre_1,d2=diametre_2);
	}
	difference(){
		cylinder(d=diametre_axe,h=longueur_axe);
		cylinder(d=diametre_alesage,h=longueur_axe);
		translate([0,-2,15])rotate([90,90,0])cylinder(d=diametre_vis,h=longueur_vis);
	}	
	
}

roue_codeuse_new();