$fn=100;
tr = 30;
module base()
{
color ("blue") cube([200,150,5]);
}
module moteur ()
{
    #translate ([3+tr,114,5]) rotate ([90,0,
    0]) cube([40,55,111.5]);
    
    #translate ([157-tr,114,5]) rotate ([90,0,0]) cube([40,55,111.5]);
    #translate ([-17+tr,23,25]) rotate([0,90,0]) cylinder(d=7, h=80);
   #translate ([137-tr,23,25]) rotate([0,90,0]) cylinder(d=7, h=80); 
}

module roues()
{
    translate([-22+tr,23,25]) rotate([0,90,0])cylinder(d=72,h=20);
    translate([+204-tr,23,25]) rotate([0,90,0]) cylinder(d=72,h=20);
       
}
union()
{
    base();
    moteur();
    moteur();
    roues();
}