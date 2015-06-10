use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
//Similar to a snap buckle. Requires pinching strength to release, dimmensions and materials must be played with to find ideal bend and strength
//ignore utility module
module rightTriangle(w,d,h){
    linear_extrude(d) polygon(points=[ [0,0], [0,d], [w,0] ]); 
}

//The pointed buckle end
//w: width (x direction) of full buckle
//d: depth (y direction) of base of buckle
//h: height (z direction) of full buckle
//dl: depth (y) of extended buckle prongs
//wl: width (x) of extended buckle prongs
//wi, distance (x) between prongs
//wt: width (x) of triangles points
//dt: depth (y) of triangles
module male(w,d,h, dl, wl, wi,wt, dt){
    union(){
        cube([w,d,h]);
        translate([(w-2*wl-wi)/2, d,0]) cube([wl, dl, h]);
        translate([wi+ (w-wi)/2, d,0]) cube([wl, dl, h]);
        translate([wt+(w-2*wt-wi)/2,d+dl,0])  mirror([1,0,0])rightTriangle(wt,dt,h);
        translate([wi+ (w-wi)/2,d+dl,0]) rightTriangle(wt,dt,h);
    }
}
module legoMMale(w,d,h, dl, wl, wi,wt, dt){
    union(){
        male(w,d,h, dl, wl, wi,wt, dt);
        rotate([90,0,0]) fillMale(w,h);
    }
}
module legoFMale(w,d,h, dl, wl, wi,wt, dt){
    union(){
        male(w,d,h, dl, wl, wi,wt, dt);
        rotate([90,0,0]) fillFemale(w,h);
    }
}
//insertion point for buckle, buckle must be pinched to interlock
//dimmensions must match male partner
//t: thickness of walls
//s: spacing for fitting in the buckle
module female(w,d,h,wl,wi,s){
union(){
    cube([(w-2*wl-wi)/2-s,d,h]);
    translate([wi+ (w-wi)/2 +wl+s,0,0]) cube([(w-2*wl-wi)/2-s,d,h]);
    translate([0,0,h]) cube([w,d,h]);
}    
}
module legoMFemale(w,d,h,wl,wi,s){
union(){
    female(w,d,h,wl,wi,s);
    translate([0,0,-1.8]) fillMale((w-2*wl-wi)/2-s,d);
    translate([wi+(w-wi)/2 +wl+s,0,-1.8]) fillMale((w-2*wl-wi)/2-s,d);
}
}
module legoFFemale(w,d,h,wl,wi,s){
union(){
    female(w,d,h,wl,wi,s);
    translate([0,0,-1.8]) fillMale((w-2*wl-wi)/2-s,d);
    translate([wi+(w-wi)/2 +wl+s,0,-8.6]) fillFemale((w-2*wl-wi)/2-s,d);
}
}
//demonstrates locked buckle
module model(w,d,h,dl,wl, wi,wt,dt,s){
    male(w,d,h,dl,wl,wi,wt,dt);
    translate([0,dl-s,0]) female(w,d,h,wl,wi,s);
}

//easy to print configuration
module print(w,d,h,dl,wl,wi,wt,dt,s){
    male(w,d,h,dl,wl,wi,wt,dt);
    translate([0,-s,0]) rotate([90,0,0]) female(w,d,h,wl,wi,s);
}

legoFFemale(60,10,16,10,10,2);
