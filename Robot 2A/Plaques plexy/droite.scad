module plateau() {
  square([315, 100+2*140+20], center=true);
}

module trou_bras() {
  square([50, 50], center=true);
}

module trou_avant() {
  square([140, 160], center=true);
}

module toutes_vis() {

}

module tous_les_trous() {
  translate([])trou_bras();
  translate([])trou_avant();
  toutes_vis();
}

difference() {
  plateau();
  tous_les_trous();
}
  