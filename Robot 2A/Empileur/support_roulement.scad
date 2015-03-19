$fn=20;

module support()
{
    difference()
    {
        cube([14,14,2]);
        union()
        {
            translate([9,4,0]) cylinder(d=3,h=2);
            translate([9,4+6,0]) cylinder(d=3,h=2);
        }
    }
}

module cylindre_h(diametre,longueur)
{
    translate([0,0,2.5])
    rotate([-90,0,0])
        cylinder(d=diametre,h=longueur);
}

difference()
{
    union()
    {
        support();
        cylindre_h(3+2,14);
    }
    cylindre_h(3,14);
}
