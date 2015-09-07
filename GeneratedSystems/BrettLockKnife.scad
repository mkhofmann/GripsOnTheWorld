union()  {
translate([-10.0,-10.0,0.0])cube([20.0,20.0,5.0]);
translate([0.0,0.0,-65.0])scale([1.0,1.0,1.0])union()  {
difference()  {
cylinder(r=10.0,h=30.0);
rotate([0.0,10.0,0.0])  translate([0.0,10.0,15.0])sphere(r = 2.0);
rotate([0.0,10.0,90.0])  translate([0.0,10.0,15.0])sphere(r = 2.0);
rotate([0.0,10.0,180.0])  translate([0.0,10.0,15.0])sphere(r = 2.0);
rotate([0.0,10.0,270.0])  translate([0.0,10.0,15.0])sphere(r = 2.0);
}
cylinder(r=5.0,h=70.0);
}
union()  {
translate([-20.5,-12.0,5.0])cube([41.0,24.0,5.0]);
}
}
