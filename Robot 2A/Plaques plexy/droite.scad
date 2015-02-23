module plateau() {
  translate([0,0]) square([140, 315]);
  translate([140*1,0]) #square([140, 315]);
  translate([140*2,0]) square([140, 315]);
  translate([140*3,0]) #square([20, 315]);
}

module trou_bras() {
    translate([12,170]) square([78, 90]);    
}

module trou_avant() {
  square([300, 160]);
}

module toutes_vis() {
  translate([,])circle(d=4);
  translate([,])circle(d=4);
  translate([,])circle(d=4);
  translate([,])circle(d=4);
}

module tous_les_trous() {
  translate([140,0])trou_bras();
  translate([140+140,0])trou_avant();
  toutes_vis();
}

difference() {
  plateau();
  tous_les_trous();
}

  