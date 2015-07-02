module knifeGuard(zs){
    difference(){
    union(){
        scale([1,1,zs])import("KNIFEGUARD.stl",3);
        translate([0,-20,0]) cylinder(r=20,h=40*zs);
    }
    translate([-20,-40,0]) cube([40,20,40*zs]);
    }
}

knifeGuard(2);