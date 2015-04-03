dia_couronne=150;
hauteur_couronne=50;
epaisseur=4;
largeur_base=30;
longueur=70;
dia_trous=5;
angle_trous=12;

module rond()
{
	difference()
	{
		cylinder(d=dia_couronne+2*epaisseur,h=hauteur_couronne);
		cylinder(d=dia_couronne,h=hauteur_couronne);
	}
}

module base()
{
	difference()
	{
		cylinder(d=dia_couronne+2*epaisseur+2*largeur_base,h=epaisseur);
		cylinder(d=dia_couronne+2*epaisseur,h=hauteur_couronne);
	}
}

module renfort(angle)
{
	rotate([0,0,angle])
		translate([dia_couronne/2+epaisseur,epaisseur/2,epaisseur])
			rotate([90,0,0])
				linear_extrude(epaisseur)
					polygon([[0,0],[largeur_base,0],[0,hauteur_couronne-epaisseur]]);
}

module support()
{
	difference()
	{
		union()
		{
			rond();
			base();
			renfort(0);
		}
		translate([0,-longueur/2-(dia_couronne/2+largeur_base+epaisseur+0.2)/2,0])
			cube([dia_couronne+2*largeur_base+2*epaisseur+0.2,dia_couronne/2+largeur_base+epaisseur+0.2,2*hauteur_couronne+0.2],center=true);
	translate([0,+longueur/2+(dia_couronne/2+largeur_base+epaisseur+0.2)/2,0])
			cube([dia_couronne+2*largeur_base+2*epaisseur+0.2,dia_couronne/2+largeur_base+epaisseur+0.2,2*hauteur_couronne+0.2],center=true);
	translate([-(dia_couronne/2+largeur_base+epaisseur)/2-0.1,0,0])
			cube([dia_couronne/2+largeur_base+epaisseur+0.2,longueur+0.2,2*hauteur_couronne+0.2],center=true);
	}
}

module trous()
{
	//sur la couronne
	rotate([0,0,angle_trous])
		translate([0,0,hauteur_couronne/2])
			rotate([0,90,0])
				cylinder(d=dia_trous,h=dia_couronne);
	rotate([0,0,-angle_trous])
		translate([0,0,hauteur_couronne/2])
			rotate([0,90,0])
				cylinder(d=dia_trous,h=dia_couronne);
	//sur la base
	rotate([0,0,angle_trous])
		translate([dia_couronne/2+epaisseur+largeur_base/2,0,-0.1])
			cylinder(d=dia_trous,h=epaisseur+0.2);
	rotate([0,0,-angle_trous])
		translate([dia_couronne/2+epaisseur+largeur_base/2,0,-0.1])
			cylinder(d=dia_trous,h=epaisseur+0.2);
	
}

difference()
{
	support();
	trous();
}