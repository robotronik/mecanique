$fn=100;

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
		cylinder(d=64.6,h=7);
		for (i=[0:360/20:360])
		{
			rotate([0,0,i])
				translate([32.3-2.5,0,0])
					dent();
		}
	}
}

module roue_pleine() 
{
	roue_dentee();
	cylinder(d=45, h=22);
}

module arbre_moteur() 
{
	translate([0,0,7]) cylinder(d=9,h=15);
	translate([0,0,17]) rotate([90,0,180]) cylinder(d=3, h=23);
	#cylinder(d=3.5,h=8);
}
	
difference()
{
	roue_pleine();
	translate([8.5,9,0])rotate([0,0,90]) #cube([3,17,21]); //vis
	arbre_moteur();
	
}
