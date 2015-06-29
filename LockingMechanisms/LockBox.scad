include<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
module female(w,h,d,t,s){
    difference(){
        cube([w,d,h]);
        translate([t,t,t]) cube([w-t,d-t*2, h-t*2]);
        translate([t,0,2*t]) cube([w-t,t,h-t*4]);
        translate([w-t*2,t,0]) cube([t,d-2*t,h]);
    }
}


module legoFFemale(w,h,d,t,s){
    union(){
    female(w,h,d,t,s);
    intersection(){
        translate([0,lfh,0]) cube([w,d,h]);
        translate([0,lfh+d,0]) rotate([90,0,0]) fillFemale(w,h);
    }
    }
}

module legoMFemale(w,h,d,t,s){
    union(){
    female(w,h,d,t,s);
    intersection(){
        translate([0,lmh,0]) cube([w,d,h]);
        translate([0,lmh+d,0]) rotate([90,0,0]) fillMale(w,h);
    }
    }
}
module male(w,h,d,t,s){
    union(){
        translate([t+s,t+s,t+s]) cube([w-t*2-t-s,d-t*2-2*s, h-t*2-2*s]);
        translate([t+s,0,2*t+s]) cube([w-t*2-t-s,t+s,h-4*t-2*s]);
    }
}

module legoMMale(w,h,d,t,s){
    union(){
        male(w,h,d,t,s);
        translate([t+s,-t,0]) cube([w-t*2-t-s,t,h]);
        intersection(){
            translate([t+s,-t-lmh,0]) cube([w-t*2-t-s,t,h]);
            translate([0,-t,0]) rotate([90,0,0]) fillMale(w,h);
        }
    }
}

module legoFMale(w,h,d,t,s){
    union(){
        male(w,h,d,t,s);
        translate([t+s,-t,0]) cube([w-t*2-t-s,t,h]);
        intersection(){
            translate([t+s,-t-lfh,0]) cube([w-t*2-t-s,lfh,h]);
            translate([0,-t,0]) rotate([90,0,0]) fillFemale(w,h);
        }
    }
}

module lock(w,h,d,t,s){
    union(){
        translate([w-t*2+s,t+s,0]) cube([t-2*s,d-2*t-2*s,h]);
        translate([0,0,h]) cube([w,d,t]);
    }
}

module model(w,h,d,t,s){
    male(w,h,d,t,s);
    female(w,h,d,t,s);
    lock(w,h,d,t,s);
}
legoFMale(31,38,24,7,1.5);