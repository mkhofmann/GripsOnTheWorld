module magnetHole(){
    translate([5,5,0])cylinder(r=5,h=9);
}

module lock(w,l,n,s){
    difference(){
        cube([w,w,l]);
        translate([w*3/8-s,w*3/8-s,0]) cube([w/4+2*s,w/4+2*s, n]);//neck
        translate([w*5/8-2*s,w*3/8-s,0]) cube([w*3/4+3*s,w/4+2*s,n+24]);//neck slot
        translate([w*3/8-16-s,w*3/8-16-s,n]) cube([w/4+32+2*s,w/4+32+2*s,12]);//head
        translate([w*3/8-16-s,w*3/8-16-s,n+12]) cube([w*3/4+32+2*s,w/4+32+2*s,60]);//head slot
      //Magnets
        translate([w*3/8-13,w*3/8-13,n-9]) magnetHole();
        translate([w*3/8-13,w*5/8+3,n-9]) magnetHole();
        translate([w*5/8+3,w*3/8-13,n-9]) magnetHole();
        translate([w*5/8+3,w*5/8+3,n-9]) magnetHole();
    }
}
module key(w,l,n,s){
    difference(){
    union(){
        translate([w*3/8,w*3/8,-20]) cube([w/4,w/4, n+20]);//neck
        translate([w*3/8-16,w*3/8-16,n]) cube([w/4+32,w/4+32,12]);//head
    }
        //Magnets
        translate([w*3/8-13,w*3/8-13,n]) magnetHole();
        translate([w*3/8-13,w*5/8+3,n]) magnetHole();
        translate([w*5/8+3,w*3/8-13,n]) magnetHole();
        translate([w*5/8+3,w*5/8+3,n]) magnetHole();
    }
}

module model(w,l,n,s){
    lock(w,l,n,s);
    key(w,l,n,s);
}


key(60,98,70,1.5);