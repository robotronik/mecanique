$fn=60;
roulement_diamext = 16.1;
roulement_diamint =  6;
roulement_epaisseur= 5;

plaque_diamint    = 17.9;
plaque_epaisseur  =  3;


module roulement() {
    rotate([0,90,0])
    cylinder(d=roulement_diamext, 
             h=roulement_epaisseur);
}
module plaque() {
    difference(){
        translate([0.01,-15,-15])
        cube([plaque_epaisseur,30,30]);

        rotate([0,90,0])
        cylinder(d=plaque_diamint, 
                 h=plaque_epaisseur+0.1);
    }
}

module support() {
    difference() {
        union() {
            rotate([0,90,0])
            cylinder(d=plaque_diamint, 
                     h=roulement_epaisseur+0.99);
            translate([plaque_epaisseur+0.5,0,0])
            rotate([0,90,0])
            cylinder(d=plaque_diamint+1, 
                     h=1);
        }

        translate([1,0,0])
        roulement();
        translate([-0.01,0,0])
        rotate([0,90,0])
        cylinder(d=roulement_diamext-1, 
                 h=1.1);
    }
}



support();
/*
#plaque();
translate([1,0,0])
#roulement();
*/
