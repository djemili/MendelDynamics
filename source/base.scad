// Mendel Dynamics
// Base plate
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
 * @id base-plate
 * @name Base plate
 * @category Plate
 * @using 2 m3nut
 * @using 2 m3washer
 * @using 2 m3x20bolt
 */ 

module BasePlate(){
	difference(){
	union() {
		translate([llarg_base/2, curt_base/2, grosor/2])
		roundCornersCube(llarg_base, curt_base, grosor, 10);

		translate([llarg_base+grosor,curt_base/2,0]) rotate(90)
		 ConnectionOut();

		translate([0,curt_base/2,0]) rotate(90)
		ConnectionOut();
	}

	//Bolt holes
	translate([0,curt_base/2,0])
	rotate(90)
		BoltHole();

	translate([llarg_base,curt_base/2,grosor])
	rotate([0,180,0])
	rotate(90)
		BoltHole();
	}
}

if (dxf) {
	projection(cut = true) {
		BasePlate();
	}
}
else {
	BasePlate();
}
