// Mendel Dynamics
// X end motor top plate
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
 * @id x-end-motor-top-plate
 * @name X End Motor top plate
 * @category Plate
 */ 

if (dxf) {
	projection(cut = true) {
		x_end(1);
	}
}
else {
	x_end(1);
}


