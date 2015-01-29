$fn=50;
long_tot=15;
diam=5;
ep_bord=2;
h_bord=2;
pos_mep=3;

cylinder(h=long_tot,r=diam/2);
translate([0,0,pos_mep]) cylinder(h=h_bord,r=diam/2+ep_bord);
//translate([0,0,pos_mep+3])cube([50,50,1],center=true);
