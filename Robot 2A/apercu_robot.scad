perimetre=1200;
long_cote=140;
epaisseur=3;
hauteur_robot=320;
//base bas
rayon_evidee=70;
entraxe_roues=180;
entraxe_roues_cod=230;
larg_roues=25;
long_roues=50;
larg_roues_cod=7;
long_roues_cod=40;
//base interm
hauteur_interm=160;
//base haut
cote_trou=40;
dia_trou=2;
//tourelle
dia_barre=2;
cote_tour=60;
hauteur_max=420;
epaisseur_plaque=3;


module base_hexagonale(cote)
{
	nbr_cote=8;
	rayon=cote/2/sin(360/2/nbr_cote);
	rotate([0,0,-7.5]) circle(r=rayon,$fn=nbr_cote);
}

module base_evidee(cote,rayon_evidee)
{
	difference()
	{
		rotate(30) base_hexagonale(cote);
		translate([(cote/2/sin(360/2/8)),0,0]) circle(rayon_evidee);
		//translate([-cote,0,0]) circle(rayon_evidee);
	}
}

module base_bas(cote,rayon_evidee)
{
	difference()
	{
		rotate(30) base_hexagonale(cote,rayon_evidee);
		translate([0,entraxe_roues/2,0]) square([long_roues,larg_roues],center=true);
		translate([0,-entraxe_roues/2,0]) square([long_roues,larg_roues],center=true);
		translate([0,entraxe_roues_cod/2,0]) square([long_roues_cod,larg_roues_cod],center=true);
		translate([0,-entraxe_roues_cod/2,0]) square([long_roues_cod,larg_roues_cod],center=true);
		//passage pieds
		translate([-130,0,0]) rotate([0,0,45]) square([160,160],center=true);
		translate([0,-20,0]) rotate([0,0,5]) square([220,20],center=true);
		translate([20,20,0]) rotate([0,0,-5]) square([220,20],center=true);
		translate([20,00,0]) rotate([0,0,0]) square([220,40],center=true);
		translate([210,0,0]) rotate([0,0,45]) square([160,160],center=true);
	}
}

module base_interm(cote,rayon_evidee)
{
	difference()
	{
		base_evidee(cote,rayon_evidee);
	}
}

module base_haut(cote,dia_trou,cote_trou)
{
	difference()
	{
		rotate(30) base_hexagonale(cote);
		translate([cote_trou/2,cote_trou/2,0]) circle(dia_trou);
		translate([-cote_trou/2,cote_trou/2,0]) circle(dia_trou);
		translate([cote_trou/2,-cote_trou/2,0]) circle(dia_trou);
		translate([-cote_trou/2,-cote_trou/2,0]) circle(dia_trou);
	}
}

module tourelle(dia_barre,cote_trou,cote_tour,hauteur,epaisseur_plaque)
{
		translate([cote_trou/2,cote_trou/2,0])
			cylinder(d1=dia_barre,d2=dia_barre,h=hauteur);
		translate([-cote_trou/2,cote_trou/2,0])
			cylinder(d1=dia_barre,d2=dia_barre,h=hauteur);
		translate([cote_trou/2,-cote_trou/2,0])
			cylinder(d1=dia_barre,d2=dia_barre,h=hauteur);
		translate([-cote_trou/2,-cote_trou/2,0])
			cylinder(d1=dia_barre,d2=dia_barre,h=hauteur);
		translate([0,0,hauteur-epaisseur_plaque])
			linear_extrude(epaisseur_plaque)
				square(cote_tour,center=true);
}

module empileur()
{
	difference()
	{
		translate([0,0,(hauteur_robot)/2]) cylinder(h = hauteur_robot, r=75/2, center=true);
		translate([0,0,(hauteur_robot)/2]) cylinder(h = hauteur_robot, r=75/2-3, center=true);
		translate([-30,0,70/2])cube([50,50,70],center=true);
		translate([20,0,(hauteur_robot)/2])cube([80,5,hauteur_robot],center=true);
	}
		translate([18,30,(hauteur_robot)/2]) cylinder(h = hauteur_robot, r=5, center=true);
		translate([18,-30,(hauteur_robot)/2]) cylinder(h = hauteur_robot, r=5, center=true);
}

module bras()
{
	cube([45,25,20],center=true);
	rotate([-20,0,0])
		bras_part();
}

module bras_part()
{
	translate([0,-25/2,-50]) cube([10,5,100],center=true);
	translate([-30,-25/2,-95]) cube([60,5,10],center=true);
}

cote=perimetre/8;
//bas
linear_extrude(epaisseur) base_bas(long_cote,rayon_evidee);

//interm
translate([0,0,hauteur_interm])
	linear_extrude(epaisseur)
		base_interm(long_cote,rayon_evidee);

//haut
translate([0,0,hauteur_robot])
	linear_extrude(epaisseur)
		base_haut(long_cote,dia_trou,cote_trou);
translate([0,0,hauteur_robot])

//tourelle
	tourelle(dia_barre,cote_trou,cote_tour,hauteur_max-hauteur_robot,epaisseur_plaque);

//roues motrices
long_roues=50;
larg_roues_cod=7;
translate([0,-entraxe_roues/2,20])rotate([90,0,0]) cylinder(h = larg_roues-7, r=30, center=true);
translate([0,entraxe_roues/2,20])rotate([90,0,0]) cylinder(h = larg_roues-7, r=30, center=true);

//roues codeuses
translate([0,-entraxe_roues_cod/2,10])rotate([90,0,0]) cylinder(h = larg_roues_cod-3, r=20, center=true);
translate([0,entraxe_roues_cod/2,10])rotate([90,0,0]) cylinder(h = larg_roues_cod-3, r=20, center=true);

//barres
//grandes
translate([65,-163,hauteur_robot/2])cube([10,10,hauteur_robot],center=true);
translate([-65,-163,hauteur_robot/2])cube([10,10,hauteur_robot],center=true);
translate([65,163,hauteur_robot/2])cube([10,10,hauteur_robot],center=true);
translate([-65,163,hauteur_robot/2])cube([10,10,hauteur_robot],center=true);
//petites
translate([135,57,hauteur_interm/2])rotate([0,0,45])cube([10,10,hauteur_interm],center=true);
translate([135,-57,hauteur_interm/2])rotate([0,0,45])cube([10,10,hauteur_interm],center=true);

//empileur
translate([150,0,0]) empileur();

//bras
translate([0,-155,hauteur_interm-10]) bras();
mirror([0,1,0]) translate([0,-155,hauteur_interm-10]) bras();


