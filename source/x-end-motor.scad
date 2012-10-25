// Mendel Dynamics
// X end motor plate
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
 * @id x-end-motor-plate
 * @name X End Motor plate
 * @category Plate
 */ 

module x_end_motor() {

	union() {
		difference() {

			translate([(llarg_xe+a_motor+30)/2,ample_xe/2,grosor/2]) roundCornersCube(llarg_xe+a_motor+30,ample_xe,grosor,10);

			// holes for plate-clamp (separation=15?)
			translate([llarg_xe/4,ample_xe/2-xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe/4,ample_xe/2-xbars_separation/2+15/2,0]) M3hole();
			translate([llarg_xe+a_motor+15,ample_xe/2-xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe+a_motor+15,ample_xe/2-xbars_separation/2+15/2,0]) M3hole();

			translate([llarg_xe/4,ample_xe/2+xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe/4,ample_xe/2+xbars_separation/2+15/2,0]) M3hole();
			translate([llarg_xe+a_motor+15,ample_xe/2+xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe+a_motor+15,ample_xe/2+xbars_separation/2+15/2,0]) M3hole();

			// hole for rod
			translate([llarg_xe-10,ample_xe/2,-1]) M8hole(grosor+2);

			// holes for lm8uu supports (z-bushing)
			translate([llarg_xe-10 - 9.5,ample_xe/2 - 26/2,-1]) M3hole();
			translate([llarg_xe-10 - 9.5,ample_xe/2 + 26/2,-1]) M3hole();
			
			// hex hole for nut
			translate([llarg_xe-zdist-10,ample_xe/2,-1])
				cylinder(r=m8_nut_diameter/2+0.2,h=grosor+2,$fn=6);


			// x_end_motor_v connection
			translate([llarg_xe-5+a_motor/2,ample_xe/2-xbars_separation/2-15/2,-1])
				ConnectionNC();
			
			// hole for the corner piece
			translate([llarg_xe+5+1.2,ample_xe/2-xbars_separation/2-15/2+15,-1]) M3hole();
			
		} //difference()
		
	} //union()
}

if (dxf) {
	projection(cut = true) {
		x_end_motor();
	}
}
else {
	x_end_motor();
}


