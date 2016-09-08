$fn = 100;

module roue()
{
    color("grey") rotate_extrude(angle=360) 
    difference(){
        intersection(){
            translate([17, 0, 0]) square([34, 26], center = true);
            circle(d=69, center = true);
        }
        
        translate([13, 0, 0]) square([26.1, 26.1], center = true);
        translate([34, 3, 0]) square([1, 2], center = true);
        translate([34, -3, 0]) square([1, 2], center = true);
    }
    
    color("yellow") difference(){
        cylinder(d=52, h=26, center = true);
        cylinder(d=46, h=26.1, center = true);
    }
    
    color("yellow") translate([0, 0, 9]) difference(){
        cylinder(d=46, h=2, center = true);
        cylinder(d=42, h=2.1, center = true);
    }
    
    
    color("yellow") union(){
        translate([0, 0, -18]) difference(){
            cylinder(d=11, h = 27);
            translate([0, 0, 6]) intersection(){
                cube([3.4, 6, 10.1], center = true);
                cylinder(d=6, h=10.1, center = true);
            }
            translate([0, 0, 0.5]) cylinder(d=6, h=1.1, center = true);
        }
        
        translate([0, 0, 7]) difference(){
             linear_extrude(height=7, center = true, scale = 2) circle(d=11, center = true);
            translate([0, 0, 3]) linear_extrude(height=7, center = true, scale = 2) circle(d=11, center = true);
        }
        
        translate([0, 0, 7]) cylinder(h=2, d=15, center = true);
        
        translate([0, 0, 10]) difference(){
            for(i=[0:4]){
                rotate([0, 0, i*360/5]) linear_extrude(height=0.5) polygon([[10*cos(120), 10*sin(120)], [10*cos(60), 10*sin(60)], [0, 30]]);
                rotate([0, 90, i*360/5]) linear_extrude(height=0.5) polygon([[0, 0], [10, 25], [0, 25]]);
            }
            
             linear_extrude(height=7, center = true, scale = 2) circle(d=11, center = true);
        }
    }
}

module moteur()
{
        translate([0, -37/2+11.2, 0]) union(){
        color("yellow") difference(){
            cube([18.6, 37, 22.4], center = true);  
        
            translate([0, 37/2-4.6, 22.4/2-4.6]) difference(){
                translate([0, 4.6/2, 4.6/2]) cube([19, 4.7, 4.7], center = true);
                rotate([0, 90, 0]) cylinder(h=20, d=2*4.6, center = true);
            }
            
            translate([0, 37/2-4.6, -22.4/2+4.6]) difference(){
                translate([0, 4.6/2, -4.6/2]) cube([19, 4.7, 4.7], center = true);
                rotate([0, 90, 0]) cylinder(h=20, d=2*4.6, center = true);
            }
            
            translate([0, -37/2+5.5, 22.4/2-2]) rotate([0, 90, 0]) cylinder(h=19, d=3, center = true);
            translate([-(17.6+3)/2+0.5, 0.5, 0]) cube([1, 2, 5.1], center = true);
            translate([0, -37/2+5.5, -22.4/2+2]) rotate([0, 90, 0]) cylinder(h=19, d=3, center = true);
        }
        
        color("yellow") translate([0, (37+5)/2, 0]) difference(){
            cube([3, 5, 5], center = true);
            rotate([0, 90, 0]) cylinder(h=3.1, d=3, center = true);
        }
        
        color("yellow") translate([0.5, -(37+12)/2, 0]) intersection(){
            scale([1.1, 1, 1]) rotate([90, 0, 0]) cylinder(h=12, d = 22.4, center = true);
            cube([17.6, 12, 22.4], center = true);
        }
        
        color("lightgray") translate([0.5, -(37+8.3)/2 -12, 0]) intersection(){
            scale([1.1, 1, 1]) rotate([90, 0, 0]) cylinder(h=8.3, d = 20, center = true);
            cube([15, 8.3, 20], center = true);
        }
        
        translate([0.5, -(37+5.3)/2-12-8.3, 0]) color("white") difference(){
            intersection(){
                scale([1.1, 1, 1]) rotate([90, 0, 0]) cylinder(h=5.3, d = 20, center = true);
                cube([15, 5.3, 20], center = true);
            }
            
            rotate([90, 0, 0]) scale([1.1, 1.01, 1]) rotate_extrude(angle=360) difference(){
                translate([(19.8-5.3)/2, 0, 0]) square([5.4, 5.4], center = true);
                translate([19.8/2 - 5.3, -5.3/2, 0]) circle(d=2*5.3, enter = true);
            }
            
            translate([0, 0, (20-3)/2]) rotate([90, 0, 0]) cylinder(h=6, d=3, center = true);
            translate([0, 0, (20)/2]) cube([3, 6, 3], center = true);
            
            translate([0, 0, -(20-3)/2]) rotate([90, 0, 0]) cylinder(h=6, d=3, center = true);
            translate([0, 0, -(20)/2]) cube([3, 6, 3], center = true);
        }
        
        translate([0.5, -(37+2)/2-12-8.3-5.3, 0]) union(){
            color("white") rotate([90, 0, 0]) cylinder(h=2, d=9.6, center = true);
            color("grey") rotate([90, 0, 0]) cylinder(h=3, d=1.9, center = true);
        }
        
        color("white") translate([-(18.6+8.9)/2, 37/2-11.2, 0]) union(){
            intersection(){
                cube([8.9, 5.35, 3.7], center = true);
                rotate([0, 90, 0]) cylinder(h=8.9, d=5.35, center = true);
            }
            
            translate([(8.9-0.5)/2, 0, 0]) rotate([0, 90, 0]) cylinder(h=0.5, d=5.35, center = true);
        }
        
        color("yellow") translate([-(18.6+1)/2, -37/2+14, 0]) rotate([0, 90, 0]) cylinder(h=1, d=4, center = true);
        
        color("yellow") translate([0, -37/2-7.2, 0]) union(){
            translate([-(17.6+2)/2+0.5, 0, 0]) cube([2, 1, 5.1], center = true);
            translate([-(17.6+3)/2+0.5, 0.5, 0]) cube([1, 2, 5.1], center = true);
            
            translate([(17.6+2)/2+0.5, 0, 0]) cube([2, 1, 5.1], center = true);
            translate([(17.6+3)/2+0.5, 0.5, 0]) cube([1, 2, 5.1], center = true);
        }
    }
}

translate([-27.5, 0, 0]) rotate([0, -90, 0]) roue();

moteur();


