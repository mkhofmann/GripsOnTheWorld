
module gauntlet(){
translate([22,-145,0])rotate([90,0,0]) import("lego_cuff_blank.stl", 3);
}
//gauntlet();
t=4;
module elaineGauntlet(){
    difference(){
    union(){
     difference(){
        cylinder(r=45+t, h=35);
        cylinder(r=45, h=35);
     }   
     translate([0, 0,35])difference(){
       cylinder(r1=45+t, r2=40+t, h=65);
       cylinder(r1=45, r2=40, h=65);
     }
     translate([0, 0,100])difference(){
        cylinder(r1=40+t, r2=25+t, h=75);
        cylinder(r1=40, r2=25, h=75);
     }
    }
    translate([-45-t, -45-t, 0]) cube([90+2*t,45+t,190]);
    }
}

elaineGauntlet();
