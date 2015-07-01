include<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;

module hingLoop(){
    difference(){
        union(){
            cylinder(r=8,h=8);
            translate([-8,-8,0]) cube([16, 8, 8]);
        }
        cylinder(r=5,h=10);
    }
}

module pin(h){
    cylinder(r=3.5,h=h);
}

module pinCapped(h){
    union(){
        cylinder(r=8,h=6.5);
        translate([0,0,6.5]) cylinder(r=3.5,h=(h-6.5));
    }
}
module pinCap(){
    difference(){
        cylinder(r=8,h=6.5);
        cylinder(r=3.75,h=6.5);
    }
}

module fourPin(h){
    translate([0,0,3.5]) rotate([0,90,0]) for(i=[0:10:30]){
        translate([0,i,0]) pin(h);
    }
}
module wristHinged(w,h){
    union(){
       cube([w, h, 16]);
       for(i=[10:20:w-20]){
           translate([i,8+h, 8]) rotate([0,90,0]) hingLoop();
           translate([w-i,-8,8]) rotate([0,90,180]) hingLoop();
       }
       for(i=[10:20:h-20]){
           translate([8+w, 10+i, 8]) rotate([0,90,-90]) hingLoop();
           translate([-8, h-i-10, 8]) rotate([0,90,90]) hingLoop();
       }
        
    }
}
//wristLegoF(40,40);
module wristLegoM(w, h){
union(){
    wristHinged(w,h);
    intersection(){
        cube([w,h,16+lmh]);
        translate([0,0,16]) fillMale(w,h);
    }
}    
}


module wristLegoF(w, h){
union(){
    wristHinged(w,h);
    intersection(){
        cube([w,h,16+lfh]);
        translate([0,0,16]) fillFemale(w,h);
    }
}    
}

module Extender(){
    difference(){
    union(){
       cube([20,40, 16]);
       translate([0,48, 8]) rotate([0,90,0]) hingLoop();
       translate([20,-8,8]) rotate([0,90,180]) hingLoop();
    }
        translate([0,4,4]) cube([20,32,8]);
    }
}

module ExtenderPin(){
    pinCapped(33);
}

module fourExtenderPin(){
    fourPin(20);
}

module model(){
    wristHinged(40,40);
    translate([10,-16,56]) rotate([-90,0,0]) Extender();
    translate([0,-8,8])rotate([0,90,0]) pinCapped(40);
    translate([33.5,-8,8]) rotate([0,90,0]) pinCap();
    translate([3.5,-8,64])rotate([0,90,0]) ExtenderPin();
    translate([30,-8,64]) rotate([0,90,0]) pinCap();
}

wristLegoF(50,50);