include <./Constantes.scad>;
use <Plaques Alu/plaques.scad>
use <Plaques Plexy/coté.scad>
use <Plaques Plexy/toit.scad>
use <Empileur/support_empileur.scad>

module structure() {
    translate([0,0,hauteur_bas])
        linear_extrude(height=epaisseur_alu) plaque_bas();
    translate([0,0,hauteur_interm])
        linear_extrude(height=epaisseur_alu) plaque_interm();

    translate([0,0,hauteur_toit])
        linear_extrude(height=epaisseur_plexy) toit();

    translate([0,0,hauteur_bas]) {
    translate([+cote_octogone/2-cote_profile/2,
        +rayon_inscrit-cote_profile/2])
            profile_alu(hauteur_toit);
    translate([-cote_octogone/2+cote_profile/2,
        +rayon_inscrit-cote_profile/2])
            profile_alu(hauteur_toit);
    translate([+cote_octogone/2-cote_profile/2,
        -rayon_inscrit+cote_profile/2])
            profile_alu(hauteur_toit);
    translate([-cote_octogone/2+cote_profile/2,
        -rayon_inscrit+cote_profile/2])
            profile_alu(hauteur_toit);
    }
}

module profile_alu(hauteur) {
    translate([0,0,hauteur/2])
        cube([cote_profile,cote_profile,hauteur],center=true);
}


module plexy_tour() {
    #translate([-rayon_inscrit,-rayon_inscrit-epaisseur_plexy/2, hauteur_bas+epaisseur_alu])
        rotate([90,0,0])cote_plie();
    
    #mirror([0,1,0])
    translate([-rayon_inscrit,-rayon_inscrit-epaisseur_plexy/2, hauteur_bas+epaisseur_alu])
        rotate([90,0,0])cote_plie();
}

module empileur() {
    translate([-145,0,0])difference() {
        cylinder(d=empileur_d, h=empileur_h);
        cylinder(d=empileur_d_interieur, h=empileur_h);
        translate([-empileur_d/2,0,empileur_h/2])
            cube([empileur_d, 64, empileur_h], center=true);
    }
    translate([-145,-empileur_d/2-30.5/2+3,empileur_h*2/3]) difference() {
        cube([30.5,30.5,empileur_h/2], center=true);
        translate([0,3,0])
            cube([23,29,empileur_h/2], center=true);
    }
    translate([-145,0,hauteur_interm + epaisseur_alu])
        rotate([0,0,-90])
        support_empileur();
}
empileur();
structure();
plexy_tour();