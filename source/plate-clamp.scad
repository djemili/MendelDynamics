// Mendel Dynamics
// Plate clamp. Fixes a threaded rod to a plate
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics

include <configuration.scad>

/**
 * @id plate-clamp
 * @name Plate clamp
 * @category Printed
 * @using 2 m3nut
 * @using 2 m3washer
 * @using 2 m3x25bolt
 */ 

dist_holes=15;
pwidth=24;

module PlateClamp() {

	union() {
		difference() {
			cube([10, pwidth, threaded_rod_diameter + 6 - grosor/2 + 3]);

			translate([-1, pwidth/2, threaded_rod_diameter/2 + 3])
				rotate([0,90,0])
				cylinder(r=threaded_rod_diameter/2, h=12, $fn=fnfn);

				translate([5, pwidth/2-dist_holes/2, -1]) cylinder(h=20,r=m3_diameter/2, $fn=fnfn);
				translate([5, pwidth/2+dist_holes/2, -1]) cylinder(h=20,r=m3_diameter/2, $fn=fnfn);
			
		} // difference()
		
	} //union()
}

//rotate([0,-90,0])
PlateClamp();
