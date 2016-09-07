$fn=100;

module capteurUS_HCSR04(){
	difference(){
		color("Royalblue")cube([45,20,1.5]);
		color("Royalblue")translate([0.85,0.85,-0.1])cylinder(d=1.5,h=1.7);
		color("Royalblue")translate([45-0.85,0.85,-0.1])cylinder(d=1.5,h=1.7);
		color("Royalblue")translate([0.85,20-0.85,-0.1])cylinder(d=1.5,h=1.7);
		color("Royalblue")translate([45-0.85,20-0.85,-0.1])cylinder(d=1.5,h=1.7);
	}
	difference(){
		color("lightgray")translate([9.5,10,1.5])cylinder(d=16,h=12);
		color("lightgray")translate([9.5,10,1.5])cylinder(d=15,h=12.1);
	}
	difference(){
		color("lightgray")translate([45-9.5,10,1.5])cylinder(d=16,h=12);
		color("lightgray")translate([45-9.5,10,1.5])cylinder(d=15,h=112.1);
	}
	color("black")translate([9.5,10,1.5])cylinder(d=15,h=11);
	color("black")translate([45-9.5,10,1.5])cylinder(d=15,h=11);
	color("silver")translate([45/2-10.8/2,0.8,1.5])quartz();
	for(i=[0:3])mirror([0,0,1])translate([2.56+17.35+2.56*i,20-2.56,0])rotate([0,0,90])connecteur_coude_V2();
	//rotate([0,-180,0])translate([-10.3-17.35,20-2.56,0])connecteur_coude_V1();
}
module quartz(){
	translate([2.2,0,0])cube([6.4,4.4,3.3]);
	translate([2.2,2.2,0])cylinder(d=4.4,3.3);
	translate([8.6,2.2,0])cylinder(d=4.4,3.3);
}

module connecteur_coude_V1(){
	cube([10.3,2.56,3.5]);
	translate([1.025,0,3.5])cube([8.25,8.2,0.7]);
	
		
}

module connexion_plastique(L,Lch,H){
	lch=0.5*sqrt(Lch*Lch*2);

	color("black")linear_extrude(height=H)polygon(points=[[lch,0],[L-lch,0],[L,lch],[L,L-lch],[L-lch,L],[lch,L],[0,L-lch],[0,lch]],
paths=[[0,1,2,3,4,5,6,7]]);
}

module connecteur_coude_V2(Length,num){
	pin_diam=1;
	connexion_plastique(2.56,0.75,2.6);
	Lc=5.6;
	color("khaki"){translate([(2.56-pin_diam)/2,(2.56-pin_diam)/2,-2])cube([pin_diam,pin_diam,Lc]);
	translate([(2.56-pin_diam)/2+pin_diam/2,(2.56-pin_diam)/2,1.6+2.56])rotate([0,90,0])cube([pin_diam,pin_diam,Lc]);
	translate([2.56/2,(pin_diam+2.56)/2,pin_diam/2+3.16])rotate([90,0,0])cylinder(d=pin_diam,h=pin_diam);}
}

capteurUS_HCSR04();