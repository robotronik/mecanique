//bushings
conf_b_bushing8 = [4, 5.1, 10, 1, "Tube shaped bushing like igus J(V)FM 0810-10"];
//shorter beaings (two on each Z axis)
conf_b_lm8uu = [4, 7.7, 24, 0, "lm8uu bearing (standard)"];
conf_b_lm10uu = [5, 9.7, 29, 0, "lm10uu bearing (10mm smooth rod)"];
conf_b_lme8uu =[4, 8.2, 25, 0, "lme8uu bearing"];
conf_b_lm12uu = [6, 10.6, 30, 0, "lm12uu bearing (12mm smooth rod)"];

bushing_xy = conf_b_lm8uu;

layer_height = 0.3;
width_over_thickness = 2.2;
// Segments of small holes. some poeple claim that a low value makes them easier to print.
small_hole_segments=7;

// Nuts and bolts
m4_diameter = 4.7;
//iso4032 says 7.66
m4_nut_diameter = 7.6;
m4_nut_diameter_horizontal = 8.15;

m3_diameter = 3.6;
//iso4032 says 6.01
m3_nut_diameter = 5.3;
m3_nut_diameter_horizontal = 6.8;
m3_washer_diameter = 6.9;

//calculated from settings
single_wall_width = width_over_thickness * layer_height;

// ensure that the part length is at least the length of bushing barrel plus add
function adjust_bushing_len(conf_b, h, add=layer_height*2) = ((conf_b[2]+add) > h) ? conf_b[2]+add : h;

//distance from the flat side of bushing holder to rod center
function bushing_foot_len(conf_b, h=10.5, add=4*single_wall_width) = ((conf_b[1]+add) > h) ? conf_b[1]+add : h;

function bushing_outer_radius(conf_b) = conf_b[1] + 4*single_wall_width;

// basic building blocks, housings for 1 bushing/bearing
// at [0,0] there is center of the smooth rod, pointing in Z

module linear_bearing_negative_single(conf_b=bushing_xy, h=0, shadow=false){
    // barrel with the dimensions of the bearing
    translate([0, 0, -0.01 + 3 * layer_height])  cylinder(r = conf_b[1], h = adjust_bushing_len(conf_b, h) + 0.02);
    if (shadow == false) {
        translate([0, -conf_b[1]+1, -0.01 + 3 * layer_height]) cube([30, 2 * conf_b[1] - 2, adjust_bushing_len(conf_b, h) + 0.02]);
    }
}

module linear_bearing_negative(conf_b = bushing_xy, h = 0, shadow=false){
    //same as linear_bushing_negative, but with z direction constrained parts
    translate([0,0,-0.1]) cylinder(r = conf_b[0] + single_wall_width, h=adjust_bushing_len(conf_b, h, 8*layer_height)+0.2);
    //lower bearing
    linear_bearing_negative_single(conf_b, 0, shadow);
    if (h > 2*conf_b[2] + 9*layer_height){
        translate([0,0,h]) mirror([0,0,1]) linear_bearing_negative_single(conf_b, 0, shadow);
    }
}

module linear_bearing(conf_b=bushing_xy, h=0){
    difference() {
        union() {
            difference(){
                translate([0,0,0]) cylinder(h = adjust_bushing_len(conf_b, h, 9*layer_height), r=bushing_outer_radius(conf_b), $fn=60);
                //smooth entry cut
                translate([12,0,-1]) rotate([0,0,45]) cube([20, 20, 200], center=true);
            }
            intersection(){
                translate([0, -(bushing_outer_radius(conf_b)), 0]) cube([30, 2*bushing_outer_radius(conf_b) , max(h, conf_b[2] + 9 * layer_height)]);
                union() {
                    // upper clamp for long holders
                    if (h > 2*conf_b[2] + 9*layer_height || conf_b[2] > 45){
                        translate ([0,0, max(h, conf_b[2]) - 8 ]) bearing_clamp(conf_b, 2*(bushing_outer_radius(conf_b)));
                    }
                    //lower clamp
                    translate ([0, 0, 10]) bearing_clamp(conf_b, 2*(bushing_outer_radius(conf_b)));
                }
            }
        }
        //main axis
        translate([0,0,-2]) cylinder(h = adjust_bushing_len(conf_b, h)+10, r=conf_b[1]);
        //main cut
        translate([0, -conf_b[1]+1, -1]) cube([30, 2*conf_b[1]-2, 200]);
    }
    difference() {
        translate([-bushing_foot_len(conf_b), -7, 0]) cube([4, 14, adjust_bushing_len(conf_b, h, 9*layer_height)]);
        linear_negative(conf_b, h);
    }
}

module bearing_clamp_brick(conf_b, h){
    translate([-(m4_nut_diameter/2+conf_b[1]), 0, 0])
        cube([m4_nut_diameter + 2 * conf_b[1], m4_nut_diameter + 1, h], center = true);
}

module bearing_clamp(conf_b=bushing_xy, h=0){
    // inspired by John Ridley and Jonas Kühling/*
    rotate([90, 0, 0]) {
        difference(){
            union(){
                translate([m3_diameter / 2 + conf_b[1] + 0.3, 0, 0])
                    cylinder(h=h, r = m4_nut_diameter / 2 + 0.5, center = true);
                translate([m3_diameter / 2 + conf_b[1] + 0.3, 0, 0]) {
                    bearing_clamp_brick(conf_b, h);
                    rotate([0,0,35])
                        bearing_clamp_brick(conf_b, h);
                }
            }
            translate([m3_diameter / 2 + conf_b[1] + 0.3, 0, 0]) {
                cylinder(r=m3_diameter / 2, h=h+2, center=true,$fn=small_hole_segments);
                %cylinder(r=m3_diameter / 2, h=h+2, center=true,$fn=small_hole_segments);
            }
        }
    }
}


module linear_negative(conf_b = bushing_xy, h = 0, shadow=false){
    //selects right negative based on type
    if (conf_b[3] == 0) {
        linear_bearing_negative(conf_b, h, shadow);
    } else {
        linear_bushing_negative(conf_b, h, shadow);
    }
}

module linear(conf_b = bushing_xy, h = 0){
    //selects right model based on type
    if (conf_b[3] == 0) {
        linear_bearing(conf_b, h);
    } else {
        linear_bushing(conf_b, h);
    }
    %linear_negative(conf_b, h, true);
}


module support_roulement_lineaire_simple() {
    linear([4, 7.7, 24, 0, "lm8uu bearing (standard)"]);
}
