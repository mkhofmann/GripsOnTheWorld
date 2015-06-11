use<C:\\Users\\Megan\\Documents\\GitHub\\GripsOnTheWorld\\Connections\\LegoSide.scad>;
//Based of sliding bathroom stall locks. 
//requires dexterity from another hand
//Printing onto model may be difficult. Utilizes interlocking modeling software developed by Anthony Chen. Working on getting program 
//Currently designed for user to glue onto existing model, or model must be designd to insert pin from lhs (from model view)

//Creates the pin used lock the mechanism
//r: radius of pin
//h: height of whole locking mechanism (z direction)
//lh: height of locking hook. Extension in x direction
module malePin(r, h, lh){
union(){
    cylinder(r=r, h=4/3*h);
    translate([0,0,h*2/3+r])rotate([0,90,0]) cylinder(r=r, h=lh+r);
}
}

//malePin(4, 120, 10);
//holds the majority of locking pin. 
//parameters match up with male pin
//r2: outer radius of model
//s: spacing between pin and lock
module male(r, h, lh, r2,s){
difference(){
    union(){
        cylinder(r=r2, h=h);
        translate([-r2,-r2,0]) cube([r2,2*r2, h]);
    }
    cylinder(r=r+s, h=h);//pin hole
    //translate([-r2, -r-s,0]) cube([r2,2*(r+s), h]);//for inserting pin
    translate([-r-s, -r2, 1/3*h]) cube([2*(r+s), r2, 1/3*h+2*(r+s)]);
    translate([0,-r2,1/3*h]) cube([r2, 2*(r+s),2*(r+s)]); 
    translate([0,-r2,2/3*h]) cube([r2, 2*(r+s),2*(r+s)]); 
     
}
}
module legoMMale(r,h,lh,r2,s){
    union(){
        male(r,h,lh,r2,s);
        translate([-r2,-r2,0]) rotate([0,-90,0]) fillMale(h, 2*r2);
    }
}
module legoFMale(r,h,lh,r2,s){
    union(){
        male(r,h,lh,r2,s);
        translate([-r2,-r2,0]) rotate([0,-90,0]) fillFemale(h, 2*r2);
    }
}
//maleHolder( 4, 120, 10,10,2);
//holds tail locking portion of pin
//dimmensions must match male Holder
module female(r, h,r2,s){
difference(){
    union(){
        cylinder(r=r2, h=1/3*h);
        translate([-r2,-r2,0]) cube([r2, 2*r2, 1/3*h]);
    }
    cylinder(r=r+s, h=1/3*h);
}    
}

//used to display unlocked example
module model(r,h,lh, r2,s){
    translate([0,0,-1/3*h]) malePin(r,h,lh);
    male(r,h,lh,r2,s);
    translate([0,0,h+s]) female(r,h,r2,s);
}

//legoFMale( 4, 120, 10,10,2);

//easy to print
module print(r,h,lh, r2,s){
    translate([h/2,0,r]) rotate([0,-90,0]) malePin(r,h,lh);
    translate([-h/2,-2*(r2+s),r2]) rotate([0,90,0])male(r,h,lh,r2,s);
    translate([0,2*(r2+s),0]) female(r,h,r2,s);
}
malePin(4,120,10);
male(4,120,10,10,2);