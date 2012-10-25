// Mendel Dynamics
// Z end bottom plate
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
 * @id z-end-bottom-plate
 * @name Z End bottom plate
 * @category Plate
 */ 

if (dxf) {
	projection(cut = true) {
		z_end(1);
	}
}
else {
	z_end(1);
}


