// Mendel Dynamics
// Z end plate
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics

include <inc/roundCornersCube.scad>
include <configuration.scad>
include <z-end-functions.scad>

/**
 * @id z-end-plate
 * @name Z End plate
 * @category Plate
 */ 

if (dxf) {
	projection(cut = true) {
		z_end(2);
	}
}
else {
	z_end(2);
}
