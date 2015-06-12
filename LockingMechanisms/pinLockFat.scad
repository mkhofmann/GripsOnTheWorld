module female(w,h,d,t,r,s){
   difference(){
       cube([w,d,h]);
       translate([t,0,t]) cube([w-2*t,d-t, h-2*t]);
       translate([w/3,d/2,0]) cylinder(r=r+s, h=h);
       translate([w*2/3, d/2, 0]) cylinder(r=r+s, h=h);
   } 
}
module male(w,h,d,t,r,s){
    difference(){
        translate([t+s,0,t+s])cube([w-2*t-2*s,d-t-s, h-2*t-2*s]);
        translate([w/3,d/2,0]) cylinder(r=r, h=h);
        translate([w*2/3, d/2, 0]) cylinder(r=r,h=h);
    }
}

module pin(w,h,d,t, r,s){
    union(){
        translate([w/3,d/2,0]) cylinder(r=r, h=h);
        translate([w*2/3, d/2, 0]) cylinder(r=r,h=h);
        translate([0,0,h]) cube([w, d, t]);
    }
}

female(30,20,20,3, 3,2);
male(30,20,20,3, 3,2);
pin(30,20,20,3, 3,2);