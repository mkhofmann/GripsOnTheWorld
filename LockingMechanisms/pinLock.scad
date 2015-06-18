use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
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
        translate([w/2,(d-t)/3,0]) cylinder(r=r+s, h=h);
        translate([w/2,(d-t)/3*2,0]) cylinder(r=r+s, h=h);
        translate([t,-t,t]) cube([w-2*t,d+s,h-2*t]);
    }
}

module legoMFemale(w,h,d,t,r,s){
union(){
    female(w,h,d,t,r,s);
    intersection(){
        translate([0,1.8,0]) female(w,h,d,t,r,s);
        translate([0,d+1.8,0])rotate([90,0,0]) fillMale(w+8,h+8); 
    }
    intersection(){
        translate([-1.8,0,0]) female(w,h,d,t,r,s);
        rotate([0,-90,0]) fillMale(h+8, d+8);
    }
    intersection(){
        translate([1.8,0,0]) female(w,h,d,t,r,s);
        translate([w+1.8,0,0]) rotate([0,-90,0]) fillMale(h+8,d+8);
    }
    
}
}
module legoFFemale(w,h,d,t,r,s){
union(){
    female(w,h,d,t,r,s);
    intersection(){
        translate([0,4,0]) cube([w,d,h]);
        translate([0,d+4,0])rotate([90,0,0]) fillFemale(w+16,h+16); 
    }
}
}
    
//width,height,depth (x,z,y), thickness, radius of pin, dimmensions from female
//prints male portion of attachment mechanism
//translation hovers in space of related female model.
//USAGE: for easy manipulation request a translation module
//dimmensions must match female part.
module male(w,h,d,r,s,t){
    difference(){
       translate([t+s,-t-s,t+s]) cube([w-2*t-2*s,d,h-2*t-2*s]);
       translate([w/2,(d-t)/3,0]) cylinder(r=r+s, h=h);
        translate([w/2,(d-t)/3*2,0]) cylinder(r=r+s, h=h);
    }
}   
module legoMMale(w,h,d,t,r,s){
union(){
   male(w,h,d,t,r,s);
   intersection(){
       translate([0,-1.8-t,0]) male(w,h,d,t,r,s);
       translate([0,-t,0])rotate([90,0,0]) fillMale(w,h);
    }
}
}
module legoFMale(w,h,d,t,r,s){
union(){
        male(w,h,d,t,r,s);
        intersection(){
            translate([0,-4-t,0]) male(w,h,d,t,r,s);
            translate([0,-t,0])rotate([90,0,0]) fillFemale(w+16,h+16);
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
    translate([0,0,h]) cube([w,d,t]);//top
    translate([w/2,d/3,0])cylinder(r=r,h=h);
    translate([w/2,d*2/3,0]) cylinder(r=r,h=h); 
}
}

//models all other parts with matching dimmensions
module model(w,h,d,t,r,s){
    female(w,h,d,t,r,s);
    male(w,h,d,t,r,s);
    //pin(w,h,d,t,r,s);
}
//models matching parts in easy to print configuration
module printable(w,h,d,t,r){
    translate([0,0,d])rotate([-90,0,0]) female(w,h,d,t,r);
    translate([w+5,0,-t-.125]) male(w,h,d,t,r);
    translate([d,d+w+5,h+t]) rotate([0,180,90])pin(w,h,d,t,r);
}

pin(40,40,65,6,10,1.5);
//pin(40,40,65,6,5,1.5);
//legoFMale(30,30,40,3,2,1.5);
