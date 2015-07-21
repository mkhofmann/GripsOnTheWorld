use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\LockingMechanisms\\beltclip.scad>;

module yarnhook(){
    union(){
        cube([10,10,24]);
        cube([24,10,8]);
        translate([16,0,0]) cube([8,10,16]);
    }
}

module yarnDock(){
    difference(){
        union(){
            cylinder(r=40, h=10);
            for(i=[0:90:270]){
                rotate([0,90,i]) translate([-10,-5,-62]) yarnhook();
            }
        }
        cylinder(r=3, h=10);
    }
}

//yarnDock();

module yarnBowl(){
    translate([0,0,0]) import("spiralyarnbowl.stl",3);
}

module yarnBowlClip(){
    union(){
        translate([0,0,10]) scale([.6,.6,.6]) yarnBowl();
        translate([-25,25,0]) rotate([90,0,0])mountingClip(50,50,4);
    }
}

yarnBowlClip();
