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
       cube([dl, ds, 20]);
       for(i=[0:20:dl-10]){
           translate([i,8+ds, 10]) rotate([0,90,0]) hingLoop();
           translate([dl-i,-8,10]) rotate([0,90,180]) hingLoop();
       }
       for(i=[0:20:ds-10]){
           translate([8+dl, 10+i, 10]) rotate([0,90,-90]) hingLoop();
           translate([-8, ds-i-10, 10]) rotate([0,90,90]) hingLoop();
       }
        
    }
}
wristLegoF(40,59);
module wristLegoM(dl, ds){
union(){
    wristHinged(dl,ds);
    intersection(){
        cube([dl,ds,20+lmh]);
        translate([0,0,20]) fillMale(dl,ds);
    }
}    
}

//wristLegoF(40, 20);
module wristLegoF(dl, ds){
union(){
    wristHinged(dl,ds);
    intersection(){
        cube([dl,ds,20+lfh]);
        translate([0,0,20]) fillFemale(dl,ds);
    }
}    
}