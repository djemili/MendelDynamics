// Mendel Dynamics
// X end plates
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics

include <inc/roundCornersCube.scad>
include <configuration.scad>

//part curta que va per sobre de x_end_motor i de x_end_idler
module x_end(x_motor=1) {

	union() {
		difference() {

			translate([llarg_xe/2,ample_xe/2,grosor/2]) //cube([llarg_xe,ample_xe,grosor], center=true);
			roundCornersCube(llarg_xe,ample_xe,grosor,10);

			//forats suport varilles (separacio=15?)
			translate([llarg_xe/4,ample_xe/2-xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe/4,ample_xe/2-xbars_separation/2+15/2,0]) M3hole();
			//translate([3*llarg_xe/4,ample_xe/2-xbars_separation/2-15/2,0]) M3hole();
			//translate([3*llarg_xe/4,ample_xe/2-xbars_separation/2+15/2,0]) M3hole();

			translate([llarg_xe/4,ample_xe/2+xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe/4,ample_xe/2+xbars_separation/2+15/2,0]) M3hole();
			//translate([3*llarg_xe/4,ample_xe/2+xbars_separation/2-15/2,0]) M3hole();
			//translate([3*llarg_xe/4,ample_xe/2+xbars_separation/2+15/2,0]) M3hole();

			//forat varilla llisa
			translate([llarg_xe-10,ample_xe/2,-1]) hole_m8(grosor+2);

			//forats suports lm8uu per varilla llisa
			//translate([llarg_xe-10 - 5,ample_xe/2 - 7.5,-1]) M3hole();
			//translate([llarg_xe-10 - 5,ample_xe/2 + 7.5,-1]) M3hole();
			translate([llarg_xe-10 - 9.5,ample_xe/2 - 26/2,-1]) M3hole();
			translate([llarg_xe-10 - 9.5,ample_xe/2 + 26/2,-1]) M3hole();
			
			//forat varilla m8 //x_end es el que va a sobre
			translate([llarg_xe-zdist-10,ample_xe/2,-1])
				cylinder(r=threaded_rod_diameter/2+0.2,h=grosor+2,$fn=fnfn);
				//cylinder(r=m8_nut_diameter/2+0.2,h=grosor+2,$fn=6);

			//espai pel x_motor
			if (x_motor==1) { // en comptes de llarg_xe-9 hauria de ser llarg_xe-8.85 pero era apurar molt
				translate([llarg_xe-9,ample_xe/2-xbars_separation/2-15/2+grosor/2+0.05-20,-1])
				cube([10,20,grosor+2], center=false);
			}
			// espai pel idler
			else {
				translate([llarg_xe-zdist/2-30-0.1,ample_xe/2+xbars_separation/2+15/2-grosor/2-0.05,-1])
					cube([100,20,grosor+2], center=false);
			}
			
		} //difference()
		
		//translate([llarg_xe,ample_xe/2-xbars_separation/2-15/2+grosor/2,-1])
			//	rotate([0,0,180]) cube([5,grosor,grosor+2]);
	} //union()
}

module x_end_motor() {

	union() {
		difference() {

			translate([(llarg_xe+a_motor+30)/2,ample_xe/2,grosor/2]) roundCornersCube(llarg_xe+a_motor+30,ample_xe,grosor,10);

			//forats suport varilles (separacio=15?)
			translate([llarg_xe/4,ample_xe/2-xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe/4,ample_xe/2-xbars_separation/2+15/2,0]) M3hole();
			translate([llarg_xe+a_motor+15,ample_xe/2-xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe+a_motor+15,ample_xe/2-xbars_separation/2+15/2,0]) M3hole();

			translate([llarg_xe/4,ample_xe/2+xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe/4,ample_xe/2+xbars_separation/2+15/2,0]) M3hole();
			translate([llarg_xe+a_motor+15,ample_xe/2+xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe+a_motor+15,ample_xe/2+xbars_separation/2+15/2,0]) M3hole();

			//forat varilla llisa
			translate([llarg_xe-10,ample_xe/2,-1]) hole_m8(grosor+2);

			//forats suports lm8uu per varilla llisa
			//translate([llarg_xe-10 - 5,ample_xe/2 - 7.5,-1]) M3hole();
			//translate([llarg_xe-10 - 5,ample_xe/2 + 7.5,-1]) M3hole();
			translate([llarg_xe-10 - 9.5,ample_xe/2 - 26/2,-1]) M3hole();
			translate([llarg_xe-10 - 9.5,ample_xe/2 + 26/2,-1]) M3hole();
			
			//forat femella m8
			translate([llarg_xe-zdist-10,ample_xe/2,-1])
				cylinder(r=m8_nut_diameter/2+0.2,h=grosor+2,$fn=6);


			//forat conexio x_end_motor_v
			translate([llarg_xe-5+a_motor/2,ample_xe/2-xbars_separation/2-15/2,-1])
				ConnectionNC();
			
			//forat escaire que connecta x_end_motor_v
			translate([llarg_xe+5+1.2,ample_xe/2-xbars_separation/2-15/2+15,-1]) M3hole();
			
		} //difference()
		
	} //union()
}

