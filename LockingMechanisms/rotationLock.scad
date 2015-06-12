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
        translate([0,0,h*3+5]) intersection(){
            cylinder(r=r, h=6.8);
            translate([-3/2*r,-3/2*r, 0])fillMale(3*r,3*r);
        }
    }
}

module legoFFemale(r,h,t,t1,ir){//TODO: proper centering
union(){
        female(r,h,t,t1,ir);
        translate([0,0,h*3]) cylinder(r=r, h=5);
        translate([0,0,h*3+5]) intersection(){
            cylinder(r=r, h=5+8.6);
            translate([-3/2*r,-3/2*r, 0])fillFemale(3*r,3*r);
        }
    }
}
module legoMFemaleSliced(r,h,t,t1,ir){
    difference(){
        legoMFemale(r,h,t,t1,ir);
        translate([0,0,3*h]) cylinder(r=2*r, h=8.6);
    }
    translate([2*r+10,0,-3*h]) intersection(){
        legoMFemale(r,h,t,t1,ir);
        translate([0,0,3*h]) cylinder(r=2*r, h=8.6);
    }
}

module legoFFemaleSliced(r,h,t,t1,ir){
    difference(){
        legoFFemale(r,h,t,t1,ir);
        translate([0,0,3*h]) cylinder(r=2*r, h=8.6+5);
    }
    translate([2*r+10,0,-3*h]) intersection(){
        legoFFemale(r,h,t,t1,ir);
        translate([0,0,3*h]) cylinder(r=2*r, h=8.6+5);
    }
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
        translate([0,0,-h-1.8]) intersection(){
            cylinder(r=r, h=1.8);
            translate([-3/2*r,-3/2*r, 0])fillMale(3*r,3*r);
        }
    }
}
module legoFMale(r,h,t,t1,ir,s){
    union(){
        male(r,h,t,t1,ir,s);
        translate([0,0,-h-8.6]) intersection(){
            cylinder(r=r, h=8.6);
            translate([-3/2*r,-3/2*r, 0])fillFemale(3*r,3*r);
        }
    }
}
module legoMMaleSliced(r,h,t,t1,ir,s){
    translate([0,0,h]) male(r,h,t,t1,ir,s);
    translate([r*2+10,0,0]) cylinder(r=r, h=5);
    translate([r*2+10,0,5]) intersection(){
        cylinder(r=r,h=5);
        translate([-3/2*r,-3/2*r, 0])fillMale(3*r,3*r);
    }
}
module legoFMaleSliced(r,h,t,t1,ir,s){
   translate([0,0,h]) male(r,h,t,t1,ir,s);
    translate([r*2+10,0,0]) cylinder(r=r, h=5);
    translate([r*2+10,0,5]) intersection(){
        cylinder(r=r,h=8.6);
        translate([-3/2*r,-3/2*r, 0])fillFemale(3*r,3*r);
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
legoFFemaleSliced(20.75, 5, 13, 15, 2,1.5);