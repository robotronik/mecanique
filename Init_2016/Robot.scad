use <capteurUS_HCSR04.scad>;

path = "/home/jordan/"; // chemin vers le dossier robotronik

module moteur(){
color("lightgrey")import(str(path,"robotronik/mecanique/Init_2016/STL/Moteur.stl"));
color("grey")import(str(path,"robotronik/mecanique/Init_2016/STL/Axe_moteur.stl"));
color("white")import(str(path,"robotronik/mecanique/Init_2016/STL/Coque_moteur_et_axe_reducteur.stl"));
import(str(path,"robotronik/mecanique/Init_2016/STL/Reducteur_moteur.stl"));
}

module roue(){
color("grey")import(str(path,"robotronik/mecanique/Init_2016/STL/Pneu.stl"));
import(str(path,"robotronik/mecanique/Init_2016/STL/Jante.stl"));
}

module bille_jockey(){

color("gold")import(str(path,"robotronik/mecanique/Init_2016/STL/Roue_omni_1.stl"));
color("lightgrey")import(str(path,"/robotronik/mecanique/Init_2016/STL/Roue_omni_2.stl"));
}

module breadboard(){
color("green")import(str(path,"robotronik/mecanique/Init_2016/STL/Breadboard_1.stl"));
color("khaki")import(str(path,"robotronik/mecanique/Init_2016/STL/Breadboard_contacts.stl"));
}

module fixations_capteurUS(){
import(str(path,"robotronik/mecanique/Init_2016/STL/Fixations_capteurUS.stl"));
}
/*moteur();
roue();
bille_jockey();
breadbord();*/

module base(){
color("chartreuse")import(str(path,"robotronik/mecanique/Init_2016/STL/Base.stl"));
}
module power_train(fn){

translate([39, 0, 0]) union(){
    translate([-27.5, 0, 0]) rotate([0, -90, 0]) roue(fn);

    rotate([180,0,0])moteur(fn);
}

translate([70, 0, 0]) mirror([1, 0, 0]) union(){
    translate([-27.5, 0, 0]) rotate([0, -90, 0]) roue(fn);

    rotate([180,0,0])moteur(fn);
}
}

module equerre_fixation(lc1,lc2,L,e,diam_vis){
	 // e = epaisseur
	difference(){
		cube([lc1,L,e]);
		translate([5+1.7/2,L/2,-2])rotate([0,0,0])cylinder(d=diam_vis,h=7);	
		translate([5+(20-1.7/2),L/2,-2])rotate([0,0,0])cylinder(d=diam_vis,h=7); 
	}
	difference() {
		rotate([0,90,0])cube([lc2,L,e]);
		translate([-6,L/2,-6])rotate([0,90,0])cylinder(d=diam_vis,h=10);

	}
	translate([0,L,0]) rotate([90,0,0])linear_extrude(height = L)polygon(
		points=[ [0,0],[3,0],[0,-3] ],
		paths=[ [0,1,2] ]
	);	
}


module fixation_moteur_1(){
	difference(){
		union(){
			rotate([90,0,90])cube([10,25.5,2]);
			translate([-19.5,-15,25.5-3])cube([19.5,25,3]);
			translate([-22.5,-25,0])cube([3,35,25.5]);
			translate([-29.5,-25,0])cube([10,15,3]);
		}
	translate([-22.7,4.5,2])rotate([0,90,0])cylinder(d=3,h=25);
	translate([-22.7,4.5,20.4])rotate([0,90,0])cylinder(d=3,h=25);

	translate([-29.5+3.5,-26.5+3+2,-10])cylinder(d=3,h=25);
	translate([-29.5+3.5,-26.5+3+13.5,-10])cylinder(d=3,h=25);
	}

}

module fixation_moteur_2(){
	mirror([1,0,0]){
		difference(){
			union(){
				rotate([90,0,90])cube([10,25.5,2]);
				translate([-19.5,-15,25.5-3])cube([19.5,25,3]);
				translate([-22.5,-25,0])cube([3,35,25.5]);
				translate([-29.5,-10,0])cube([10,15,3]);
			}
		translate([-22.7,4.5,2])rotate([0,90,0])cylinder(d=3,h=25);
		translate([-22.7,4.5,20.4])rotate([0,90,0])cylinder(d=3,h=25);

		translate([-29.5+3.5,-26.5+3+2+11.5,-10])cylinder(d=3,h=25);
		translate([-29.5+3.5,-26.5+3+10+15,-10])cylinder(d=3,h=25);
		}
	}

}

module fixation_moteurs_V1(){
	translate([75.4,35.8,5])fixation_moteur_1();
	translate([23.4,35.8,5])fixation_moteur_2();
}

module equerre_fixation_moteur(lc1,lc2,L,e,diam_vis){
	 // e = epaisseur
	difference(){
		cube([lc1,L,e]);
		translate([11.2,L/2,-2])cylinder(d=diam_vis,h=7);	
	}
	difference() {
		rotate([0,90,0])cube([lc2,L,e]);
		translate([-6,L/2,-4])rotate([0,90,0])cylinder(d=diam_vis,h=10);
		//translate([-6,L/2,-8.5])rotate([0,90,0])cylinder(d=diam_vis,h=10);
	}
	translate([0,L,0]) rotate([90,0,0])linear_extrude(height = L)polygon(
		points=[ [0,0],[3.5,0],[0,-2.5] ],
		paths=[ [0,1,2] ]
	);	
}
module fixation_moteur_V2(){
	translate([30,8.8,5])union(){
		translate([8,-5,0])rotate([0,-90,0])equerre_fixation_moteur(15,7,5,2,3);
		rotate([0,-90,180])equerre_fixation_moteur(15,7,5,2,3);
	}
	translate([61,8.8,5])union(){
		translate([8,-5,0])rotate([0,-90,0])equerre_fixation_moteur(15,7,5,2,3);
		rotate([0,-90,180])equerre_fixation_moteur(15,7,5,2,3);
	}
	translate([75.4,35.8,5])fixation_moteur_1_V2();
	translate([23.4,35.8,5])fixation_moteur_2_V2();
}

