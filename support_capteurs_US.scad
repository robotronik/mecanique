$fn=50;
largeur=23;
profondeur=17.5;
epaisseur=2;
longueur_haut=20;
dia_trou_capteur=3+0.5;
ecart_bord_trou=3;
dia_trou_haut=5;

module base()
{
    difference()
    {
        cube([largeur+2*epaisseur,longueur_haut+epaisseur,profondeur+epaisseur]);
        //évidement du centre
        translate([epaisseur,epaisseur,-epaisseur])
            cube([largeur,longueur_haut+epaisseur,profondeur+epaisseur]);
        //renforts sur le coté
        translate([-0.1,epaisseur,0])
            rotate([-atan(longueur_haut/profondeur),0,0])
                cube([largeur+2*epaisseur+0.2,longueur_haut+epaisseur,norm([profondeur,longueur_haut])]);
    }
}

module trous_capteurs()
{
    //bas
    translate([largeur+epaisseur-ecart_bord_trou,0,1])
    rotate([-90,0,0])
        translate([0,0,-0.1])
            cylinder(d=dia_trou_capteur,h=epaisseur+0.2);
    //haut
    translate([epaisseur+ecart_bord_trou,0,profondeur-ecart_bord_trou])
    rotate([-90,0,0])
        translate([0,0,-0.1])
            cylinder(d=dia_trou_capteur,h=epaisseur+0.2);
}

module trous_haut()
{
    translate([epaisseur+largeur/5,(longueur_haut+epaisseur)/2,profondeur-0.1])
        cylinder(d=dia_trou_haut,h=epaisseur+0.2);
    translate([epaisseur+largeur*4/5,(longueur_haut+epaisseur)/2,profondeur-0.1])
        cylinder(d=dia_trou_haut,h=epaisseur+0.2);
}

rotate([90,0,0])
difference()
{
    base();
    trous_capteurs();
    trous_haut();
}
