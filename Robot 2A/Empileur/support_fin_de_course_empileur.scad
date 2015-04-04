$fn=50;
dia_PVC=81;
dia_trous=3;
larg=15;
long=25;
long_switch=21;
larg_switch=7;
prof_switch=10;
dist_trous=10;

module PVC()
{
  translate([-dia_PVC/2,0,0])
    //difference()
    //{
        cylinder(d=dia_PVC,h=long);
        //translate([-0.1,0,-0.1])
            //cylinder(d=dia_PVC-0.2,h=long+0.2);
    //}
}

module base()
{
    difference()
    {
        PVC();
        translate([-dia_PVC,larg/2,-0.1])
            cube([dia_PVC,dia_PVC/2,long+0.2]);
        translate([-dia_PVC,-dia_PVC/2-larg/2,-0.1])
            cube([dia_PVC,dia_PVC/2,long+0.2]);
        translate([-dia_PVC-10,-dia_PVC/4,-0.1])
            cube([dia_PVC,dia_PVC/2,long+0.2]);
    }  
}

module switch()
{
    translate([0,-larg_switch/2,long-long_switch])
        cube([prof_switch,larg_switch,long_switch]);
}

module support_base()
{
    difference()
    {
        hull()
        {
                base();
                translate([0,-larg_switch/2,0])
                    cube([prof_switch,larg_switch,long]);
        }
        translate([0,0,-0.1])
            scale([1,1,1.2])
                PVC();
    }
}

module trous()
{
    translate([7,0,5+long-long_switch])
    rotate([90,0,0])
        union()
        {
            cylinder(d=dia_trous,h=larg,center=true);
            translate([0,dist_trous,0])
                cylinder(d=dia_trous,h=larg,center=true);
        }
}

module support_complet()
{
    difference()
    {
        support_base();
        translate([-4,0,0])
        union()
        {
            scale([2,1,1.1])
                switch();
            trous();
        }
    }
}

support_complet();