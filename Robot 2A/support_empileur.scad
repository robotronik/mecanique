$fn=50;
dia_ext=140+30;
dia_int=80.5;
cote_carre=30.5;
epaisseur=5;
hauteur_colonne=40;
dia_trou_vis=5.5;
hauteur_trou=hauteur_colonne/2+epaisseur;

module plat()
{
difference()
{
		circle(d=dia_ext);
		circle(d=dia_int);
		translate([sqrt(pow(dia_int/2,2)-pow(cote_carre/2,2))+cote_carre/2,0,0])
			square([cote_carre,cote_carre],center=true);
	}
}

module colonne()
{
	difference()
	{
		union()
		{
			circle(d=dia_int+epaisseur*2);
			translate([sqrt(pow(dia_int/2,2)-pow(cote_carre/2,2))+cote_carre/2,0,0])
				square([cote_carre+epaisseur*2,cote_carre+epaisseur*2],center=true);
		}
		circle(d=dia_int);
		translate([sqrt(pow(dia_int/2,2)-pow(cote_carre/2,2))+cote_carre/2,0,0])
			square([cote_carre,cote_carre],center=true);
	}	
}

module triangle()
{
	intersection()
	{
		translate([0,dia_ext/4,(hauteur_colonne+epaisseur)/2])
			cube([epaisseur,dia_ext/2,hauteur_colonne+epaisseur],center=true);

		rotate_extrude(convexity=10)
			polygon([[dia_int/2+epaisseur,0],[dia_int/2+epaisseur,hauteur_colonne+epaisseur],[dia_ext/2+epaisseur,0]]);
	}
}

module trou()
{
	translate([0,0,hauteur_trou])
		rotate([-90,0,0])
			cylinder(epaisseur+2,d=dia_trou_vis);
}
module trou_plaque()
{
	translate([0,(dia_int+dia_ext)/4,-1])
		cylinder(epaisseur+2,d=dia_trou_vis);
}

module zone_robot()
{
	linear_extrude(hauteur_colonne+10)
	translate([0,sqrt(pow(140/sin(45/2)/2,2)-pow(140/2,2))+15-39,0])
		rotate([0,0,45/2])
			circle(d=140/sin(45/2),$fn=8);
}

module zone_ouverture()
{
	intersection()
	{
		translate([0,-dia_int/2-epaisseur-cote_carre/2,0])
			square([2*sqrt(pow(dia_int/2,2)-pow(cote_carre/2,2))+0.2,dia_int+epaisseur*2],center=true);
		circle(d=140);
	}
}

module zone_libre()
{
	translate([0,+15-39,-0.1])
		linear_extrude(hauteur_colonne+10.2)
			circle(d=140);
}

module plaque_elec()
{
	translate([0,sqrt(pow(140/sin(45/2)/2,2)-pow(140/2,2))+15-39-70+3/2,(hauteur_colonne+50)/2])
		cube([140+2*sqrt(pow(140,2)/2),3,hauteur_colonne+50],center=true);
}

module zone_plaque_elec()
{
	translate([0,sqrt(pow(140/sin(45/2)/2,2)-pow(140/2,2))+15-39-70+140,(hauteur_colonne+50)/2-0.1])
		cube([140+2*sqrt(pow(140,2)/2)+0.2,280,hauteur_colonne+50+0.2],center=true);
}

//base du support
module base()
{
	difference()
	{
		union()
		{
			linear_extrude(epaisseur)
				plat();
			translate([0,0,epaisseur])
				linear_extrude(hauteur_colonne)
					colonne();
		}
		translate([0,0,-1])
			linear_extrude(hauteur_colonne+epaisseur+2)
				zone_ouverture();
	}
}

//construction du support
intersection()
{
	union()
	{
		//trous
		difference()
		{
			base();
			for (i=[-45,0,45])
			{
				rotate([0,0,i])
					translate([0,dia_int/2-1,abs(i/45)*20-10])	
						trou();
			}
			translate([sqrt(pow(dia_int/2,2)-pow(cote_carre/2,2))+cote_carre/2,cote_carre/2-1,0])
					trou();
			translate([sqrt(pow(dia_int/2,2)-pow(cote_carre/2,2))+cote_carre/2,-cote_carre/2-epaisseur-1,0])
					trou();
			for (i=[-55,0,65])
			{
				rotate([0,0,i])
						trou_plaque();
			}
		}
		//renforts
		for (i=[-30,30,90])
		{
			rotate([0,0,i])
				triangle();
		}
	}
	difference()
	{
		zone_robot();
		translate([0,-0.5,0])
			zone_plaque_elec();
	}
}

//zone accecible pour mettre le support
#difference()
{
	//zone_robot();
	//zone_libre();
	//zone_plaque_elec();
}

//zone_plaque_elec();
//zone_ouverture();
//trou_plaque();