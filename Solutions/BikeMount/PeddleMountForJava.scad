module pedalMountHole(){
    union(){
        cylinder(r=14,h=25);
        translate([0,0,25]) cylinder(r=3.5, h=10);
    }
}

module pedalBlock(w,d){
   difference(){
       translate([0,0,35/2])cube([w,d,35],center=true);
       pedalMountHole();
   } 
}

pedalBlock(40,40);