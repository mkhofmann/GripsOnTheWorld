use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\LockingMechanisms\\beltclip.scad>;
module bowl(){
    import("YarnBowlSubtlePoly.stl", 3);
}
clipBowl();

module mountedBowl(){
    union(){
        bowl();
        difference(){
            translate([-30,30,0]) cube([60,30,60]);
            translate([0,0,50])sphere(r=60);
        }
    }
}

module clipBowl(){
    union(){
        mountedBowl();
        translate([-30,66,1.5]) rotate([0,0,180]) mountingClip(60,60,3);
    }
}