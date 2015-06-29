include<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
//From the model viewing angle. Slides down into system then is pulled back to lock into all directions accept forward. Can be repositioned for user ability and nees. 
//w: width (x direction) of small rod
//w1: width (x direction) of large locking head
//d: depth (z direction) of rod
//d1: depth (z direction) of head
//l: length (y direction) of rod
//l1: length (y direction) of head
module male(w, w1, d, d1, l, l1){
translate([0,l,0]) union(){
   cube([w1, l1,d1]);
   translate([(w1-w)/2, -l*2-lmh, (d1-d)/2])cube([w,l+lmh,d]); 
   translate([(w1-w)/2, -l, (d1-d)/2])cube([w,l1,d]);
}
}
module legoMMale(w,w1,d,d1,l,l1){
union(){
    male(w,w1,d,d1,l,l1);
    intersection(){
        translate([0,-lmh,0]) male(w,w1,d,d1,l,l1);
        translate([0,-lmh-l,0]) rotate([90,0,0])fillMale(w, d1);
    }
}
}
module legoFMale(w,w1,d,d1,l,l1){
union(){
    male(w,w1,d,d1,l,l1);
    intersection(){
        translate([0,-lfh,0]) male(w,w1,d,d1,l,l1);
        translate([0,-lmh-l,0]) rotate([90,0,0])fillFemale(w, d1);
    }
}
}
//dimmensions must match male part
//tw: thickness of walls in x direction
//td: thickness of walls in z direction
//s: spacing between male and female parts. For friction and printer ability
module female(w, w1, d, d1, l, l1,tw,td,tl,s){
difference(){
    cube([w1+2*s+2*tw, l+l1+l1+s+tl, d1+2*s+2*td]);
    translate([tw,0,td]) male(w+2*s, w1+2*s, d+2*s, d1+2*s, l+s, l1+s); 
    translate([tw,l,td]) male(w+2*s, w1+2*s, d+2*s, d1+2*s, l+s, l1+s); 
    translate([tw,l+l1+s,td+2*s+d1])cube([w1+2*s,l1+s, td]);
    translate([tw+(w1-w)/2,0,td+(d1-d)/2]) cube([w+2*s,l+s+l1,td+2*s+d1]);
}
}

module legoMFemale(w, w1, d, d1, l, l1,tw,td,tl,s){
union(){
    female(w, w1, d, d1, l, l1,tw,td,tl,s);
    intersection(){
        translate([0,lmh,0]) cube([w1+2*s+2*tw, l+l1+l1+s+tl, d1+2*s+2*td]);
        translate([0,l+l1+l1+s+tl+lmh,0]) rotate([90,0,0]) fillMale(w1+2*s+2*tw,d1+2*s+2*td);
    }

}
}
module legoFFemale(w, w1, d, d1, l, l1,tw,td,tl,s){
union(){
    female(w, w1, d, d1, l, l1,tw,td,tl,s);
    intersection(){
        translate([0,lfh,0]) cube([w1+2*s+2*tw, l+l1+l1+s+tl, d1+2*s+2*td]);
        translate([0,l+l1+l1+s+tl+lfh,0]) rotate([90,0,0]) fillFemale(w1+2*s+2*tw,d1+2*s+2*td);
    }

}
}

//demonstrates model
module model(w, w1, d, d1, l,l1,tw,td,tl,s){
    female(w, w1, d, d1,l,l1,tw,td,tl,s);
    translate([tw+s,0,td+s]) male(w, w1, d, d1,l,l1);
}

legoFMale(16,25,16,25,10,10,10,10,5,1.5);
//makes model easy to print
module print(w, w1, d, d1,l,l1,tw,td,s){
    rotate([90,0,0]) female(w, w1, d, d1,l,l1,tw,td,s );
    translate([0, 5, l+l1]) rotate([-90,0,0]) male(w, w1, d, d1,l,l1);
}

