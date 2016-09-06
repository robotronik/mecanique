$fn = 100;
for(i=[0:14]){
    translate([2.56*i,0,0]) color("grey") cylinder(h=11.24,r=0.65);
    translate([(0.65/2)+2.56*i,0.65/2,6+(2.51/2)]) color("black") cube(size = 2.51, center = true);
}