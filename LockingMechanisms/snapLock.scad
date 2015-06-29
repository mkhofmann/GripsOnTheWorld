include<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
//Similar to a snap buckle. Requires pinching strength to release, dimmensions and materials must be played with to find ideal bend and strength
//ignore utility module
module rightTriangle(w,d,h){
    linear_extrude(h) polygon(points=[ [0,0], [0,d], [w,0] ]); 
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
module male(w,d,h,dl,wl,wi,wt,dt,s){
union(){
    cube([w,d,h]);
    translate([(w-2*wl-wi)/2, d,0]) cube([wl, dl, h]);
    translate([wi+ (w-wi)/2, d,0]) cube([wl, dl, h]);
    translate([wt+(w-2*wt-wi)/2,d+dl,0])  mirror([1,0,0])rightTriangle(wt,dt,h);
    translate([wi+ (w-wi)/2,d+dl,0]) rightTriangle(wt,dt,h);
}
}
//legoMMale(32,8,8,16,5,5,8,5);
module legoMMale(w,d,h,dl,wl,wi,wt,dt,s){
union(){
    male(w,d,h,dl,wl,wi,wt,dt,s);
    intersection(){
        translate([0,-lmh,0]) cube([w,lmh,h]);
        rotate([90,0,0]) fillMale(w,h);
    }
}
}
module legoFMale(w,d,h,dl,wl,wi,wt,dt,s){
union(){
    male(w,d,h,dl,wl,wi,wt,dt,s);
    intersection(){
        translate([0,-lfh,0]) cube([w,lfh,h]);
        rotate([90,0,0]) fillFemale(w,h);
    }
}
}
module legoFMaleSliced(w,d,h,dl,wl,wi,wt,dt,s){
 difference(){
     legoFMale(w,d,h,dl,wl,wi,wt,dt,s);
     translate([0,-lfh,0]) cube([w,lfh+d/2, h]);
 }
 translate([0,-h,d/2]) rotate([-90,0,0]) difference(){
     legoFMale(w,d,h,dl,wl,wi,wt,dt,s);
     translate([0,d/2,0]) cube([w,d+dl+dt, h]);
 }
}

module legoMMaleSliced(w,d,h,dl,wl,wi,wt,dt,s){
 difference(){
     legoMMale(w,d,h,dl,wl,wi,wt,dt,s);
     translate([0,-lmh,0]) cube([w,lmh+d/2, h]);
 }
 translate([0,-h,d/2]) rotate([-90,0,0]) difference(){
     legoMMale(w,d,h,dl,wl,wi,wt,dt,s);
     translate([0,d/2,0]) cube([w,d+dl+dt, h]);
 }
}
//insertion point for buckle, buckle must be pinched to interlock
//dimmensions must match male partner
//t: thickness of walls
//s: spacing for fitting in the buckle
module female(w,d,h,dl,wl,wi,wt,dt,s){
difference(){
    cube([w,dl-2*s,h*2]);
    translate([(w-(wl*2+wi+2*s))/2,0,0]) cube([wl*2+wi+2*s,dl,h+s]);
}    
}
module legoMFemale(w,d,h,dl,wl,wi,wt,dt,s){
union(){
    female(w,d,h,dl,wl,wi,wt,dt,s);
    intersection(){
        translate([0,0,-lmh]) female(w,d,h,dl,wl,wi,wt,dt,s);
        translate([0,0,-lmh]) fillMale(w,dl);
    }
}
}
module legoFFemale(w,d,h,dl,wl,wi,wt,dt,s){
union(){
    female(w,d,h,dl,wl,wi,wt,dt,s);
    intersection(){
        translate([0,0,-lfh]) female(w,d,h,dl,wl,wi,wt,dt,s);
        translate([0,0,-lfh]) fillFemale(w,dl);
    }
}
}
//demonstrates locked buckle
module model(w,d,h,dl,wl,wi,wt,dt,s){
    male(w,d,h,dl,wl,wi,wt,dt,s);
    translate([0,d+s,0]) female(w,d,h,dl,wl,wi,wt,dt,s);
}
legoFMaleSliced(40,5,16,25,3,8,8,5,1.5);

