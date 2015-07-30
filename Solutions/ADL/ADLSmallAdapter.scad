module ADLAdapter(w,l,h,t){
    difference(){
        cube([w,l,h]);
        translate([t,t,t]) cube([w-2*t,l-2*t,h-t]);
    }
}

ADLAdapter(40,40, 70,3);