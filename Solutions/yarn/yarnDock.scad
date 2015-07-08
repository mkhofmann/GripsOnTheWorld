use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\LockingMechanisms\\beltclip.scad>;

module yarnhook(){
    union(){
        cube([10,10,24]);
        cube([24,10,8]);
        translate([16,0,0]) cube([8,10,16]);
    }
}

//yarnhook();

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

yarnDock();
