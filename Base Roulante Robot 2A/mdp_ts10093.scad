use <../Modèles/ISOThread.scad>
$fn=50;

L_corps = 97.6;
d_corps = 32;

L_supp_rotor= 3;
d_supp_rotor = 20;

L_rotor = 20.35;
d_rotor = 6;

L_supp_arr = 1.8;
d_supp_arr = 13;

L_rotor_arr = 19.3;
d_rotor_arr = 4;

module arrondi(hauteur, profondeur, sens, diam, H){
    translate([0, 0, H-sens*hauteur])
        rotate_extrude()
        translate([diam/2-profondeur, 0, 0]) 
        rotate([-180*(sens-1)/2, 0, 0]) 
        polygon(points=[[profondeur+0.1, hauteur+0.1], [profondeur, 0], [0, hauteur]]);
}


module corps(){
    cylinder(L_corps, d=d_corps, center=true);

    translate([0, 0, L_corps/2]) cylinder(L_supp_rotor, d=d_supp_rotor);
    translate([0, 0, L_corps/2]) cylinder(L_rotor, d=d_rotor);

    translate([0, 0, -L_corps/2-L_supp_arr])  cylinder(L_supp_arr, d=d_supp_arr);
    translate([0, 0, -L_corps/2-L_rotor_arr]) cylinder(L_rotor_arr, d=d_rotor_arr);
}

module plot() {
    difference() {
        union() {
            cylinder(3.1, d=4);
            translate([0, -2, 0]) cube([2, 4, 3.1]);
        }
        difference(){
            cylinder(1, d=2.5); 
            arrondi(0.1, 0.3, 1, 2.5, 1);
        }
    }
}


module vis   (longueur,   diametre) {
    cylinder (longueur, d=diametre);
    //thread_out(diametre,   longueur);
}
module mdp_ts10093_vis() {
    for(i = [0 : 3]){
        rotate([0,0,90*i]) {
            translate([13  , 0,  L_corps/2]) vis(6, 3);
        }
    }
    
    for(i = [0 : 1]){
        rotate([0,0,i*180+22.5]) {
            translate([12.7, 0, -L_corps/2]) vis(4, 1.6);
        }
    }
}


module cosse(){
    translate([0, 0, -0.5])
    linear_extrude(height=1, convexity=2) difference(){
        polygon(points=[[-7,-2], [-7, 2], [6, 2],
                        [ 7, 1], [ 7,-1], [6,-2]]);
        translate([5, 0]) circle(d=2);
    }
}
module mdp_ts10093_cosses() {
    for(i = [0 : 1]){
        rotate([0,0,i*180+67.5])
            translate([12.7, 0, -L_corps/2-7]) rotate([0,90,0]) cosse();
    }
}


module mdp_ts10093(){
    difference(){
        corps();

        arrondi(0.5, 0.5, 1, d_corps, L_corps/2);
        arrondi(0.3, 0.3, 1, d_supp_rotor, L_corps/2+L_supp_rotor);
        arrondi(0.3, 0.3, 1, d_rotor, L_corps/2+L_rotor);
        
        arrondi(0.3, 0.3, -1, d_supp_arr, -L_corps/2-L_supp_arr);
        arrondi(0.3, 0.3, -1, d_rotor_arr, -L_corps/2-L_rotor_arr);

        for(i = [0 : 3]){
            rotate([0,0,90*i+45]) {
                translate([14,0,L_corps/2-3])plot();
            }
        }
    }

    mdp_ts10093_vis();
    mdp_ts10093_cosses();
}
