// Mendel Dynamics
// Z motor plate
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
 * @id z-motor-plate
 * @name Z Motor plate
 * @category Plate
 */ 


module z_motor() {

	union() {
		difference() {
			translate([llarg_zm/2,ample_zm/2,grosor/2])
				roundCornersCube(llarg_zm,ample_zm,grosor,10);

			translate([llarg_zm-zdist-20,ample_zm/2,-1])  {
				translate([motor_h_sep/2, motor_h_sep/2, 0]) M3Hole();
				translate([motor_h_sep/2, -motor_h_sep/2, 0]) M3Hole();
				translate([-motor_h_sep/2, motor_h_sep/2, 0]) M3Hole();
				translate([-motor_h_sep/2, -motor_h_sep/2, 0]) M3Hole();
				translate(v=[0,0,-10]) polyhole(26,20);
			}

			translate([llarg_zm-20,ample_zm/2,-1]) M8Hole(grosor+2);

			//translate([llarg_zm-20,ample_zm/2+10,-1]) M3Hole();
			//translate([llarg_zm-20,ample_zm/2-10,-1]) M3Hole();

			translate([llarg_zm/4,ample_zm/2-hole_separation/2-15/2,-1]) M3Hole();
			translate([llarg_zm/4,ample_zm/2-hole_separation/2+15/2,-1]) M3Hole();
			translate([3*llarg_zm/4,ample_zm/2-hole_separation/2-15/2,-1]) M3Hole();
			translate([3*llarg_zm/4,ample_zm/2-hole_separation/2+15/2,-1]) M3Hole();

			translate([llarg_zm/4,ample_zm/2+hole_separation/2-15/2,-1]) M3Hole();
			translate([llarg_zm/4,ample_zm/2+hole_separation/2+15/2,-1]) M3Hole();
			translate([3*llarg_zm/4,ample_zm/2+hole_separation/2-15/2,-1]) M3Hole();
			translate([3*llarg_zm/4,ample_zm/2+hole_separation/2+15/2,-1]) M3Hole();

			//Espai cargol
			translate([0,ample_zm/2,0])
				rotate(90)
				BoltHole();
		} // difference()

		translate([0,ample_zm/2,0]) rotate(90)
			ConnectionOut();
	} //union()
}
