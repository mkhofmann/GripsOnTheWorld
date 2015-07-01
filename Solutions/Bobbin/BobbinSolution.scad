include<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\LockingMechanisms\\beltclip.scad>;

module bobbin(){
      translate([26, 34,0]) rotate([0,0,-90]) scale([2,1.5,2.5]) import("yarnbobbin2.stl",3);
}

bobbinLegoM();


module bobbinClip(){
    union(){
        translate([0,-9,-40]) mountingClip(58, 40, 5);
        rotate([-45,0,0]) bobbin();
    }
}

module bobbinLegoM(){
    union(){
        bobbin();
        translate([0,-15, 0])cube([60,25,10]);
        intersection(){
            translate([0, -15,lmh])cube([60,25,10]); 
            translate([0, -15,10]) fillMale(55, 25);
        }
    }
}

module bobbinLegoF(){
    union(){
        bobbin();
        translate([0,-15, 0])cube([60,25,10]);
        intersection(){
            translate([0, -15,lfh])cube([60,25,10]); 
            translate([0, -15,10]) fillFemale(55, 25);
        }
    }
}

