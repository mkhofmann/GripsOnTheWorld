include<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;

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

module mount(w,h,t){
    cube([w,t,h]);
}

module mountingClip(w,h,t){
    translate([w,0,0])union(){
        clip(w,h,t);
        translate([-w,2*t,0]) mount(w,h,t);
    }
}

boxClip(40,40,4);   

module boxClip(w,h,t){
    translate([w,0,0])union(){
        clip(w,h,t);
        difference(){
            translate([-w,2*t,0]) cube([w,40,h]);
            translate([-w+t,3*t,t]) cube([w-2*t,40-t,h-2*t]);
        }
    }
}