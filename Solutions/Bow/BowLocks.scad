use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
//use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\LockingMechanisms\\rotationLock.scad>;
use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\LockingMechanisms\\pinLock.scad>;
module bowSpring(){
    difference(){
        translate([2.5,-3,25])rotate([90,0,0])import("bowholder_spring_v1.stl", 3);
        translate([-100,0,0])cube(100);
        translate([0,-100,0]) cube(100);
        translate([0,0,-100]) cube(100);
        translate([-100,0,-100]) cube(100);
        translate([-100,-100,0]) cube(100);
        translate([0,-100,-100]) cube(100);
        translate([-100,-100,-100]) cube(100);
    }
    
}
module endOfWristAdaptorCube(){
    rotate([0,-90,0]) union(){
        translate([0,0,-41.5])cube([18, 41.5,41.5]);
        bowSpring();
    }
}
module endOfWristAdaptorCyl(){
    rotate([0,-90,0])union(){
        bowSpring();
        translate([18,20.75,0])rotate([0,-90,0]) difference(){
            cylinder(r=20.75,h=18);
            translate([0,-20.75,0]) cube([20.75,41.5,18]);
        }
    }
}

module endOfWristAdaptorShelf(){
union(){
    bowSpring();
    translate([0,0,-5]) cube([40, 40,5]);
}
}

//endOfWristAdaptorShelf();

//LEGOS
module legoMEndOfWristCube(){
    union(){
        endOfWristAdaptorCube();
        intersection(){
            translate([0,0,4])endOfWristAdaptorCube();
            translate([-4,-4,18]) fillMale(60,60);   
        }
    }
}
module legoFEndOfWristCube(){
    union(){
        endOfWristAdaptorCube();
        intersection(){
            translate([0,0,3])endOfWristAdaptorCube();
            translate([-4,-4,18]) fillFemale(60,60);   
        }
    }
}
module legoMEndOfWristCyl(){
    union(){
        endOfWristAdaptorCyl();
        intersection(){
            translate([0,0,1.8]) endOfWristAdaptorCyl();
            translate([0,0,18]) fillMale(41.5,41.5);
        }
    }
}

module legoFEndOfWristCyl(){
    union(){
        endOfWristAdaptorCyl();
        intersection(){
            translate([0,0,4]) endOfWristAdaptorCyl();
            translate([-4,-4,18]) fillFemale(60,60);
        }
    }
}

module legoMEndOfWristShelf(){
    union(){
        endOfWristAdaptorShelf();
        intersection(){
            translate([0,0,1.8]) endOfWristAdaptorShelf();
            translate([20,0,0]) fillMale(36,56);
        }
    }
}

module legoFEndOfWristShelf(){
    union(){
        endOfWristAdaptorShelf();
        intersection(){
            translate([0,0,4]) endOfWristAdaptorShelf();
            translate([22,0,0]) fillFemale(36,56);
        }
    }
}



legoFEndOfWristCube();

//Locks
module rotationLock(){
    union(){
        endOfWristAdaptorCyl();
        translate([20.75,20.75,18]) rotate([0,0,90]) male(20.75, 5, 13, 15, 2,1.5);
        translate([20.75, 20.75]) cylinder(r=20.75, h=18);
    } 
}

//rotationLock();
module pinLock(){
    union(){
        bowSpring();
        female(40,40,40,3,5,2);
    }
}

//pinLock();
