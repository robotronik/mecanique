$fn=100;

rayon=33.5;
nb_dents=floor(rayon*3.1415*2/10);
echo(nb_dents);
module dent()
{
	cylinder(d=5,h=7);
	rotate([0,0,-24])
		translate([2.5,0,3.5])
			cube([5,5,7],center=true);
	rotate([0,0,24])
		translate([2.5,0,3.5])
			cube([5,5,7],center=true);
}

module roue_dentee()
{
	difference()
	{
		cylinder(r=rayon,h=7);
		for (i=[0:360/nb_dents:360])
		{
			rotate([0,0,i])
				translate([rayon-2.5,0,0])
					dent();
		}
	}
}

module roue_pleine() 
{
	roue_dentee();
	cylinder(r=rayon-17, h=22);
	//translate([0,0,22]) cylinder(d=11,h=6);
}

module arbre_moteur() 
{
	translate([0,0,7]) cylinder(d=10.3,h=21);
	translate([0,0,18.5]) rotate([90,0,180]) cylinder(d=4, h=rayon);
	#cylinder(d=3.5,h=8);
}

difference()
{
	roue_pleine();
	translate([8.5,9,0])rotate([0,0,90]) #cube([3,17,21]); //vis
	arbre_moteur();
	
}