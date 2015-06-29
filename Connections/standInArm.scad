include<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;

module hingLoop(){
    difference(){
        union(){
            cylinder(r=8,h=10);
            translate([-8,-8,0]) cube([16, 8, 10]);
        }
        cylinder(r=3,h=10);
    }
}
module wristHinged(dl,ds){
    union(){
       cube([dl, ds, 16]);
       for(i=[0:20:dl-10]){
           translate([i,8+ds, 8]) rotate([0,90,0]) hingLoop();
           translate([dl-i,-8,8]) rotate([0,90,180]) hingLoop();
       }
       for(i=[0:20:ds-10]){
           translate([8+dl, 10+i, 8]) rotate([0,90,-90]) hingLoop();
           translate([-8, ds-i-10, 8]) rotate([0,90,90]) hingLoop();
       }
        
    }
}
wristLegoM(40,59);
module wristLegoM(dl, ds){
union(){
    wristHinged(dl,ds);
    intersection(){
        cube([dl,ds,16+lmh]);
        translate([0,0,16]) fillMale(dl,ds);
    }
}    
}
module wristLegoF(dl, ds){
union(){
    wristHinged(dl,ds);
    intersection(){
        cube([dl,ds,16+lfh]);
        translate([0,0,16]) fillFemale(dl,ds);
    }
}    
}

module Extender(){
difference(){
union(){
    cube([20,40,16]);
    for(i=[0:20:10]){
        translate([i,48, 8]) rotate([0,90,0]) hingLoop();
        translate([20-i,-8,8]) rotate([0,90,180]) hingLoop();
       }
}
    translate([0,5,5]) cube([20,30,6]);
}
}

module LegoFExtender(){
    union(){
    Extender();
    intersection(){
        cube([20,40,16+lfh]);
        translate([0,0,16]) fillFemale(20,40);
    }
} 
}

module LegoMExtender(s){
    union(){
    Extender(20);
    intersection(){
        cube([20,40,16+lmh]);
        translate([0,0,16]) fillMale(20,40);
    }
} 
}

module endExtender(){
difference(){
union(){
    cube([20,40,16]);
    for(i=[0:20:10]){
        translate([20-i,-8,8]) rotate([0,90,180]) hingLoop();
       }
}
    translate([0,5,5]) cube([20,30,6]);
}
}

module pin(h){
    cylinder(r=3, h=h);
}

module extendnerPin(){
    pin(20);
}

