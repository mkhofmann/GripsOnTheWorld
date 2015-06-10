use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
//Sliding locking 
//Requires sidewas motion to lock into vertical position. 
//Design is being altered to be more versital and strong

//Female part for sliding into
//w: widths in x direction
//h: height in z direction
//d: depth in y direction
//t: thickness of walls around male lock
module female(w,h,d,t){
union(){
    cube([w,d,t]);
    cube([t,d,h]);
    translate([0,0,h-t]) cube([w,d,t]);
    translate([w-t,0,0]) cube([t,d,(h-2*t)/3+t]);
    translate([w-t,0,t+(h-2*t)*2/3]) cube([t,d,(h-2*t)/3+t]);
}
}
module legoMFemale(w,h,d,t){
    union(){
        translate([d,0,0,]) rotate([0,0,90])female(w,h,d,t);
        translate([0,0,h]) fillMale(d,w);
        translate([0,0,-1.8]) fillMale(d,w);
        rotate([90,0,0]) fillMale(d,h);
    }
}
module legoFFemale(w,h,d,t){
    union(){
        translate([d,0,0,]) rotate([0,0,90])female(w,h,d,t);
        translate([0,0,h]) fillFemale(d,w);
        translate([0,0,-8.6]) fillFemale(d,w);
        rotate([90,0,0]) fillFemale(d,h);
    }
}
//Male portion to slide into female lock. 
//Dimmensions must match female part
//S: spacing between male and female parts. Will effect friction and should be decided by printer accuracy
module male(w,h,d,t,s){
union(){
    cube([w-2*t-2*s,d, h-2*t-2*s]);
    translate([0,0, (h-2*t)/3]) cube([3/2*w,d,(h-t*2)/3 -2*s]);
}
}
module legoMMale(w,h,d,t,s){
    union(){
        male(w,h,d,t,s);
        translate([3/2*w,0,0]) cube([5,d, h-2*t-2*s]);
        translate([3/2*w+6.8,0,0])rotate([0,-90,0]) fillMale(h-2*t-2*s, d);
    }
}
module legoFMale(w,h,d,t,s){
    union(){
        male(w,h,d,t,s);
        translate([3/2*w,0,0]) cube([5,d, h-2*t-2*s]);
        translate([3/2*w+13.6,0,0])rotate([0,-90,0]) fillFemale(h-2*t-2*s, d);
    }
}

legoFMale(22,30,60,3,2);
//demonstrates lock 
module model(w,h,d,t,s){
    female(w,h,d,t);
    male(w,h,d,t,s);
}


//positions lock into easy to print position.
module print(w,h,d,t,s){
    rotate([90,0,0])female(w,h,d,t);
    translate([w,5,-t-1]) rotate([0,-90,0]) male(w,h,d,t,s);
}