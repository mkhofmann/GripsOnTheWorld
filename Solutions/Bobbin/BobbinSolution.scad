use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\LockingMechanisms\\stallLock.scad>;
use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\LockingMechanisms\\beltclip.scad>;

module stallLockBobbin(){
    union(){
        difference(){
            translate([0,27,31])rotate([0,90,0]) scale([2,1.5,7])import("yarnbobbin2.stl", 2);
            translate([-50,0,-100]) cube(100);
        }
        translate([0,0,-25]) female(22,30,60,5);
        cube([22,60,8]);
        
    }
}

module bobbinClip(){
    rotate([0,90,0])union(){
        mountingClip(40,50,3);
        translate([-40,22*3/2+6,30])rotate([0,0,-90]) male(22,30,40,5,2);
    }
}

module print(){
    translate([0,0,0])difference(){
        translate([0,0,-1])rotate([0,-90,0])stallLockBobbin();
        translate([-100,-100,-200]) cube(200);
    }
    //translate([50,0,0])rotate([0,-90,0])male(22,30,60,3,1.5);
}

bobbinClip();