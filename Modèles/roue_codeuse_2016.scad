diametre_roue_ext=60;
diametre_axe=20;
longueur_axe=17;
diametre_alesage=6;
epaisseur_roue=12;
diametre_1=56;
diametre_2=47;
diametre_bande_roulement=64;
largeur_bande_roulement=10;
diametre_vis=3;
longueur_vis=8;

codeuse_diametre    = 41.2;
codeuse_epaisseur   = 10;
codeur_diametre     = 21.36;
codeur_epaisseur    = 12.5;

module _roue_codeuse_new(){
	difference(){
		union(){
			translate([0,0,1])
            cylinder(d=diametre_bande_roulement,h=largeur_bande_roulement);
			cylinder(d=diametre_roue_ext,h=epaisseur_roue);
		}
        translate([0,0,-0.01])
            cylinder(h=5, d1=diametre_1, d2=diametre_2);
		translate([0,0, 0.01+epaisseur_roue-5])
            cylinder(h=5, d1=diametre_2, d2=diametre_1);
	}
	difference(){
		cylinder(d=diametre_axe,h=longueur_axe);
		translate([0,-2,15])rotate([90,0,0])
            cylinder(d=diametre_vis,h=longueur_vis,$fn=20);
	}
    
    // Axe
    translate([0,0,codeuse_epaisseur+7])
        cylinder(d=9.7,h=8.5, $fn=50);
    
    // Codeur
    translate([0,0,codeuse_epaisseur+7+7.8]) {
            cylinder(d=17.7, h=1.2);
        translate([0, 0, 1.2])
            cylinder(d=21.3, h=8);
        translate([0, 0, 1.2+8])
            cylinder(d=18.9, h=3.3);
        translate([21.3/2-23.2,-11.9/2,3.9])
            cube([10,11.9,5.1]);
    }

}

module roue_codeuse_new() {
    translate([-10,0])rotate([0,90,0])_roue_codeuse_new();
}
//_roue_codeuse_new();
