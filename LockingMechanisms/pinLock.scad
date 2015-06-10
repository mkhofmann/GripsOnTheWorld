use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
//USAGE: This model needs to have spacing and custom spacing adjusted. Pins are too tight to slide into model. 

//prints female portion of attachment mechanism
//can either be attached to prosthetic or connecting object
//w: width of block in x direction
//h: height of block in z direction
//d: depth of block in y direction
//t: thickness of walls
//r: radius of pin holes
module female(w,h,d,t,r){//
difference(){
union(){
    cube([w,d,t]);//base
    cube([t,d,h]);//lhs
    translate([w-t,0,0]) cube([t,d,h]);//rhs
    translate([0,0,h-t]) cube([w,d,t]);//top
    translate([0,d-t,0]) cube([w,t,h]);//back
}
    translate([w/2,d/3,0])cylinder(r=r,h=h);
    translate([w/2,d*2/3,0]) cylinder(r=r,h=h);
}
}
//ignore this module
module legoFemale(w,h,d,t,r){
    union(){
        female(w,h,d,t,r);
        translate([0,d+1.8,0])rotate([90,0,0]) fillMale(w,h);
        translate([-1.8, 0,h]) rotate([0,90,0]) fillMale(w,d);
        translate([w, 0,h]) rotate([0,90,0]) fillMale(w,d);
    }
}
    
//width,height,depth (x,z,y), thickness, radius of pin, dimmensions from female
//prints male portion of attachment mechanism
//translation hovers in space of related female model.
//USAGE: for easy manipulation request a translation module
//dimmensions must match female part.
module male(w,h,d,t,r){
difference(){
    translate([t+.125,0,t+.125]) cube([w-2*t-.25,d-2*t-.25,h-2*t-.25]);
    translate([w/2,d/3,0])cylinder(r=r,h=h);
    translate([w/2,d*2/3,0]) cylinder(r=r,h=h);
}
}   
//Ignore thi module
module legoMale(w,h,d,t,r){
    union(){
        male(w,h,d,t,r);
        translate([t+.125,0,t+.125]) rotate([90,0,0]) fillMale(w-2*t,h-2*t);
    }
}

//Builds 3rd pin part that slides into male and female parts to lock into place, requires minimal dexterity in a seperate arm
//Usage: spacing nees to be adjusted in this model to slide easily into place
//Usage: orients pin model to fit into represenation of the full mechanism
//Request translation mechanism for easy use
//Dimmensions must match male and female parts
module pin(w,h,d,t,r){
union(){
    translate([0,0,h]) cube([w,d,t]);//top
    translate([w/2,d/3,0])cylinder(r=r-.25,h=h);
    translate([w/2,d*2/3,0]) cylinder(r=r-.25,h=h); 
}
}

//models all other parts with matching dimmensions
module model(w,h,d,t,r){
    female(w,h,d,t,r);
    male(w,h,d,t,r);
    pin(w,h,d,t,r);
}
//models matching parts in easy to print configuration
module printable(w,h,d,t,r){
    translate([0,0,d])rotate([-90,0,0]) female(w,h,d,t,r);
    translate([w+5,0,-t-.125]) male(w,h,d,t,r);
    translate([d,d+w+5,h+t]) rotate([0,180,90])pin(w,h,d,t,r);
}

legoFemale(31.8,31.8,63.8,4,5);
