translate([0.0,0.0,0.0])scale([1.0,1.0,1.0])rotate([0.0,0.0,0.0])  difference()  {
difference()  {
translate([-26.0,-26.0,0.0])cube([52.0,52.0,120.0]);
union()  {
translate([-11.0,-11.0,0.0])cube([22.0,22.0,75.0]);
translate([0.0,0.0,75.0])translate([-24.0,-24.0,0.0])cube([48.0,48.0,26.0]);
translate([-11.0,0.0,0.0])cube([22.0,26.0,88.0]);
translate([-24.0,0.0,88.0])cube([48.0,26.0,13.0]);
}
}
translate([0.0,0.0,65.0])  {
translate([-16.5,-16.5,0.0])cylinder(r=4.5,h=10.0);
translate([16.5,-16.5,0.0])cylinder(r=4.5,h=10.0);
translate([-16.5,16.5,0.0])cylinder(r=4.5,h=10.0);
translate([16.5,16.5,0.0])cylinder(r=4.5,h=10.0);
}
}
translate([0.0,0.0,0.0])scale([1.0,1.0,1.0])rotate([0.0,0.0,0.0])  difference()  {
union()  {
translate([0.0,0.0,75.0])translate([-23.0,-23.0,0.0])cube([46.0,46.0,12.0]);
translate([0.0,0.0,-24.0])translate([-10.0,-10.0,0.0])cube([20.0,20.0,99.0]);
}
translate([0.0,0.0,75.0])  {
translate([-16.5,-16.5,0.0])cylinder(r=4.5,h=10.0);
translate([16.5,-16.5,0.0])cylinder(r=4.5,h=10.0);
translate([-16.5,16.5,0.0])cylinder(r=4.5,h=10.0);
translate([16.5,16.5,0.0])cylinder(r=4.5,h=10.0);
}
}
