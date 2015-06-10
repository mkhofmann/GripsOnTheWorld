use<stallLock.scad>;

module arch(t,r,h){
    difference(){
        cylinder(r=r, h=h);
        cylinder(r=(r-t), h=h);
        translate([-r,-r,0]) cube([r, 2*r, h]);
    }
}

module clip(w, h,t){
    rotate([0,-90,0]) union(){
       cylinder(r=t, h=w);
       translate([0,-t,0])cube([h,t,w]);
       translate([h, t, 0]) arch(t,2*t, w);
    }
    
}
//mountingClip(60,50,3);
module mount(w,h,t){
    cube([w,t,h]);
}

module mountingClip(w,h,t){
    union(){
        clip(w,h,t);
        translate([-w,2*t,0]) mount(w,h,t);
    }
}
