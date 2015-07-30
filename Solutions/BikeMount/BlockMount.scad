module boltHole(){
    cylinder(r=3.5,h=23);
}
module screwHole(){
    cylinder(r=2.65,h =26);
}

module GauntletMount(){
    difference(){
        cube([80,40,13]);
        translate([20,20,0]) screwHole();
    }
}

module GauntletMountAdjust(){
    difference(){
        cube([110,40,13]);
        for(i=[20:15:105]){
            translate([i,20,0]) screwHole();
        }
    }
}

module angleBlock(a,h){
    difference(){
        rotate([0,a,0]) cube([30,40,h]);
        translate([0,0,-200]) cube(200);
        
    }
}

module lockMount(){
    difference(){
        cube([60,40,10]);
        translate([(60-12.5),20,0])boltHole();
    }
}

module lockMountAdjust(){
    difference(){
        cube([110,40,10]);
        for(i=[25:15:100]){
            translate([i,20,0]) boltHole();
        }
    }
}

angleBlock(15,20);
