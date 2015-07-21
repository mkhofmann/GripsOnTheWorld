module lock(wn,w,d,s){//d and h make square
    union(){
    difference(){
        cube([w,d,d]);
        union(){//arm insert
        translate([0,d/4-s,d/4-s]) cube([wn,d/2+2*s,d/2+2*s]);//neck
        translate([wn,d/4-8-s,d/4-8-s]) cube([10+s,d/2+16+2*s,d/2+16+2*s]);//head
        translate([wn+10,d/4-8-s,d/4-8-s]) cube([10+s,d/2+16+2*s,d+8+s]);//head slot
        translate([0,d/4-s,d/4-s]) cube([wn+20,d/2+2*s,d+s]);//neck slot
        }
        union(){//tumbler
            translate([wn+20,d/4-s,d/4-s]) cube([40,d/2+2*s, d+s]);//block
            translate([wn+20,d/4-8-s, d/2-s]) cube([40,d/2+16+2*s, 10+2*s]);//stablizer
        }
    }
    translate([wn+58,d/2, d*3/4-s]) rotate([0,90,0])cylinder(r=3, h=2);
    translate([wn+58,d/2, d*2/4-s]) rotate([0,90,0])cylinder(r=3, h=2);
    }
}
    


module key(wn,w,d,s){
   union(){//arm insert
       translate([-4,d/4,d/4]) cube([4,d/2,d/2]);
       translate([-20,d/4,d/4]) cube([wn+20,d/2,d/2]);
       translate([wn,d/4-8,d/4-8]) cube([8,d/2+16,d/2+16]);
   } 
}



module tumbler(wn,w,d,s){
   difference(){
    union(){//tumbler
       translate([wn+21.5+s,d/4,d/4]) cube([37-s-1.5,d/2, d]);
       translate([wn+35,d/4-8, d/2]) cube([10,d/2+16, 10]);
   }
    translate([wn+53,d/2, d*3/4-s]) rotate([0,90,0])cylinder(r=3.5, h=4);
    translate([wn+53,d/2, d*2/4-s]) rotate([0,90,0])cylinder(r=3.5, h=4);
   }
}

module model(wn,w,d,s){
    key(wn,w,d,s);
    translate([0,0,0]) tumbler(wn,w,d,s);
    lock(wn,w,d,s);
}

tumbler(30,100,51,1.5);


//cut to print