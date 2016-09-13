module breadboard(fn){
$fn=fn;
difference(){
    color("green") cube(size=[40,60,1.61],center=false);
    translate([2.17,2.17,-0.1]) cylinder(h=2,d=2,center=false);
    translate([40-2.17,2.17,-0.1]) cylinder(h=2,d=2,center=false);
    translate([2.17,60-2.17,-0.1]) cylinder(h=2,d=2,center=false);
    translate([40-2.17,60-2.17,-0.1]) cylinder(h=2,d=2,center=false);
    for(i=[0:13]){
        for(j=[0:19]){
            
                
            translate([3.09+i*2.63,5.06+j*2.63,-0.1]) cylinder(h=2,d=1.12,center=false);
        }
    }
}

for(i=[1:12]){
    translate([3.09+i*2.63,2.17,1.61]) color("grey") square(size=[2.28,3.50],center=true);
}

for(i=[1:12]){
    translate([3.09+i*2.63,60-2.17,1.61]) color("grey") square(size=[2.28,3.50],center=true);
}
}

breadboard(20);