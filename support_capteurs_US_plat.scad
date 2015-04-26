$fn=50;
larg=10;
long=20;
ep=3;
espace_trous=14;
dia_trous=3;

difference()
{
    cube([long,larg,ep],center=true);
    translate([espace_trous/2,0,0])
        cylinder(d=dia_trous,h=ep+0.2,center=true);
    translate([-espace_trous/2,0,0])
        cylinder(d=dia_trous,h=ep+0.2,center=true);
}
