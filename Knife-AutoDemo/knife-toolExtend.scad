union()  {
translate([10.0,10.0,0.0])scale([1.0,1.0,1.0])rotate([0.0,0.0,0.0])  difference()  {
cylinder(r=10.0,h=30.0);
rotate([0.0,10.0,0.0])  translate([0.0,10.0,15.0])sphere(r = 2.0);
rotate([0.0,10.0,90.0])  translate([0.0,10.0,15.0])sphere(r = 2.0);
rotate([0.0,10.0,180.0])  translate([0.0,10.0,15.0])sphere(r = 2.0);
rotate([0.0,10.0,270.0])  translate([0.0,10.0,15.0])sphere(r = 2.0);
}
translate([0.0,0.0,30.0])cube([20.0,20.0,15.0]);
translate([0.0,0.0,45.0])scale([1.0,1.0,1.0])difference()  {
cube([20.0,20.0,60.0]);
translate([2.0,2.0,0.0])cube([16.0,16.0,60.0]);
}
}
