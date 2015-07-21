
module editLower(){
    difference(){
    translate([0,66,0])import("Kharan_cuff_final_lower.stl",3);
        translate([-50,-100,-50]) cube(100);
    }
}

editLower();