module x_end_motor_v() {

	union() {
		difference() {
			translate([(a_motor+40)/2,(a_motor+5)/2,grosor/2]) roundCornersCube(a_motor+40,a_motor+5,grosor,10);
			
			translate([a_motor/2+20,a_motor/2,0]) { //foratsMotor();
				translate([motor_h_sep/2, motor_h_sep/2, 0]) M3hole();
				translate([motor_h_sep/2, -motor_h_sep/2, 0]) M3hole();
				translate([-motor_h_sep/2, motor_h_sep/2, 0]) M3hole();
				translate([-motor_h_sep/2, -motor_h_sep/2, 0]) M3hole();
				translate(v=[0,0,-1]) cylinder(r=26/2, h=grosor+2);
			}
			
			//forat per posar un b608 (baixa la corretja 5 milimetres
			translate([10, a_motor/2 + pulley_diameter/2 + 608_diameter/2 - 5, -1])
				cylinder(r=threaded_rod_diameter/2,h=grosor+2,$fn=fnfn);
				//cylinder(r=608_diameter/2,h=grosor+2,$fn=fnfn);
				
			//forat escaire
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
		
		translate([25,-grosor,0]) Conexio_surt();
	}
}

module x_end_idler() {

	union() {
		difference() {

			translate([(llarg_xe+30)/2,ample_xe/2,grosor/2]) roundCornersCube(llarg_xe+30,ample_xe,grosor,10);

			//forats suport varilles (separacio=15?)
			translate([llarg_xe/4,ample_xe/2-xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe/4,ample_xe/2-xbars_separation/2+15/2,0]) M3hole();
			translate([llarg_xe+20,ample_xe/2-xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe+20,ample_xe/2-xbars_separation/2+15/2,0]) M3hole();

			translate([llarg_xe/4,ample_xe/2+xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe/4,ample_xe/2+xbars_separation/2+15/2,0]) M3hole();
			translate([llarg_xe+20,ample_xe/2+xbars_separation/2-15/2,0]) M3hole();
			translate([llarg_xe+20,ample_xe/2+xbars_separation/2+15/2,0]) M3hole();

			//forat varilla llisa
			translate([llarg_xe-10,ample_xe/2,-1]) hole_m8(grosor+2);

			//forats suports lm8uu per varilla llisa
			//translate([llarg_xe-10 - 5,ample_xe/2 - 7.5,-1]) M3hole();
			//translate([llarg_xe-10 - 5,ample_xe/2 + 7.5,-1]) M3hole();
			translate([llarg_xe-10 - 9.5,ample_xe/2 - 26/2,-1]) M3hole();
			translate([llarg_xe-10 - 9.5,ample_xe/2 + 26/2,-1]) M3hole();
			
			//forat femella m8
			translate([llarg_xe-zdist-10,ample_xe/2,-1])
				cylinder(r=m8_nut_diameter/2+0.2,h=grosor+2,$fn=6);


			//forat conexio x_end_idler_v
			translate([llarg_xe-zdist/2,ample_xe/2+xbars_separation/2+15/2,-1])
				Connection();
			
			//forat escaire que connecta x_end_motor_v
			translate([llarg_xe-zdist/2+20,ample_xe/2+xbars_separation/2+15/2-15,-1]) M3hole();
			
		} //difference()
		
	} //union()
}

module x_end_idler_v() {

	union() {
		difference() {
			translate([60/2,40/2,grosor/2]) roundCornersCube(60,40,grosor,10);
			
			//forat per posar un b608 (baixa la corretja 5 milimetres)
			//translate([10, a_motor/2 + pulley_diameter/2 + 608_diameter/2 - 5, -1])
				//cylinder(r=threaded_rod_diameter/2,h=grosor+2,$fn=fnfn);
				//cylinder(r=608_diameter/2,h=grosor+2,$fn=fnfn);
			
			//forat per posar un b608 (ajustable)
			translate([60/2-7.5, 40/2, -1]) {
				cylinder(r=threaded_rod_diameter/2,h=grosor+2,$fn=fnfn);
				translate([0, -threaded_rod_diameter/2, 0])
				cube([15,threaded_rod_diameter,grosor+2]);
				translate([15, 0, 0])
				cylinder(r=threaded_rod_diameter/2,h=grosor+2,$fn=fnfn);
			}
			
			//forat escaire
			translate([50,15,-1]) M3hole();
			
			//forat cargol conexio
			translate([60/2,-3,0])
			rotate(180)
				BoltHole();
			
		}
		
		//canto no arrodonit
		cube([12,12,grosor]);
		
		//canto no arrodonit
		translate([60-12,0,0]) cube([12,12,grosor]);
		
		translate([60/2,-grosor,0]) ConnectionOut();
	}
}

//x_end();


