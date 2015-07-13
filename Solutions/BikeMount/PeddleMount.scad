module roundEdge(r,h){
    union(){
        cylinder(r=r, h=h);
        translate([0,-r,0]) cube([r,2*r,h]);
    }
}

roundEdge(13,3.2);

module 