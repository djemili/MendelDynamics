// Mendel Dynamics
// Common functions for x-end plates
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics

include <inc/roundCornersCube.scad>
include <configuration.scad>

//Short plate that goes over x_end_motor and x_end_idler with little differences
module x_end(x_motor=1) {

	union() {
		difference() {

			translate([llarg_xe/2,ample_xe/2,grosor/2]) //cube([llarg_xe,ample_xe,grosor], center=true);
			roundCornersCube(llarg_xe,ample_xe,grosor,10);

			// holes for plate-clamp (separation=15?)
			translate([llarg_xe/4,ample_xe/2-xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe/4,ample_xe/2-xbars_separation/2+15/2,0]) M3hole();
			//translate([3*llarg_xe/4,ample_xe/2-xbars_separation/2-15/2,0]) M3hole();
			//translate([3*llarg_xe/4,ample_xe/2-xbars_separation/2+15/2,0]) M3hole();

			translate([llarg_xe/4,ample_xe/2+xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe/4,ample_xe/2+xbars_separation/2+15/2,0]) M3hole();
			//translate([3*llarg_xe/4,ample_xe/2+xbars_separation/2-15/2,0]) M3hole();
			//translate([3*llarg_xe/4,ample_xe/2+xbars_separation/2+15/2,0]) M3hole();

			// hole for rod
			translate([llarg_xe-10,ample_xe/2,-1]) M8hole(grosor+2);

			// holes for lm8uu supports (z-bushing)
			//translate([llarg_xe-10 - 5,ample_xe/2 - 7.5,-1]) M3hole();
			//translate([llarg_xe-10 - 5,ample_xe/2 + 7.5,-1]) M3hole();
			translate([llarg_xe-10 - 9.5,ample_xe/2 - 26/2,-1]) M3hole();
			translate([llarg_xe-10 - 9.5,ample_xe/2 + 26/2,-1]) M3hole();
			
			// hole for threaded rod
			translate([llarg_xe-zdist-10,ample_xe/2,-1])
				cylinder(r=threaded_rod_diameter/2+0.2,h=grosor+2,$fn=fnfn);

			// space for x-end-motor-v
				if (x_motor==1) { // TODO: should be llarg_xe-8.85 instead of llarg_xe-9?
				translate([llarg_xe-9,ample_xe/2-xbars_separation/2-15/2+grosor/2+0.05-20,-1])
				cube([10,20,grosor+2], center=false);
			}
			// space for x-end-idler-v
			else {
				translate([llarg_xe-zdist/2-30-0.1,ample_xe/2+xbars_separation/2+15/2-grosor/2-0.05,-1])
					cube([100,20,grosor+2], center=false);
			}
			
		} //difference()
		
	} //union()
}

