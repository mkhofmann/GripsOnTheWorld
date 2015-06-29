include<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
//USAGE: This model needs to have spacing and custom spacing adjusted. Pins are too tight to slide into model. 

//prints female portion of attachment mechanism
//can either be attached to prosthetic or connecting object
//w: width of block in x direction
//h: height of block in z direction
//d: depth of block in y direction
//t: thickness of walls
//r: radius of pin holes
module female(w,h,d,t,r,s){
    difference(){
        cube([w,d,h]);
        translate([w/2-r-s,(d-t)/2-r-s,0]) cube([2*(r+s),2*(r+s),h]);
        translate([t,-t,t]) cube([w-2*t,d+s,h-2*t]);
    }
}

module legoMFemale(w,h,d,t,r,s){
union(){
    female(w,h,d,t,r,s);
    intersection(){
        translate([0,lmh,0]) cube([w,d,h]);
        translate([0,d+lmh,0])rotate([90,0,0]) fillMale(w,h); 
    }
    
}
}
module legoFFemale(w,h,d,t,r,s){
union(){
    female(w,h,d,t,r,s);
    intersection(){
        translate([0,lfh,0]) cube([w,d,h]);
        translate([0,d+lfh,0])rotate([90,0,0]) fillFemale(w,h); 
    }
}
}
    
//width,height,depth (x,z,y), thickness, radius of pin, dimmensions from female
//prints male portion of attachment mechanism
//translation hovers in space of related female model.
//USAGE: for easy manipulation request a translation module
//dimmensions must match female part.
module male(w,h,d,t,r,s){
    difference(){
       translate([t+s,-t,t+s]) cube([w-2*t-2*s,d,h-2*t-2*s]);
       translate([w/2-r-s,(d-t)/2-r-s,0]) cube([2*(r+s),2*(r+s),h]);
    }
}   
module legoMMale(w,h,d,t,r,s){
union(){
   male(w,h,d,t,r,s);
   intersection(){
       translate([0,-t,0]) male(w,h,d,t,r,s);
       translate([0,-t,0])rotate([90,0,0]) fillMale(w,h);
    }
}
}
module legoFMale(w,h,d,t,r,s){
union(){
   male(w,h,d,t,r,s);
   intersection(){
       translate([0,-lfh,0]) male(w,h,d,t,r,s);
       translate([0,-t,0])rotate([90,0,0]) fillFemale(w,h);
    }
}
}
//Builds 3rd pin part that slides into male and female parts to lock into place, requires minimal dexterity in a seperate arm
//Usage: spacing nees to be adjusted in this model to slide easily into place
//Usage: orients pin model to fit into represenation of the full mechanism
//Request translation mechanism for easy use
//Dimmensions must match male and female parts
module pin(w,h,d,t,r,s){
union(){
    translate([0,-t,h]) cube([w,d,t]);//top
    translate([w/2-r,(d-t)/2-r,0]) cube([2*r,2*r,h]); 
}
}

//models all other parts with matching dimmensions
module model(w,h,d,t,r,s){
   female(w,h,d,t,r,s);
   male(w,h,d,t,r,s);
   pin(w,h,d,t,r,s);
}

pin(40,25,25,4,4,1.5);
