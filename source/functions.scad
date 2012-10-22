// Mendel Dynamics
// Functions used in many files
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics

// Some functions from:
// Prusa Mendel
// GNU GPL v3
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel


module nut(d,h,horizontal=true){
cornerdiameter =  (d / 2) / cos (180 / 6);
cylinder(h = h, r = cornerdiameter, $fn = 6);
if(horizontal){
for(i = [1:6]){
	rotate([0,0,60*i]) translate([-cornerdiameter-0.2,0,0]) rotate([0,0,-45]) cube(size = [2,2,h]);
}}
}

// Based on nophead research
module polyhole(d,h) {
    n = max(round(2 * d),3);
    rotate([0,0,180])
        cylinder(h = h, r = (d / 2) / cos (180 / n), $fn = n);
}




module roundcorner(diameter){
	difference(){
		cube(size = [diameter,diameter,99], center = false);
		translate(v = [diameter, diameter, 0]) cylinder(h = 100, r=diameter, center=true);
	}
}


module roundcorner(diameter){
	difference(){
		cube(size = [diameter,diameter,99], center = false);
		translate(v = [diameter, diameter, 0]) cylinder(h = 100, r=diameter, center=true, $fn=10);//no augmentar
	}
}

// This module creates the shape that needs to be substracted from a cube to make its corners rounded.
module MycreateMeniscus(h,radius,angle) 
difference(){
	translate([radius/2+0.1+30/2,radius/2+0.1,0]){
		cube([radius+0.2+30,radius+0.1+radius*sin(angle),h+0.2],center=true);         
	}
	
	cylinder(h=h+0.2,r=radius,$fn = 100,center=true);
}

//     __          __ 
//    |__|   ()   |__|
//
module Connection(sep=40)
union() {
	translate([-sep/2,0,(grosor+2)/2]) cube([10+0.1,grosor+0.1,grosor+2], center=true);
	translate([sep/2,0,(grosor+2)/2]) cube([10+0.1,grosor+0.1,grosor+2], center=true);
	cylinder(h=grosor+2, r=m3_diameter/2, $fn=fnfn);
}

// without m3 hole
//     __          __
//    |__|        |__|
//

module ConnectionNC(sep=40)
union() {
	translate([-sep/2,0,(grosor+2)/2]) cube([10+0.1,grosor+0.1,grosor+2], center=true);
	translate([sep/2,0,(grosor+2)/2]) cube([10+0.1,grosor+0.1,grosor+2], center=true);
}

//     __          __ 
//  __|  |________|  |__
//           
module ConnectionOut(sep=40)
union() {
	translate([-sep/2,grosor/2,grosor/2]) cube([10,grosor,grosor], center=true);
	translate([sep/2,grosor/2,grosor/2]) cube([10,grosor,grosor], center=true);
}

//     __          __ 
//  __|  |___  ___|  |__
//           ||           
//           ++

module BoltHole(canal=true)
union() {
	if (canal) {
		translate([0,-5,(grosor+2)/2-1]) cube([m3_diameter,21,grosor+2], center=true);
	}
	translate([0,-10,(grosor+2)/2-1]) cube([m3_nut_diameter_horizontal,3,grosor+2], center=true);
}


module M3hole(hex=0) {
	
	if (hex) {
		cylinder(h=grosor+2,r=m3_nut_diameter_horizontal/2+0.5, $fn=6);
	}
	else {
		cylinder(h=grosor+2,r=m3_diameter/2, $fn=fnfn);
	}
}

//Hole for Bearing 608
module b608(h=8)
{
	translate([0,0,h/2]) cylinder(r=hole_for_608/2,h=h,center=true,$fn=60);
}


module M8hole(h=8)
{
	translate([0,0,h/2]) cylinder(r=m8_hole/2,h=h,center=true,$fn=fnfn);
}

module motor()
{
	union() {
		cube([l_motor,a_motor,a_motor]);
		translate([-20,a_motor/2,a_motor/2])
		rotate([0,90,0]) cylinder(h=20,r=2.5);
	}
}

// nema 17 holes
module MotorHoles()
{
	translate([motor_h_sep/2, motor_h_sep/2, 0]) M3hole();
	translate([motor_h_sep/2, -motor_h_sep/2, 0]) M3hole();
	translate([-motor_h_sep/2, motor_h_sep/2, 0]) M3hole();
	translate([-motor_h_sep/2, -motor_h_sep/2, 0]) M3hole();
	translate(v=[0,0,0]) cylinder(r=26/2, h=grosor+2);
}
