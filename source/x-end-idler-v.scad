// Mendel Dynamics
// X end idler vertical plate
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics

include <inc/roundCornersCube.scad>
include <configuration.scad>
include <x-end-functions.scad>

/**
 * @id x-end-idler-v-plate
 * @name X End idler vertical plate
 * @category Plate
 */ 

module x_end_idler_v() {
	
	union() {
		difference() {
			translate([60/2,40/2,grosor/2]) roundCornersCube(60,40,grosor,10);
			
			//M8 adjustable hole for a m8 bolt with a b608
			translate([60/2-7.5, 40/2, -1]) {
				cylinder(r=threaded_rod_diameter/2,h=grosor+2,$fn=fnfn);
				translate([0, -threaded_rod_diameter/2, 0])
				cube([15,threaded_rod_diameter,grosor+2]);
				translate([15, 0, 0])
				cylinder(r=threaded_rod_diameter/2,h=grosor+2,$fn=fnfn);
			}
			
			// corner hole
			translate([50,15,-1]) M3hole();
			
			// hole for a bolt connecting plates
			translate([60/2,-3,0])
			rotate(180)
			BoltHole();
			
		}
		
		// not rounded corner
		cube([12,12,grosor]);
		
		// not rounded corner
		translate([60-12,0,0]) cube([12,12,grosor]);
		
		translate([60/2,-grosor,0]) ConnectionOut();
	}
}


if (dxf) {
	projection(cut = true) {
		x_end_idler_v();
	}
}
else {
	x_end_idler_v();
}


