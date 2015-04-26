$fn=50;
carre_haut=17*sqrt(2);
carre_bas=35;
hauteur=12-3-3; //longueur capteur-epaisseur plaque-long_vis
epaisseur_haut=3;
epaisseur_bas=5;
long_vis=3;
dia_vis=5;
dia_trou_vis=2;
ecart_vis=21.7;
ecart_fixation=35;
dia_fixation=6;
dia_trou_fixation=4;
epaisseur_fixation=2;

module emplacement_vis()
{
    translate([ecart_vis/2,0,hauteur])
    {
        difference()
        {
            cylinder(d=dia_vis,h=long_vis);
            cylinder(d=dia_trou_vis,h=long_vis);
        }
    }
    translate([-ecart_vis/2,0,hauteur])
    {
        difference()
        {
            cylinder(d=dia_vis,h=long_vis);
            cylinder(d=dia_trou_vis,h=long_vis);
        }
    }

}

module gen_emplacement_vis()
{
    translate([ecart_vis/2,0,hauteur/2-long_vis])
            circle(d=dia_vis);
    translate([-ecart_vis/2,0,hauteur/2-long_vis])
            circle(d=dia_vis);
}

module gen_support()
{
        difference()
        {
            square([(carre_bas+2*epaisseur_bas)/sqrt(2),(carre_bas+2*epaisseur_bas)/sqrt(2)],center=true);
            square([carre_bas/sqrt(2),carre_bas/sqrt(2)],center=true);
        }
        
}
module support()
{
    linear_extrude(height=hauteur,scale=carre_haut/carre_bas)
        gen_support();
    translate([0,0,hauteur])
    mirror([0,0,1])
        linear_extrude(height=hauteur,scale=carre_bas/carre_haut)
            rotate([0,0,45]) gen_emplacement_vis();
}

module base_fixation()
{
    difference()
    {
        union()
        {
            cylinder(d=dia_fixation,h=epaisseur_fixation);
            translate([-dia_fixation/2,0,0])
                cube([dia_fixation,dia_fixation-2,epaisseur_fixation]);
        }
        cylinder(d=dia_trou_fixation,h=epaisseur_fixation);
    }
}

module fixation()
{
    translate([0,ecart_fixation/2,0])
        mirror([0,1,0]) base_fixation();
    translate([0,-ecart_fixation/2,0])
        base_fixation();
}

//cylinder(d=15,h=100,center=true);

support();
rotate([0,0,45]) emplacement_vis();
fixation();