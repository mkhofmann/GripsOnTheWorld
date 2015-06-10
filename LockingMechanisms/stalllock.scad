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

//Male portion to slide into female lock. 
//Dimmensions must match female part
//S: spacing between male and female parts. Will effect friction and should be decided by printer accuracy
module male(w,h,d,t,s){
union(){
    cube([w-2*t-2*s,d, h-2*t-2*s]);
    translate([0,0, (h-2*t)/3]) cube([3/2*w,d,(h-t*2)/3 -2*s]);
}
}
male(22,30,60,3,1.5);
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