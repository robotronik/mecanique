$fn=100;

diametre=80;
epaisseur=4;
hauteur=10;
dia_ext=10;
dia_trou=5.5;
dia_trou_vis=5;
//bras porte
longueur_bras=30;
largeur_bras=7;
long_trou_bras=4;
larg_trou_bras=4;
angle_bras=-0;
//bras servo
longueur_bras_servo=50;
largeur_bras_servo=7;
long_trou_bras_servo=4;
larg_trou_bras_servo=4;
dia_vis=2;
dia_milieu=4;
pos_milieu=40;
ecart_vis=10;

module ele_bras(long,larg,haut)
{
	translate([0,-larg/2,0])
		cube([long-larg,larg,haut]);
	translate([long-larg,0,0])
		cylinder(d=larg,h=haut);
		cylinder(d=larg,h=haut);
}

module bras()
{
	difference()
	{
		ele_bras(longueur_bras,largeur_bras,hauteur);
		translate([0,0,-0.1]) ele_bras(long_trou_bras,larg_trou_bras,hauteur+0.2);
	}
}

module extrusion_bras()
{
	translate([0,0,hauteur/2])
		cube([longueur_bras-epaisseur_bras,epaisseur_bras,hauteur],center=true);
	translate([(longueur_bras-epaisseur_bras)/2,0,0])
		cylinder(d=epaisseur_bras,h=hauteur);
	translate([-(longueur_bras-epaisseur_bras)/2,0,0])
		cylinder(d=epaisseur_bras,h=hauteur);
}

module attache()
{
	difference()
	{
		cylinder(d=diametre+epaisseur*2,h=hauteur);
		translate([0,0,-0.1]) cylinder(d=diametre,h=hauteur+0.2);
		translate([-45,-90,-0.1]) cube([90,90,hauteur+0.2]);
		translate([-90,-0.1,-0.1]) cube([90,90,hauteur+0.2]);
		rotate([0,0,-20]) translate([-90,0,-0.1]) cube([90,90,hauteur+0.2]);
		for (i=[1,2])
		{
			rotate([0,0,i*70/3])
				translate([diametre/2-0.5,0,hauteur/2])
					rotate([0,90,0])
						cylinder(d=dia_trou_vis,h=epaisseur+1);
		}
	}
}

module renfort()
{
	difference()
	{	
		cube([10,10,hauteur]);
		translate([10,10,-0.1])
			cylinder(d=15,h=hauteur+0.2);
	}
}

module rotate_bras(angle)
{
	translate([longueur_bras-2*larg_trou_bras,0,0])
		rotate(angle,v=[0,0,1])
			translate([-longueur_bras+2*larg_trou_bras,0,0])
				child();
}

module partie_porte()
{
	difference()
	{
		union()
		{
			attache();
			translate([longueur_bras-largeur_bras/2+diametre/2,0,0])
				rotate([0,0,180])
					rotate_bras(angle_bras)
						bras();
			//translate([diametre/2,1,0])
				//renfort();

			translate([diametre/2+dia_ext/2,0,0]) cylinder(d=dia_ext,h=hauteur);
		}
		translate([diametre/2+dia_ext/2,0,-0.1]) cylinder(d=dia_trou,h=hauteur+0.2);
}
}

module trous_servo()
{
	translate([0,0,-0.1]) cylinder(d=dia_milieu,h=hauteur+0.2);
	translate([ecart_vis/2,0,-0.1]) cylinder(d=dia_vis,h=hauteur+0.2);
	translate([-ecart_vis/2,0,-0.1]) cylinder(d=dia_vis,h=hauteur+0.2);	
}

module partie_servo()
{
 	difference()
	{
		ele_bras(longueur_bras_servo,largeur_bras_servo,hauteur);
		translate([0,0,-0.1]) ele_bras(long_trou_bras_servo,larg_trou_bras_servo,hauteur+0.2);
		translate([pos_milieu-largeur_bras_servo/2,0,0])
			trous_servo();
	}
}

rotate([0,0,90])
	partie_porte();
partie_servo();