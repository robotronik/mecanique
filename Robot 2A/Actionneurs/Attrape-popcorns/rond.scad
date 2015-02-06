$fn=100;

intersection(){
rotate_extrude()rotate([90,0,0])
#difference() {
square([65,40]);
translate([30,20])union() {
translate([0,1]) circle(d=43);
translate([-15,1])square([30,43], center=true);
}
}

translate([-15,0,0])cube([90,110,100], center=true);
}