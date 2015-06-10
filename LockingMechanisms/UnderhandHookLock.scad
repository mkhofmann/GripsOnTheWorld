use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
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
   translate([(w1-w)/2, -l, (d1-d)/2])cube([w,l,d]); 
}
}
module legoMMale(w,w1,d,d1,l,l1){
    union(){
        male(w,w1,d,d1,l,l1);
        translate([0,-5,0]) cube([w1,5,d1]);
        translate([0,-5,0]) rotate([90,0,0]) fillMale(w1,d1);
    }
}
module legoFMale(w,w1,d,d1,l,l1){
    union(){
        male(w,w1,d,d1,l,l1);
        translate([0,-5,0]) cube([w1,5,d1]);
        translate([0,-5,0]) rotate([90,0,0]) fillFemale(w1,d1);
    }
}

//legoFMale(22, 44,8,16,22,11);
//dimmensions must match male part
//tw: thickness of walls in x direction
//td: thickness of walls in z direction
//s: spacing between male and female parts. For friction and printer ability
module female(w, w1, d, d1, l, l1,tw,td,s){
difference(){
    cube([w1+2*s+2*tw, l+l1+l1+s, d1+2*s+2*td]);
    translate([tw+(w1-w)/2,0,td+(d1-d)/2]) cube([w+2*s, l, d+2*s+td+(d1-d)/2]);//neck
    translate([tw, l, td]) cube([w1+2*s, l1, d1+s*2]);//head
    translate([tw, l+l1, td]) cube([w1+2*s, l1+s, d1+s*2+ td]);//head slot
    translate([tw+(w1-w)/2, l,td+d1+2*s]) cube([w+2*s,l1, td]); //lock slot    
}
}

module legoMFemale(w, w1, d, d1, l, l1,tw,td,s){
    union(){
        female(w, w1, d, d1, l, l1,tw,td,s);
        rotate([0,-90,0]) fillMale(2*td+d1+s,l+2*l1+s);
        translate([2*tw+w1+2*s+1.8,0,0]) rotate([0,-90,0]) fillMale(2*td+d1+s,l+2*l1+s);
        translate([0,0,-1.8]) fillMale(2*tw+w1+2*s, l+2*l1+s);
    }
}
module legoFFemale(w, w1, d, d1, l, l1,tw,td,s){
    union(){
        female(w, w1, d, d1, l, l1,tw,td,s);
        rotate([0,-90,0]) fillFemale(2*td+d1+s,l+2*l1+s);
        translate([2*tw+w1+2*s+8.6,0,0]) rotate([0,-90,0]) fillFemale(2*td+d1+s,l+2*l1+s);
        translate([0,0,-8.6]) fillFemale(2*tw+w1+2*s, l+2*l1+s);
    }
}

//demonstrates model
module model(w, w1, d, d1, l,l1,tw,td,s){
    female(w, w1, d, d1,l,l1,tw,td,s);
    translate([tw+s,0,td+s]) male(w, w1, d, d1,l,l1);
}

legoFFemale(22, 44,8,16,22,11,22,4,3);

//makes model easy to print
module print(w, w1, d, d1,l,l1,tw,td,s){
    rotate([90,0,0]) female(w, w1, d, d1,l,l1,tw,td,s );
    translate([0, 5, l+l1]) rotate([-90,0,0]) male(w, w1, d, d1,l,l1);
}

