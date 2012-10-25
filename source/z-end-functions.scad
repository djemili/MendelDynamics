// Mendel Dynamics
// Z end functions
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics

include <inc/roundCornersCube.scad>
include <configuration.scad>

/**
 * @id z-end-plate
 * @name Z End plate
 * @category Plate
 */ 


module z_end(zpart=1) {

	union() {
		difference() {
			if (zpart==1) {
				translate([llarg_zm-zdist/2-20-5,ample_zm/2,grosor/2])
					roundCornersCube(m8_hole*4+zdist,m8_hole*4,grosor,10);
			}
			else {
				translate([llarg_zm/2,ample_zm/2,grosor/2])
					roundCornersCube(llarg_zm,ample_zm,grosor,10);
			}

			translate([llarg_zm-zdist-20,ample_zm/2,-1])  {
				if (zpart==1) {
					cylinder(r=m8_clearance_hole/2+2,h=grosor+2,$fn=fnfn);
				}
				else if (zpart == 2) {
					b608(grosor+2);
				}
			}

			translate([llarg_zm-20,ample_zm/2,-1]) M8hole(grosor+2);

			translate([llarg_zm-zdist-25-10,ample_zm/2-10,-1]) M3hole();
			translate([llarg_zm-25+10,ample_zm/2-10,-1]) M3hole();
			translate([llarg_zm-zdist-25-10,ample_zm/2+10,-1]) M3hole();
			translate([llarg_zm-25+10,ample_zm/2+10,-1]) M3hole();


			if (zpart == 2) {
				translate([llarg_zm/4,ample_zm/2-hole_separation/2-15/2,-1]) M3hole();
				translate([llarg_zm/4,ample_zm/2-hole_separation/2+15/2,-1]) M3hole();
				translate([3*llarg_zm/4,ample_zm/2-hole_separation/2-15/2,-1]) M3hole();
				translate([3*llarg_zm/4,ample_zm/2-hole_separation/2+15/2,-1]) M3hole();

				translate([llarg_zm/4,ample_zm/2+hole_separation/2-15/2,-1]) M3hole();
				translate([llarg_zm/4,ample_zm/2+hole_separation/2+15/2,-1]) M3hole();
				translate([3*llarg_zm/4,ample_zm/2+hole_separation/2-15/2,-1]) M3hole();
				translate([3*llarg_zm/4,ample_zm/2+hole_separation/2+15/2,-1]) M3hole();
			}

			//Espai cargol
			if (zpart == 2) {
				translate([0,ample_zm/2,0])
					rotate(90)
					BoltHole();
			}
		} // difference()

		if (zpart == 2) {
			translate([0,ample_zm/2,0]) rotate(90)
			ConnectionOut();
		}
	} //union()
}
