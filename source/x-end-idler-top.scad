// Mendel Dynamics
// X end idler top plate
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
 * @id x-end-idler-top-plate
 * @name X End idler top plate
 * @category Plate
 */ 

if (dxf) {
	projection(cut = true) {
		x_end(0);
	}
}
else {
	x_end(0);
}


