$fn=50;
largeur=20;
larg_base=10;
hauteur=25;
dist_trous=10;
dia_trous=3;
long_trous=15;
epaisseur=3;

module renfort()
{
    translate([0,epaisseur/2,0])
        rotate([90,0,0])
            linear_extrude(epaisseur)
                polygon([[0,0],[5,0],[0,5]]);
}

module trou()
{
    translate([0,0,-0.1])
        cylinder(d=dia_trous,h=epaisseur+0.2);
}

module trou_oblong(dia,long,ep)
{
    translate([dia/2,0,-0.1])
    union()
    {
        cylinder(d=dia,h=ep+0.2);
        translate([0,-dia/2,0])
            cube([long-dia,dia,ep+0.2]);
        translate([long-dia,0,0])
            cylinder(d=dia,h=ep+0.2);
    }
}

module base_support()
{
    cube([epaisseur,largeur,hauteur]);
    cube([larg_base,largeur,epaisseur]);
    translate([epaisseur,largeur/2,epaisseur])
        renfort();
}

module support_complet()
{
    difference()
    {
        base_support();
        //trou oblong 1
        translate([0,largeur/4,(hauteur-long_trous)/2])
            rotate([0,-90,0])
                translate([0,0,-epaisseur])
                    trou_oblong(dia_trous,long_trous,epaisseur);
        //trou oblong 2
        translate([0,3*largeur/4,(hauteur-long_trous)/2])
            rotate([0,-90,0])
                translate([0,0,-epaisseur])
                    trou_oblong(dia_trous,long_trous,epaisseur);
        //trou base 1
        translate([larg_base/2+epaisseur/2,largeur/4,0])
            trou();
        //trou base 2
        translate([larg_base/2+epaisseur/2,3*largeur/4,0])
            trou();  
            
    }
}

support_complet();