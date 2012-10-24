// Mendel Dynamics
// X Carriage plate
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
 * @id x-carriage-plate
 * @name X Carriega plate
 * @category Plate
 */ 

module mountingholes(){
	translate(v = [-25, 0, -1]) polyhole(m3_diameter,grosor+2);
	//translate(v = [0, -25, 5]) cylinder(h = 9, r=m4_nut_diameter/2, $fn=6, center=true);		
	translate(v = [25, 0, -1]) polyhole(m3_diameter,grosor+2);
	//translate(v = [0, 25, 5]) cylinder(h = 9, r=4.5, $fn=6, center=true);
}

module x_carriage() {

	difference() {
		union() {
			translate([llarg_xc/2,ample_xc/2,grosor/2]) //cube([llarg_xe,ample_xe,grosor], center=true);
			roundCornersCube(llarg_xc,ample_xc,grosor,10);
			//translate(v = [15, 0, 0]) cube(size = [35,50,grosor], center = true);
			//translate(v = [0, 18.5, 0]) cube(size = [35,20,grosor], center = true);
			//translate(v = [-2.4, -6, 0]) rotate(a=[0,0,15]) cylinder(h = grosor, r=35, $fn=5, center=true);
			//translate(v = [0, -31, 0]) cylinder(h = grosor, r=m4_nut_diameter/2+2, $fn=6, center=true);
			
			//Belt clamps
			translate([llarg_xc/2-12-7.5, ample_xc-15, 0]) cube(size = [15,20,grosor]);
			translate([llarg_xc/2-12, ample_xc+5, 0]) cylinder(h = grosor, r=7.5, $fn=18);
			
			translate([llarg_xc/2+12-7.5, ample_xc-15, 0]) cube(size = [15,20,grosor]);
			translate([llarg_xc/2+12, ample_xc+5, 0]) cylinder(h = grosor, r=7.5, $fn=18);
			
		}
		
		// Hotend hole
		translate(v = [llarg_xc/2, ample_xc/2, grosor/2]) cylinder(h = grosor+2, r=20, $fn=fnfn, center=true);
					
		//forats suport estruder
		translate(v = [llarg_xc/2, ample_xc/2, 0]){
			rotate(a=[0,0,23]) mountingholes();
			rotate(a=[0,0,-23]) mountingholes();
			rotate(a=[0,0,0]) mountingholes();
		}
		
		
		//belt clamp holes 
		translate([llarg_xc/2-12, ample_xc-11,-1]) M3hole(); //polyhole(m3_diameter,grosor+2);
		translate([llarg_xc/2-12, ample_xc-11 + belt_clamp_holes_dist,-1]) M3hole(); //polyhole(m3_diameter,grosor+2);
		translate([llarg_xc/2+12, ample_xc-11,-1]) M3hole(); //polyhole(m3_diameter,grosor+2);
		translate([llarg_xc/2+12, ample_xc-11 + belt_clamp_holes_dist,-1]) M3hole(); //polyhole(m3_diameter,grosor+2);

		
		//forats suport varilles (separacio=bushing_holes_dist) (per x_bushings, no tindran els forats al mig sino al principi i final (a 20mm de distancia)
		translate([llarg_xc/2-23-15 + 20/2,ample_xc/2-xbars_separation/2-bushing_holes_dist/2,0]) M3hole();
		translate([llarg_xc/2-23-15 - 20/2,ample_xc/2-xbars_separation/2+bushing_holes_dist/2,0]) M3hole();
		translate([llarg_xc/2+23+15 - 20/2,ample_xc/2-xbars_separation/2-bushing_holes_dist/2,0]) M3hole();
		translate([llarg_xc/2+23+15 + 20/2,ample_xc/2-xbars_separation/2+bushing_holes_dist/2,0]) M3hole();

		translate([llarg_xc/2-23-15 - 20/2,ample_xc/2+xbars_separation/2-bushing_holes_dist/2,0]) M3hole();
		translate([llarg_xc/2-23-15 + 20/2,ample_xc/2+xbars_separation/2+bushing_holes_dist/2,0]) M3hole();
		translate([llarg_xc/2+23+15 + 20/2,ample_xc/2+xbars_separation/2-bushing_holes_dist/2,0]) M3hole();
		translate([llarg_xc/2+23+15 - 20/2,ample_xc/2+xbars_separation/2+bushing_holes_dist/2,0]) M3hole();

		//forats per fer passar els cables del hotend i una brida
		translate([0,ample_xc/2,-1]) cylinder(r=4, h=grosor+2, $fn=fnfn);
		translate([10,ample_xc/2,0]) M3hole();
		
		//forats per suports del ventilador
		translate([llarg_xc/2-30/2,10,0]) M3hole();
		translate([llarg_xc/2+30/2,10,0]) M3hole();
		translate([llarg_xc/2,0,grosor/2]) cube([42,10,grosor+2], center=true);

	}
}

if (dxf) {
	projection(cut = true) {
		x_carriage();
	}
}
else {
	x_carriage();
}

