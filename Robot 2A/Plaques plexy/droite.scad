$fn=80;
haut=310;
larg=140;

module plateau() {
  translate([0,0]) square([larg, haut]);
  translate([larg*1,0]) square([larg, haut]);
  translate([larg*2,0]) square([larg, haut]);
  translate([larg*3,0]) square([20, haut]);
}

module trou_bras() {
    translate([12,170]) square([78, 90]);    
}

module trou_avant() {
  square([300, 160]);
}

module toutes_vis() {
  translate([larg*1+5.5,202])circle(d=4);
  translate([larg*2-5.5,202])circle(d=4);
  translate([larg/2,haut-15])circle(d=4);
  translate([larg*5/2,haut-15])circle(d=4);
}

module tous_les_trous() {
  translate([larg*1,0])trou_bras();
  translate([larg*2,0])trou_avant();
  toutes_vis();
}

difference() {
  plateau();
  tous_les_trous();
}

  