module lock(r,h,zs,xs,m){
    difference(){
        cylinder(r=r,h=h);
        for(i=[0:h/(2*zs)]){
            translate([-i*xs,-i*xs,i*zs]) cube([i*xs+r,i*xs+r,zs]);
            translate([0,0,h/2]) translate([-(h/(2*zs)-i)*xs,-(h/(2*zs)-i)*xs,i*zs]) cube([m-i*xs,m-i*xs,zs]);
        }
        
        
    }
}


module key(r,h,zs,xs,m){
   union(){
       for(i=[0:h/(2*zs)]){
            translate([-i*xs,-i*xs,i*zs]) cube([i*xs+r,i*xs+r,zs]);
            translate([0,0,h/2]) translate([-(h/(2*zs)-i)*xs,-(h/(2*zs)-i)*xs,i*zs]) cube([m-i*xs,m-i*xs,zs]);
        }
    
        }
}
module quarterCyl(r,h){
intersection(){
        cylinder(r=r, h=2*r);
        cube([r,r,h]);
    }
}
module model(r,h,a){
    lock(r,h,a);
    key(r,h);
}

key(20,40,.1,.05,30);
//cut(20,40);