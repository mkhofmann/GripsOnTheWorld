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
    intersection(){
        translate([0,-5-1.8,0]) cube([w1,5,d1]);
        translate([0,-5,0]) rotate([90,0,0]) fillMale(w1+8,d1+8);
    }
}
}
module legoFMale(w,w1,d,d1,l,l1){
union(){
    male(w,w1,d,d1,l,l1);
    translate([0,-5,0]) cube([w1,5,d1]);
    intersection(){
        translate([0,-5-4,0]) cube([w1,5,d1]);
        translate([0,-5,0]) rotate([90,0,0]) fillFemale(w1+16,d1+16);
    }
}
}
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
    intersection(){
        translate([0,1.8,0]) female(w, w1, d, d1, l, l1,tw,td,s);
        translate([0,l+l1+l1+s+1.8,0]) rotate([90,0,0]) fillMale(w1+2*s+2*tw+16,d1+2*s+2*td+16);
    }
    intersection(){
        translate([-1.8,0,0]) cube([w1+2*s+2*tw, l+l1+l1+s, d1+2*s+2*td]);
        rotate([0,-90,0]) fillMale(d1+2*s+2*td+16, l+l1+l1+s+16);
    }
    intersection(){
        translate([1.8,0,0]) cube([w1+2*s+2*tw, l+l1+l1+s, d1+2*s+2*td]);
        translate([w1+2*s+2*tw+1.8,0,0]) rotate([0,-90,0]) fillMale(d1+2*s+2*td+16, l+l1+l1+s+16);
    }
    intersection(){
        translate([0,0,-1.8]) cube([w1+2*s+2*tw, l+l1+l1+s, d1+2*s+2*td]);
        translate([0,0,-1.8]) fillMale(w1+2*s+2*tw+16, l+l1+l1+s+16);
    }   
}
}
module legoFFemale(w, w1, d, d1, l, l1,tw,td,s){
union(){
    female(w, w1, d, d1, l, l1,tw,td,s);
    intersection(){
        translate([0,4,0]) female(w, w1, d, d1, l, l1,tw,td,s);
        translate([0,l+l1+l1+s+4,0]) rotate([90,0,0]) fillFemale(w1+2*s+2*tw+16,d1+2*s+2*td+16);
    }
    intersection(){
        translate([-4,0,0]) cube([w1+2*s+2*tw, l+l1+l1+s, d1+2*s+2*td]);
        rotate([0,-90,0]) fillFemale(d1+2*s+2*td+16, l+l1+l1+s+16);
    }
    intersection(){
        translate([4,0,0]) cube([w1+2*s+2*tw, l+l1+l1+s, d1+2*s+2*td]);
        translate([w1+2*s+2*tw+4,0,0]) rotate([0,-90,0]) fillFemale(d1+2*s+2*td+16, l+l1+l1+s+16);
    }
    intersection(){
        translate([0,0,-4]) cube([w1+2*s+2*tw, l+l1+l1+s, d1+2*s+2*td]);
        translate([0,0,-4]) fillFemale(w1+2*s+2*tw+16, l+l1+l1+s+16);
    }   
}
}

//demonstrates model
module model(w, w1, d, d1, l,l1,tw,td,s){
    female(w, w1, d, d1,l,l1,tw,td,s);
    translate([tw+s,0,td+s]) male(w, w1, d, d1,l,l1);
}

legoMMale(10,15,10,15,10,10,5,5,1.5);

//makes model easy to print
module print(w, w1, d, d1,l,l1,tw,td,s){
    rotate([90,0,0]) female(w, w1, d, d1,l,l1,tw,td,s );
    translate([0, 5, l+l1]) rotate([-90,0,0]) male(w, w1, d, d1,l,l1);
}

