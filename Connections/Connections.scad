use<LegoSide.scad>;
module LegoFemale(w,h){
union(){
difference(){
    cube([w,h,9.5]);
    translate([1.5,1.5,1.5]) cube([w-3,h-3, 8]);
}
    translate([0,0,1.5]) fillFemale(w,h);
}
}
//LegoFemale(31.8,15.8);
module LegoMale(w,h,d){
   union(){
        cube([w,h,d]);
        translate([0,0,d]) fillMale(w,h);
    }
}
//LegoMale(31.8,15.8,9.5);
module TinkerMale(){
difference(){
    cylinder(r=3.125,h=12);
    translate([-.5,-3.125,6]) cube([1,6.25,6]);
}
}
//TinkerMale();
module TinkerFemale(){//functional
rotate([90,0,0])difference(){
    cylinder(r=16,h=16);
    translate([-16,-16,0]) cube([32,16,16]);
   for(i=[-45:45:45]){
        rotate([0,0,i]) translate([0,16,8]) rotate([90,0,0]) cylinder(r=3.5, h=10);
    }
}
}
//TinkerFemale();
module TinkerFemaleSphere(){
difference(){
    sphere(r=16);
    translate([-16,-16,-16]) cube([32,32,16]);
    for(i=[-45:45:45]){
        rotate([i,0,0])translate([0,0,6]) cylinder(r=3.5, h=10);
        rotate([0,i,0])translate([0,0,6]) cylinder(r=3.5, h=10);
        rotate([i,0,45])translate([0,0,6]) cylinder(r=3.5, h=10);
        rotate([i,0,-45])translate([0,0,6]) cylinder(r=3.5, h=10);
    }
}
}
//TinkerFemaleSphere();
module ZoobMale(){
   union(){
        cylinder(r=2.65,h=5);
        translate([0,0,3+9.15]) sphere(r=9.15);
    }
}
ZoobMale();
module ZoobFemale(){
translate([0,0,13])difference(){
    union(){
        translate([0,0,-13.5]) cylinder(r=7, h=5.5);
        sphere(r=10.5);
    }
    sphere(r=9.5);
    translate([-5.9,-10.5,-6]) cube([11.8,21,20]);
}
}
//ZoobFemale();
        