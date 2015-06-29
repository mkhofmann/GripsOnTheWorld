include<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;

module cutQuadrant(x){
union(){
    translate([-x,0,0])cube(x);
    translate([0,-x,0]) cube(x);
    translate([0,0,-x]) cube(x);
    translate([-x,0,-x]) cube(x);
    translate([-x,-x,0]) cube(x);
    translate([0,-x,-x]) cube(x);
    translate([-x,-x,-x]) cube(x);
}
}

module bowSpring(){
difference(){
    translate([15.5,44,25])rotate([90,0,180])import("bowholder_spring_v1.stl", 3);
     cutQuadrant(45);
    translate([0,8.5,8.5])rotate([0,90,0]) cylinder(r=2,h=30);
    
}    

}
module endOfWristAdaptorCube(){
    rotate([0,-90,0]) union(){
        translate([0,0,-25])cube([18, 41.5,25]);
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
    translate([0,0,-8]) cube([40, 40,8]);
}
}

//endOfWristAdaptorCube();

//LEGOS
module legoMEndOfWristCube(){
    union(){
        endOfWristAdaptorCube();
        intersection(){
            translate([0,0,lmh])endOfWristAdaptorCube();
            translate([4,4,18]) fillMale(40,40);   
        }
    }
}
//legoFEndOfWristCube();
module legoFEndOfWristCube(){
    union(){
        endOfWristAdaptorCube();
        intersection(){
            translate([0,0,lfh])endOfWristAdaptorCube();
            translate([4,4,18]) fillFemale(40,40);   
        }
    }
}
module legoMEndOfWristCyl(){
    union(){
        endOfWristAdaptorCyl();
        intersection(){
            translate([0,0,lmh])endOfWristAdaptorCyl();
            translate([0,0,18]) fillMale(40,40);   
        }
    }
}
legoMEndOfWristShelf();
module legoFEndOfWristCyl(){
    union(){
        endOfWristAdaptorCyl();
        intersection(){
            translate([0,0,lfh])endOfWristAdaptorCyl();
            translate([4,4,18]) fillFemale(40,40);   
        }
    }
}

module legoMEndOfWristShelf(){
    union(){
        endOfWristAdaptorShelf();
        intersection(){
            translate([0,0,lmh]) endOfWristAdaptorShelf();
            translate([20,0,0]) fillMale(36,56);
        }
    }
}

module legoFEndOfWristShelf(){
    union(){
        endOfWristAdaptorShelf();
        intersection(){
            translate([0,0,lfh]) endOfWristAdaptorShelf();
            translate([22,0,0]) fillFemale(36,56);
        }
    }
}
