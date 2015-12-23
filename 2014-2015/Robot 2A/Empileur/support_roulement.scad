$fn=30;
hauteur_roulement=9-4+0.5;
longueur_axe=22-2*2;

module support()
{
    translate([0,2,2-0.1])
        cube([5,longueur_axe,3]);
    difference()
    {
        cube([14,longueur_axe+20,2.5]);
        union()
        {
            
            translate([10,21,-0.1]) cylinder(d=3,h=3.2);
            translate([4,34,-0.1]) cylinder(d=3,h=3.2);
            translate([10,34,-0.1]) cylinder(d=3,h=3.2);
        }
    }

}

module cylindre_h(diametre,longueur)
{
    translate([2.5,2,hauteur_roulement])
    rotate([-90,0,0])
        cylinder(d=diametre,h=longueur);
}

difference()
{
    union()
    {
        support();
        cylindre_h(3+2,longueur_axe);
    }
    cylindre_h(3.1,longueur_axe);
    translate([0,longueur_axe/2-2,0]) cylindre_h(9,4);
}
