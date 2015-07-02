module pin(t,w,d,h){//uncapped tail
    union(){
        cube([t,d+2*t, h+2*t]);
        translate([t,t,0]) cube([w,d,h]);
    }
}

translate([0,6,6]) pin(5,20,5,5);

module walls(t,w,d,h,s){
    union(){
    difference(){//head
        cube([t,d+4*t,h+4*t]);
        translate([0,t,t]) pin(t+s,w,d,h);
    }
    translate([-t,0,0]) cube([t,d+4*t,h+4*t]);
    }
    union(){
    difference(){//pin
        translate([w+t,0,0]) cube([t,d+4*t,h+4*t]);
        translate([t,t-s,t]) pin(t+s,w,d+2*s,h+2*s);
    }
    translate([w,0,0]) difference(){//head
        cube([t,d+4*t,h+4*t]);
        translate([0,t,t]) pin(t+s,w,d,h);
    }
    }
}

walls(5,20,5,5,1);

