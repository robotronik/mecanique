$fn=100;

module moteur_Brushless_EC_45_flat_30W_geared() {
     difference(){
	  union(){
	       color("gold")translate([0,0,0]) rotate([0,90,0]) cylinder(d=45,h=20);
	       translate([0.1,0,0]) rotate([0,90,0]) color("silver")cylinder(d=43,h=39.9);
	       translate([-1.7,0,-6.3]) rotate([0,90,0]) cylinder(d=21,h=1.7);
	       difference(){
		    translate([-25.5,0,-6.3]) rotate([0,90,0]) cylinder(d=8,h=25.5);
		    translate([-6.2/2-8.3,0,-6.3+3.75]) cube([6.2,5,0.5],center=true);
	       }
	       translate([28,-5,-25.5])cube([1,10,5]);

	  }
	  translate([-4,-10,-16.3]) rotate([0,90,0]) cylinder(d=4.5,h=10);
	  translate([-4,10,3.7]) rotate([0,90,0]) cylinder(d=4.5,h=10);
	  translate([-4,-10,3.7]) rotate([0,90,0]) cylinder(d=4.5,h=10);
	  translate([-4,10,-16.3]) rotate([0,90,0]) cylinder(d=4.5,h=10);
     }	
}

moteur_Brushless_EC_45_flat_30W_geared();