module fixation_moteur_1_V2(){
	difference(){
		union(){
			//translate([0,0,13])rotate([90,0,90])cube([10,12.5,2]);
			//translate([-19.5,-15,25.5-3])cube([19.5,25,3]);
			translate([-22.5,-25,0])cube([2,35,23]);
			translate([-29.5,-25,0])cube([9,15,3]);
		}
	//translate([-22.7,4.5,2])rotate([0,90,0])cylinder(d=3,h=25);
	translate([-22.7,4.5,20.4])rotate([0,90,0])cylinder(d=3,h=25);

	translate([-29.5+3.5,-26.5+3+2,-10])cylinder(d=3,h=25);
	translate([-29.5+3.5,-26.5+3+13.5,-10])cylinder(d=3,h=25);
	}

}

module fixation_moteur_2_V2(){
	mirror([1,0,0]){
		difference(){
			union(){
				//rotate([90,0,90])cube([10,25.5,2]);
				//translate([-19.5,-15,25.5-3])cube([19.5,25,3]);
				translate([-22.5,-25,0])cube([2,35,23]);
				translate([-29.5,-10,0])cube([10,20,3]);
			}
		//translate([-22.7,4.5,2])rotate([0,90,0])cylinder(d=3,h=25);
		translate([-22.7,4.5,20.4])rotate([0,90,0])cylinder(d=3,h=25);

		translate([-29.5+3.5,-26.5+3+2+11.5,-10])cylinder(d=3,h=25);
		translate([-29.5+3.5,-26.5+3+10+15,-10])cylinder(d=3,h=25);
		}
	}

}

module fixation_breadboard_1(){
	cube([2,5,40]);
	difference(){
		translate([0,0,38])cube([60,5,2]);
		translate([12.2,2.5,37.5])rotate([0,0,0])cylinder(d=2,h=3);
		translate([47.8,2.5,37.5])rotate([0,0,0])cylinder(d=2,h=3);
	}
	translate([58,0,0])cube([2,5,40]);
	translate([2,0,5+1.5])rotate([180,0,180])equerre_fixation(9,10,5,2,3);
	translate([58,5,5+1.5])rotate([180,0,0])equerre_fixation(9,10,5,2,3);
}

module fixation_breadboard_2(){
	cube([5,5,35]);
	translate([-20,0,38])cube([40,15,2]);
}

module robot_sumo(){	
	translate([-4.5,25,16.2])power_train(7);
	translate([0.5,5,0]){
		color("red")fixation_moteur_V2();
		translate([26,6.3,-1])cylinder(d=3,h=10);
		translate([42,6.3,-1])cylinder(d=3,h=10);
		translate([57,6.3,-1])cylinder(d=3,h=10);
		translate([73,6.3,-1])cylinder(d=3,h=10);
		translate([49.4,14.3,-1])cylinder(d=3,h=10);
		translate([49.4,25.8,-1])cylinder(d=3,h=10);
		translate([49.4,37.3,-1])cylinder(d=3,h=10);
	}
	//translate([40,60,45])rotate([0,0,-90])nano(5);
	//translate([0,0,0])rotate([180,0,0])CNY70();
	//translate([0,0,0])L293D();
	translate([0,10,0]){
		translate([30,10,40])breadboard();
		translate([20,65.3,0.5]){
			fixation_breadboard_1();
			translate([-3.8,2.5,-1])cylinder(d=3,h=10);
			translate([63.86,2.5,-1])cylinder(d=3,h=10);
		}
	}
	translate([50,87,-1])rotate([0,0,180]){
		rotate([0,0,-30])bille_jockey();
		for(i=[0:2]){translate([12.6*cos(i*120-30),12.6*sin(i*120-30),-3])cylinder(d=3,h=10);}
	}
	translate([(100-45)/2,1,10]){
		rotate([0,0,180])fixations_capteurUS();
		rotate([90,0,0])capteurUS_HCSR04(50);
	}
	translate([28.3,5.5,-1])cylinder(d=1.5,h=10);
	translate([71.65,5.5,-3])cylinder(d=1.5,h=10);
	//color("red")fixation_moteurs_V1();
	//translate([47.5,2.5,5])fixation_breadboard_2();
}

/*module base(){
	difference(){
		union(){
			translate([0,-10,0])cube([100,110,5]);
			translate([50,-10,0])resize(newsize=[0,20,0])cylinder(d=100,h=5, $fn=25);
			translate([50,100,0])resize(newsize=[0,15,0])cylinder(d=100,h=5,$fn=25);
		}
		translate([-0.1,-10,-0.1])cube([22,70,6]);
		translate([-0.1+78.2,-10,-0.1])cube([22,70,6]);
		translate([0,0,0.1])robot_sumo();
	}
	
}*/

//-->
translate([0,20,0])robot_sumo();
translate([0,0,0])base();