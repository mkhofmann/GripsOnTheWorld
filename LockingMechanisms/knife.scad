use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\LockingMechanisms\\bistablePullin.scad>;


module knifeGuard(zs){
     difference(){
        scale([1,1,zs])import("KNIFEGUARD.stl",3);
        translate([-20,-40,0]) cube([40,40,40*zs]);
    }
}

module knifeGuardCustom(s,l){
    rotate([-90,0,90]) difference(){
        cylinder(r=20,h=l);
        translate([-20,-20,0]) cube([40,20,l]);
        translate([-s/2,,0]) cube([s,20,l]);
    }
}

knifeGuardLock();

module knifeGuardLock(){//kharan's measurements
    union(){
        lock(30,95,51,1.5);
        translate([95,25,0]) knifeGuardCustom(4.15,95); 
    }
}
//knifeGuard(2.5);
