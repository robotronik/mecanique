$fn=100;

diametre=80;
epaisseur=4;
hauteur=10;
dia_ext=10;
<<<<<<< HEAD
dia_trou=5.5;
=======
dia_trou=5;
>>>>>>> 42574bfbf3e790ee8b8e5ee4f4467d2a9eac35c1
dia_trou_vis=5;

difference()
{
	cylinder(d=diametre+epaisseur*2,h=hauteur);
	translate([0,0,-0.1]) cylinder(d=diametre,h=hauteur+0.2);
	translate([-45,-90,-0.1]) cube([90,90,hauteur+0.2]);
	translate([-90,-0.1,-0.1]) cube([90,90,hauteur+0.2]);
	rotate([0,0,-20]) translate([-90,0,-0.1]) cube([90,90,hauteur+0.2]);
	translate([diametre/2+dia_ext/2,0,-0.1]) cylinder(d=dia_trou,h=hauteur+0.2);
	for (i=[1,2])
	{
		rotate([0,0,i*70/3])
			translate([diametre/2-0.5,0,hauteur/2])
				rotate([0,90,0])
					cylinder(d=dia_trou_vis,h=epaisseur+1);
	}
}

difference()
{
	translate([diametre/2+dia_ext/2,0,0]) cylinder(d=dia_ext,h=hauteur);
	translate([diametre/2+dia_ext/2,0,-0.1]) cylinder(d=dia_trou,h=hauteur+0.2);
}
	