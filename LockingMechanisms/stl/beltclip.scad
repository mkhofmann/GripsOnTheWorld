use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;

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

module legoMClip(w,h,t){
    translate([0,0,t])rotate([90,0,0])union(){
        mountingClip(w,h,t);
        translate([0,t*3+1.8,0])rotate([90,0,0]) fillMale(w,h);
    }
}
module legoFClip(w,h,t){
    translate([0,0,t]) rotate([90,0,0])union(){
        mountingClip(w,h,t);
        translate([0,t*3+8.6,0])rotate([90,0,0]) fillFemale(w,h);
    }
}
legoFClip(60,50,3);   