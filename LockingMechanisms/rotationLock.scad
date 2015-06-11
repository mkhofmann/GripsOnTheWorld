use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
//TODO: More Fill of lego sides
//may require a unique pattern and bounds checking algorithm
//complex
//Rotating locking mechanism. Requires forward motion and rotatio ability
//Can be completed with one arm
//Utility module, ignore
module quarterCyl(r,h){
difference(){
    cylinder(r=r,h=h);
    translate([-r,-r,0])cube([r,r,h]);
    translate([0,-r,0]) cube([r,r,h]);
    translate([-r,0,0]) cube([r,r,h]);
}
}

//Female model is a slot for locking mechanism. Space must exist below (in this orientation) the device of at least h to hold the male lock in place
//r: radius of lock
//h: height of female plate
//t: thickness of slot from ir
//tl: thickness of larger lock
//ir: inner radius of slot
module female(r, h, t, t1, ir){
difference(){
    union(){
        cylinder(r=r, h=h);
        difference(){
            cylinder(r=r,h=3*h); 
            cylinder(r=ir+t1+1,h=3*h);
        }
    }
    difference(){
        quarterCyl(r=ir+t, h=h);
        quarterCyl(r=ir, h=h);
    }
    rotate([0,0,180])difference(){
        quarterCyl(r=ir+t, h=h);
        quarterCyl(r=ir, h=h);
    }
    translate([-t/2, ir,0]) cube([t, t1,h]);
    translate([-t/2,-ir-t1,0]) cube([t,t1,h]);
}
}

//for quick lego attachment. 
//Note this needs slicing to be printable
module legoMFemale(r,h,t,t1,ir){
    union(){
        female(r,h,t,t1,ir);
        translate([0,0,h*3]) cylinder(r=r, h=5);
        translate([-r/sqrt(2)+2.2, -r/sqrt(2)+2.2, h*3+5]) fillMale((r*2)/sqrt(2), (r*2)/sqrt(2));
    }
}

module legoFFemale(r,h,t,t1,ir){//TODO: proper centering
union(){
    female(r,h,t,t1,ir);
    translate([0,0,h*3]) cylinder(r=r, h=5);
    translate([-r/sqrt(2), -r/sqrt(2), h*3+5]) fillFemale((r*2)/sqrt(2), (r*2)/sqrt(2));
    }
}
module legoMFemaleSliced(r,h,t,t1,ir){
    translate([2*r+5,0,0]) female(r,h,t,t1,ir);
    cylinder(r=r, h=5);
    translate([-r/sqrt(2)+2.2, -r/sqrt(2)+2.2, 5]) fillMale((r*2)/sqrt(2), (r*2)/sqrt(2));
}

module legoFFemaleSliced(r,h,t,t1,ir){
    translate([2*r+5,0,0]) female(r,h,t,t1,ir);
    cylinder(r=r, h=5);
    translate([-r/sqrt(2)+2.2, -r/sqrt(2)+2.2, 5]) fillFemale((r*2)/sqrt(2), (r*2)/sqrt(2));
}
//Male piece of mechanism slides into place and locks with rotation
//dimmensions must match associate female part
//s: spacing for print quality and snuggness
module male(r, h, t, t1, ir,s){  
union(){
    translate([ir+s, -(t-2*s)/2,h+s]) cube([t1-2*s, t-2*s, h-s]);
    translate([ir+s,0,0]) cube([t-2*s,t/2-s,h+s]);
    translate([-ir-t1+s, -(t-2*s)/2,h+s])cube([t1-2*s, t-2*s, h-s]);
    translate([-ir-t+s,-(t-2*s)/2,0]) cube([t-2*s,t/2-s,h+s]);
    translate([0,0,-h]) cylinder(r=r,h=h);//base
}
}

module legoMMale(r,h,t,t1,ir,s){
    union(){
        male(r,h,t,t1,ir,s);
        translate([-r/sqrt(2)+2.2, -r/sqrt(2)+2.2, -h-1.8]) fillMale((r*2)/sqrt(2), (r*2)/sqrt(2));
    }
}
module legoFMale(r,h,t,t1,ir,s){
    union(){
        male(r,h,t,t1,ir,s);
        translate([-r/sqrt(2)+2.2, -r/sqrt(2)+2.2, -h]) mirror([0,0,1]) fillFemale((r*2)/sqrt(2), (r*2)/sqrt(2));
    }
}
module legoMMaleSliced(r,h,t,t1,ir,s){
    translate([2*r+5,0,h]) male(r,h,t,t1,ir,s); 
   union(){
       cylinder(r=r, h=5);
       translate([-r/sqrt(2)+2.2, -r/sqrt(2)+2.2, 5]) fillMale((r*2)/sqrt(2), (r*2)/sqrt(2));
   }
}
module legoFMaleSliced(r,h,t,t1,ir,s){
   translate([2*r+5,0,h]) male(r,h,t,t1,ir,s); 
   union(){
       cylinder(r=r, h=5);
       translate([-r/sqrt(2)+2.2, -r/sqrt(2)+2.2, 5]) fillFemale((r*2)/sqrt(2), (r*2)/sqrt(2));
   }
}
//legoMMaleSliced(20,10,4,8,5,1.5);
//demonstrates model in operation 
module model(r,h,t,t1,ir,s){
    female(r,h,t,t1,ir);
    male(r,h,t,t1,ir,s);
}
//outputs model in easy to print position
module print(r,h,t,t1, ir,s){
    female(r,h,t,t1,ir);
    translate([2*r+4,0,h]) male(r,h,t,t1,ir,s);
}

//Print with arm measurments

//legoMFemaleSliced(19, 5, 5,10, 5);
legoMMaleSliced(19,5,5,10,5,1);