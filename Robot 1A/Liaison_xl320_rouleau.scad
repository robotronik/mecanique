$fn=100;
longueur_servo = 24;
largeur_servo = 21; // 24 en comptant les elements qui depassent
hauteur_servo = 36;
diametre_vis = 4;
diametre_rotor = 18;
longueur_rotor = 3;
D=8;
L=15;

module liaison_moteur_sys_parasol(){

 color("dimgray") translate([-1.5, 26, 10.5]) rotate([0, 90, 0])
	difference(){
    union(){
        cylinder(h=3.1, d = 20, center = true);
        for(i = [0:1]){
            //translate([6*cos(i*90), 6*sin(i*90), 0]) cylinder(h=3.2, d=1, center=true);
            translate([6*cos(2*i*90), 6*sin(2*i*90), -3]) cylinder(h=3.2, d=3.5, center=true);
        }
	}
        cylinder(h=3.2, d=3, center=true);

    }

/*translate([0,26,10.5])difference() {
		rotate([0,90,0])cylinder(h=L,d=D);
		translate([-1,0,0])rotate([0,90,0])cylinder(d=(D-1.5), h=L+2);

	}
	translate([L,26,10.5])rotate([0,90,0])difference(){
		translate([0,0,0])cylinder(h=5,r1=D/2,r2=4.8/2);
		translate([0,0,0])cylinder(d=3,h=10);
	}*/
	
}

liaison_moteur_sys_parasol();