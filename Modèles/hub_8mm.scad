
shaft_length = 23.53;
shaft_diameter = 8;
shaft_flat_begin = 11.08;
shaft_flat_length = 6.24;
shaft_flat_spacing = 3;
shaft_flat_center = shaft_flat_begin + shaft_flat_length/2 + shaft_flat_spacing;

hub_diameter = 14.34;
hub_height_in = 7.59;

stop_guard_diameter = 15.15;
stop_guard_width = 1.28;

stop_guard_in_small_diameter = 11.48;
stop_guard_in_small_length = 0.91;
stop_guard_in_big_diameter = 12.48;
stop_guard_in_big_length = 1.28;

screw_diameter = 3.0; 
screw_spacing = shaft_flat_dist;

total_length = stop_guard_width
  + hub_height_in
  + stop_guard_in_small_length
  + stop_guard_in_big_length;

/* experimental clearance */
clearance = 0.40; // ~wire diameter +0.20
clearance_bed = clearance + 0.2;

$fn = 40;

difference() {
union()  
{
  cylinder(d=stop_guard_diameter, h=stop_guard_width);
  translate([0,0,stop_guard_width]) {
    cylinder(d=hub_diameter, h=hub_height_in, $fn=6);
    translate([0,0,hub_height_in]) {
      cylinder(d=stop_guard_in_small_diameter, h=stop_guard_in_small_length);
      translate([0,0,stop_guard_in_small_length]) {
	cylinder(d=stop_guard_in_big_diameter, h=stop_guard_in_big_length);
      }
    }
  }
}

 translate([0,0,-0.02])
   cylinder(d1=shaft_diameter + 2, d2=0, h=total_length);
 
 cylinder(d1=shaft_diameter + clearance_bed, d2=shaft_diameter + clearance,  h=total_length+.2);

 translate([0,0,5.00])
   rotate([90,0,0]) {
     cylinder(d=screw_diameter, h=hub_diameter/2);
 }
 
}
