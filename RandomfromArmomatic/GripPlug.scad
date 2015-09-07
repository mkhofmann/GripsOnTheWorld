union()  {
translate([-22.5,-22.5,0.0])cube([45.0,45.0,5.0]);
translate([-22.5,-22.5,-60.0])scale([1.0,1.0,1.0])import("BrettGrip.stl",3);
union()  {
translate([-10.0,-10.0,5.0])cube([20.0,20.0,5.0]);
translate([-10.0,-10.0,5.0])scale([1.0,1.0,1.0])difference()  {
cube([20.0,20.0,80.0]);
translate([2.0,2.0,0.0])cube([16.0,16.0,80.0]);
}
}
}
