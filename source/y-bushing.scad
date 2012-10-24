// Mendel Dynamics
// Y and X bushing holder
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics


include <configuration.scad>

/**
 * @id y-bushing
 * @name Y bushing
 * @category Printed
 * @using 4 m3washer
 * @using 2 m3x15xhex
 * @using 2 m3nut
 */

snap_in_mount = false;
use <bushing.scad>

module ybushing(mm){

// Greg Frosts
if (mm==0) {
	y_linear_bearings();
}
else if (mm == 1 ) {
	y_linear_bearings_alt(false);
}
else {
	y_linear_bearings_alt(true);
}
}

//ybushing(0);
