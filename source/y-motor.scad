// Mendel Dynamics
// Y motor plate
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics

include <roundCornersCube.scad>
include <configuration.scad>

/**
 * @id y-motor-plate
 * @name Y Motor plate
 * @category Plate
 */ 


module y_motor() {

	difference() {
		translate([llarg_ym/2,ample_ym/2,grosor/2])
			roundCornersCube(llarg_ym,ample_ym,grosor,10);
			
		translate([llarg_ym/2,ample_ym/2,-1])
			MotorHoles();
			
		// forats M8 varilles
		translate([llarg_ym/2-hole_separation/2, 15, -1])
			cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);
		translate([llarg_ym/2+hole_separation/2, 15, -1])
			cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);
		
		// forats M8 cargol amb rodament 608
		translate([llarg_ym/2-hole_separation/2, ample_ym/2+8, -1])
			cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);
		translate([llarg_ym/2-hole_separation/2, ample_ym/2+15, grosor/2])
			cube([threaded_rod_diameter, 12, grosor+2], center=true);
		translate([llarg_ym/2-hole_separation/2, ample_ym/2+20, -1])
			cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);
			
		translate([llarg_ym/2+hole_separation/2, ample_ym/2+8, -1])
			cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);
		translate([llarg_ym/2+hole_separation/2, ample_ym/2+15, grosor/2])
			cube([threaded_rod_diameter, 12, grosor+2], center=true);
		translate([llarg_ym/2+hole_separation/2, ample_ym/2+20, -1])
			cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);
		
	}
}

