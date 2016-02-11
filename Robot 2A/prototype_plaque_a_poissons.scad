//dim 

X= 200;
Y= 420;
ZP= 5;
ZT=1;

//écart
e=10;

//epaisseur du cadre
c=5;

cube([X,Y,ZT], center=true);
translate ([0,0,20+e]) cube([X,Y,ZP], center=true);


translate([0,0,(e)/2]){
    difference() {       
       
        cube([X,Y,e],center=true);
        cube([X-c,Y-c,e],center=true);
        translate ([(-X+c)/2,0,0]) cube([c,Y-2*c,c], center = true);
    }
}