// Mendel Dynamics
// Printable corner to join x-end plates
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics


include <configuration.scad>

/**
 * @id corner
 * @name Corner
 * @category Printed
 * @using 2 m3nut
 * @using 4 m3washer
 * @using 2 m3x12bolt
 */ 


module corner() {
	difference() {
	union() {
		cube([20,5,10]);
		cube([5,20,10]);
polyhedron( points = [[0,0,0], [15,0,0], [0,15,0], [0,0,10], [15,0,10], [0,15,10]], triangles = [[0,3,1], [3,4,1], [4,2,1], [4,5,2], [5,3,0],[0,2,5],[0,1,2],[5,4,3]]);
	}
	translate([15,6,5]) rotate([90,0,0])  cylinder(h=10, r=3.5/2, $fn=fnfn);
     translate([-1,13,5]) rotate([0,90,0])  cylinder(h=10, r=3.5/2, $fn=fnfn);
	}
}

corner();
