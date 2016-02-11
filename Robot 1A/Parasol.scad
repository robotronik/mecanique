$fn = 40;

rails_distance      = 45;
rails_diametre      =  8;
roulements_diametre = 15;
support_rails_larg  = 15;
support_rails_epp   = 3;

diametre_parasol = 2.3 ;
hauteur_parasol = 100 ;
hauteur_partie_mobile = 47.5 ; //entre partant du sommet du parasol

module cylindre_coulissant() {
    difference() {
        translate([0,rails_distance/2,31+9]) cylinder(d=rails_diametre + 4, h=8) ;
        translate([0,rails_distance/2,31+8]) cylinder(d=rails_diametre, h=10) ; }
        
    difference() {
        translate([0,rails_distance/2,9]) cylinder(d=rails_diametre + 4, h=8) ;
        translate([0,rails_distance/2,8]) cylinder(d=rails_diametre, h=10) ; }
}

module support_ressort_parasol() {
    union() {
        //partie rail fixe
        difference() {
            translate([0,rails_distance/2,31+10]) cylinder(d=rails_diametre + 8, h=5) ;
            translate([0,rails_distance/2,31+9]) cylinder(d=rails_diametre + 4, h=7) ;
            translate([-10,rails_distance/2+3,31+9]) cube([50,50,50]) ;} 
        translate([0,0,31+10.5]) cube([diametre_parasol-1, rails_distance/2-rails_diametre/2-0.5,4]) ;
        //partie parasol
        difference() {
            translate([0,0,31+10]) cylinder(d=diametre_parasol + 4, h=5) ;
            translate([0,0,31+9]) cylinder(d=diametre_parasol, h=7) ;} 
    }
}


module support_base_parasol() {
    union() {
        //partie rail fixe
        difference() {
            translate([0,rails_distance/2,10]) cylinder(d=rails_diametre + 8, h=5) ;
            translate([0,rails_distance/2,9]) cylinder(d=rails_diametre + 4, h=7) ; 
            translate([-10,rails_distance/2+3,9]) cube([50,50,50]) ; } 
        translate([0,0,10.5]) cube([diametre_parasol-1, rails_distance/2-rails_diametre/2-0.5,4]) ;
        //partie parasol
        difference() {
            translate([0,0,10]) cylinder(d=diametre_parasol + 4, h=5) ;
            translate([0,0,11]) cylinder(d=diametre_parasol, h=5) ; } 
    }
}

module parasol() {
    translate([0,0,11]) cylinder(d=diametre_parasol, h=hauteur_parasol) ;
    
}

module etage() {
	translate([-10,-90,-3]) cube([173,122,3]) ;
}

module axes_verification(){
    translate([-25,0,0]) cylinder(d=8, h=150) ;
    translate([-35,0,-175]) cylinder(d=8, h=350) ;
}

module attache_rail() {
    difference() {
        cylinder(d = rails_diametre+4, h = 5);
        translate([0,0,4.5]) cube([rails_diametre+4,1,7], center=true); }
}

module supports_rails() {
    difference() {
        union() {
            translate([0,0,support_rails_epp/2])
            cube([support_rails_larg,rails_distance, support_rails_epp], center=true);
            translate([0, rails_distance/2,0])
            cylinder(d = support_rails_larg, h = support_rails_epp);
            translate([0, rails_distance/2,support_rails_epp])
            difference()
            attache_rail();
        }
        translate([0, rails_distance/2,0])  cylinder(d = rails_diametre, h = 50);
    }
}




//Barre verticale
%union() {
    translate([0, rails_distance/2,2])  cylinder(d = rails_diametre, h = 150);
    }
    


color ("DarkOrange") axes_verification() ;
color ("red") etage() ;
color ("purple") parasol() ;
color ("green") support_base_parasol() ;
color ("MediumAquamarine") support_ressort_parasol() ;
color ("SlateGray") cylindre_coulissant() ;
supports_rails();