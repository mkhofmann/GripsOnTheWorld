include<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;

module hingLoop(){
    translate([0,0,1])difference(){
        union(){
            cylinder(r=10,h=8);
            translate([-10,-10,0]) cube([20, 10, 8]);
        }
        cylinder(r=6,h=8);
    }
}
module wristHinged(dl,ds){
    union(){
       cube([dl, ds, 20]);
       for(i=[0:20:dl-10]){
           translate([i,10+ds, 10]) rotate([0,90,0]) hingLoop();
           translate([dl-i,-10,10]) rotate([0,90,180]) hingLoop();
       }
       for(i=[0:20:ds-10]){
           translate([10+dl, 10+i, 10]) rotate([0,90,-90]) hingLoop();
           translate([-10, ds-i-10, 10]) rotate([0,90,90]) hingLoop();
       }
        
    }
}

module wristLegoM(dl, ds){
union(){
    wristHinged(dl,ds);
    intersection(){
        cube([dl,ds,20+lmh]);
        translate([0,0,20]) fillMale(dl,ds);
    }
}    
}
module wristLegoF(dl, ds){
union(){
    wristHinged(dl,ds);
    intersection(){
        cube([dl,ds,20+lfh]);
        translate([0,0,20]) fillFemale(dl,ds);
    }
}    
}

module Extender(){
difference(){
union(){
    cube([20,40,20]);
    for(i=[0:20:10]){
        translate([i,50, 10]) rotate([0,90,0]) hingLoop();
        translate([20-i,-10,10]) rotate([0,90,180]) hingLoop();
       }
}
    translate([0,5,5]) cube([20,30,6]);
}
}

module LegoFExtender(){
    union(){
    Extender();
    intersection(){
        cube([20,40,20+lfh]);
        translate([0,0,20]) fillFemale(20,40);
    }
} 
}

module LegoMExtender(s){
    union(){
    Extender(20);
    intersection(){
        cube([20,40,20+lmh]);
        translate([0,0,20]) fillMale(20,40);
    }
} 
}

module endExtender(){
difference(){
union(){
    cube([20,40,20]);
    for(i=[0:20:10]){
        translate([20-i,-10,10]) rotate([0,90,180]) hingLoop();
       }
}
    translate([0,5,5]) cube([20,30,6]);
}
}
wristHinged(40,40);
translate([10,0,20])rotate([90,0,0]) Extender();
module pin(h){
    cylinder(r=4, h=h);
}

module extendnerPin(){
    pin(20);
}

