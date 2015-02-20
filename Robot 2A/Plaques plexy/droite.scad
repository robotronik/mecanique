module plateau() {
  square([100+2*140+20, 315], center=true);
}

module trou_bras() {
  square([80, 50], center=true);
}

module trou_avant() {
  square([300, 320], center=true);
}

module toutes_vis() {
  translate([,])circle(d=4);
  translate([,])circle(d=4);
  translate([,])circle(d=4);
  translate([,])circle(d=4);
}

module tous_les_trous() {
  translate([5O,20])trou_bras();
  translate([200,-160])trou_avant();
  toutes_vis();
}

difference() {
  plateau();
  tous_les_trous();
}
  