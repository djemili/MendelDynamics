// Mendel Dynamics
// X end motor vertical plate
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
 * @id x-end-motor-v-plate
 * @name X End Motor vertical plate
 * @category Plate
 */ 

module x_end_motor_v() {
	
	union() {
		difference() {
			translate([(a_motor+40)/2,(a_motor+5)/2,grosor/2]) roundCornersCube(a_motor+40,a_motor+5,grosor,10);
			
			translate([a_motor/2+20,a_motor/2,0]) MotorHoles();
			// { //foratsMotor();
			//translate([motor_h_sep/2, motor_h_sep/2, 0]) M3hole();
			//translate([motor_h_sep/2, -motor_h_sep/2, 0]) M3hole();
			//translate([-motor_h_sep/2, motor_h_sep/2, 0]) M3hole();
			//translate([-motor_h_sep/2, -motor_h_sep/2, 0]) M3hole();
			//translate(v=[0,0,-1]) cylinder(r=26/2, h=grosor+2);
			//}
			
			// m8 hole for a bolt with a bearing 608
			translate([10, a_motor/2 + pulley_diameter/2 + 608_diameter/2 - 5, -1])
			cylinder(r=threaded_rod_diameter/2,h=grosor+2,$fn=fnfn);
			
			// corner hole
			translate([15,15,-1]) M3hole();
			
			//forat cargol conexio
			//translate([5+a_motor/2,,0])
			//rotate(180)
			//Espai_cargol();
			
			translate([a_motor+25-1.2,0,0])
			rotate(180)
			BoltHole();
		}
		
		//canto no arrodonit
		cube([12,12,grosor]);
		
		translate([25,-grosor,0]) ConnectionOut();
	}
}

if (dxf) {
	projection(cut = true) {
		x_end_motor_v();
	}
}
else {
	x_end_motor_v();
}


