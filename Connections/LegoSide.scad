//ignore utility
module legoMale(){
    cylinder(r=2.4,h=1.8);
}
//ignore utility
module legoFemale(){
difference(){
    cylinder(r=3.25,h=4);
    cylinder(r=2.4,h=4);
}
}
//use this module if the lego builds on from the base    
//creates a rectangle of lego heads (the sticking out part) with the origin through the first heads center
//translate and rotate these modules to match sides of the model
//x: number of lego heads in x direction
//y: number of lego heads in y direction
module boardMale(x,y){
    for(i=[0:x-1]){
        for(j=[0:y-1]){
            translate([i*8,j*8,0]) legoMale();
        }
    }
}
//use this module if the lego builds into the model  
//creates a rectangle of lego inserts (built into the part) with the the origin through the first insert's center
//translate and rotate these modules to match sides of the model
//x: number of lego heads in x direction
//y: number of lego heads in y direction
module boardFemale(x,y){
    for(i=[0:x-1]){
        for(j=[0:y-1]){
            translate([i*8,j*8,0]) legoFemale();
        }
    }
}
//boardFemale(3,1);

//fills a rectangle of w (x direction) and h (y direction). Module will estimate based on closest lego standard
//male part is built on
module fillMale(w,h){
    translate([4,4,0]) boardMale((w+.2)/8,(h+.2)/8);
}
//female part is built into 
module fillFemale(w,h){
    boardFemale(((w+.2)/8)-1,((h+.2)/8)-1);
}



module testLego(w,h){
    fillMale(w,h);
    translate([20+w,0,0])fillFemale(w,h);
}
fillFemale(18,26);
//fillMale(15.8,23.8);
