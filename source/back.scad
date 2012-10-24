// Mendel Dynamics
// Back plate
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
 * @id back-plate
 * @name Back plate
 * @category Plate
 * @using 2 m3nut
 * @using 2 m3washer
 * @using 2 m3x20bolt
 */ 

module BackPlate(){
	difference(){
		translate([(llarg_base+40)/2, curt_base/2, grosor/2])
		roundCornersCube(llarg_base+40, curt_base, grosor, 10);

		translate([20+llarg_base+grosor,curt_base/2,-1]) rotate(90)
		 Connection();

		translate([20,curt_base/2,-1]) rotate(90)
		 Connection();

		//translate([80,40,0]) rotate([0,0,90]) logo_gear();

		// A line of hole for zipties or M3 bolts
		for(ii=[1:8])
		translate([((llarg_base-20)/8)*ii+20,curt_base-8,-1]) M3hole();

		// RAMPS holes
		translate([50+grosor,curt_base/2+ramps_holes_a/2,-1]) M3hole();
		translate([50+grosor,curt_base/2-ramps_holes_a/2,-1]) M3hole();
		translate([50+grosor+ramps_holes_b,curt_base/2-ramps_holes_a/2,-1]) M3hole();
		translate([50+grosor+ramps_holes_b,curt_base/2+ramps_holes_a/2,-1]) M3hole();
		
		//Possible fan support for RAMPS (separated 20mm)
		translate([50+grosor+ramps_holes_b+20,curt_base/2-10,-1]) M3hole();
		translate([50+grosor+ramps_holes_b+20,curt_base/2+10,-1]) M3hole();
	}
}

if (dxf) {
	projection(cut = true) {
		BackPlate();
	}
}
else {
	BackPlate();
}

