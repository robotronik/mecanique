$fn=30;
c_ep=2.39;
c_lo=39.29;
c_la=32.75;
c_h=9.64;
c_lang=5.56;
cy_r=3.20;
cy_h=20.51;
b_lo=26;
b_la=8.90;
b_h=11.45;
h_diag=20.76;

module bas()
{
	difference()
	{
		cube([c_la,c_lo,c_h]);
		union()
		{
			translate([c_ep,c_ep,c_ep]) cube([c_la-1*c_ep+1,c_lo-2*c_ep,c_h-2*c_ep]);
			translate([c_lang,c_lang,0]) cube([c_la-c_lang+1,c_lo-2*c_lang,c_ep+1]);
		}
	}
}

module haut()
{
	translate ([b_lo/2-1.25-cy_r,0,b_h/2])cube([b_lo,b_la,b_h],center=true);
	translate([0,0,b_h-1]) cylinder(h=cy_h+1,r=cy_r,center=false);
}

difference()
{
union()
{
translate([c_la-2.42,c_lo,b_lo+1.2]) rotate([115-90,0,180]) rotate([0,90,0]) haut();
bas();
}
translate([c_ep,c_ep,c_ep]) cube([c_la-1*c_ep+1,c_lo-2*c_ep,c_h-2*c_ep]);
}
