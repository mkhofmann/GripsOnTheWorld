use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\LockingMechanisms\\beltclip.scad>;

module yarnhook(){
    union(){
        cube([4, 4,12]);
        cube([12,4,4]);
        translate([8,0,0]) cube([4,4,8]);
    }
}

//yarnhook();

module yarnDock(){
    difference(){
    union(){
        cylinder(r=40, h=10);
        for(i=[0:90:270]){
            rotate([0,0,i]) translate([-39,-2,-12]) yarnhook();
        }
    cylinder(r=3, h=10);
    }
    }
}

yarnDock();

module yarnDockClip(){
    union(){
        translate([8,-40,40]) rotate([0,0,-45]) yarnDock();
        translate([0,0,-12]) rotate([90,0,0]) mountingClip(50,50,4);
    }
}

module printClip(){
  mountingClip(50,50,4);  
}