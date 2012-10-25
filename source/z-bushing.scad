// Mendel Dynamics 
// Z bushing
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics


include <configuration.scad>
include <bushing.scad>

/**
 * @id z-bushing
 * @name Z bushing
 * @category Printed
 * @using 4 m3washer
 * @using 2 m3x15xhex
 * @using 2 m3nut
 */

module z_bushing(){
	difference(){
		union() {
			cube([lm8uu_diameter/2+5, lm8uu_diameter+5, lm8uu_length+5]);
			translate([0,-7.5,0]) cube([7,35,5]);
		}
		
		translate([lm8uu_diameter/2+5,(lm8uu_diameter+5)/2, -1]) cylinder(r=lm8uu_diameter/2,h=lm8uu_length+1,$fn=fnfn);
		translate([lm8uu_diameter/2+5,(lm8uu_diameter+5)/2, -1+(lm8uu_length+7/2)]) cylinder(r=1+(m8_hole/2),h=lm8uu_length+7,center=true,$fn=fnfn); //M8hole(lm8uu_length+7); // cylinder(r=lm8uu_diameter/2,h=lm8uu_length+7,$fn=fnfn);

		translate([lm8uu_diameter/2-4.5,(lm8uu_diameter+5)/2-26/2,-1]) cylinder(h=10,r=m3_diameter/2, $fn=fnfn);
		translate([lm8uu_diameter/2-4.5,(lm8uu_diameter+5)/2+26/2,-1]) cylinder(h=10,r=m3_diameter/2, $fn=fnfn);
		
		//brides
		translate([2, -1, lm8uu_length/2]) cube([2,lm8uu_diameter+7,3]);
	}
	
}

rotate([0,-90,0]) z_bushing();

