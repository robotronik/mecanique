$fn=100;


difference() {
    union(){
    cube([15,2,130]);
    translate([0,0,-2]) cube([15,5,2]);
    }
    
    translate([5,0,25]) cube([10,2,65]);
}