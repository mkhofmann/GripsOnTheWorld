module lock(wn,w,d,s){//d and h make square
    union(){
    difference(){
        cube([w,d,d]);
        union(){//arm insert
        translate([0,d/4-s,d/4-s]) cube([wn,d/2+2*s,d/2+2*s]);
        translate([wn,d/4-8-s,d/4-8-s]) cube([10+s,d/2+16+2*s,d/2+16+2*s]);
        translate([wn+10,d/4-8-s,d/4-8-s]) cube([10+s,d/2+16+2*s,d+8+s]);
        translate([0,d/4-s,d/4-s]) cube([wn+20,d/2+2*s,d+s]);
        }
        union(){
            translate([wn+20,d/4-s,d/4-s]) cube([30+s,d/2+2*s,d/2+s]); 
            translate([wn+40,d/4-s,d/4-s]) cube([20+s,d/2+2*s,3/4*d+s]);
        }
    }
    translate([wn+60,d/2, d/2]) rotate([0,90,0])cylinder(r=3.5, h=2);
    }
}
    


module key(wn,w,d,s){
   union(){//arm insert
       translate([-4,d/4,d/4]) cube([4,d/2,d/2]);
       translate([0,d/4,d/4]) cube([wn,d/2,d/2]);
       translate([wn,d/4-8,d/4-8]) cube([10,d/2+16,d/2+16]);
   } 
}



module tumbler(wn,w,d,s){
    union(){
            translate([wn+10+s,d/4,d/4]) cube([30,d/2,d/2]); 
            difference(){
                translate([wn+40,d/4,d/4]) cube([8,d/2,3/2*d]);
                translate([wn+44,d/2, d/2]) rotate([0,90,0]) cylinder(r=5.5, h=4);
            }
        }
}

module model(wn,w,d,s){
    key(wn,w,d,s);
    translate([0,0,0]) tumbler(wn,w,d,s);
    lock(wn,w,d,s);
}

lock(30,100,51,1.5);

//printTumbler(30,100,51,1.5);
module printTumbler(wn,w,d,s){
    translate([wn+10+s,d/4,d/4]) cube([30,d/2,d/2]); 
    translate([10,0,0]) difference(){
                translate([wn+40,d/4,d/4]) cube([8,d/2,3/2*d]);
                translate([wn+44,d/2, d/2]) rotate([0,90,0]) cylinder(r=5.5, h=4);
            }
}

//cut to print