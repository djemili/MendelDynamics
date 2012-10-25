// Mendel Dynamics
// Triangle plate
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
 * @id triangle-plate
 * @name Triangle plate
 * @category Plate
 */ 


module TrianglePlate(){
union() {

//per les potes cal pujar-ho tot 10mm
translate([0,10,0])
difference() {

	// Triangle
	polyhedron( points = [[0,0,0], [lateral,0,0], [lateral*cos(60),altura,0], [0,0,grosor], [lateral,0,grosor], [lateral*cos(60),altura,grosor]], triangles = [[0,3,1], [3,4,1], [4,2,1], [4,5,2], [5,3,0],[0,2,5],[0,1,2],[5,4,3]]);

	// Z axis space
	translate([lateral/2, altura_z/2 + marge_z + offset_z, -1+(grosor+2)/2])
	roundCornersCube(ample_z, altura_z, grosor+2, 10);

	// threaded rod bottom center hole
	//translate([lateral/2,marge_curt,-1]) cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);
	// changed to 2 holes since version 0.2
	translate([lateral/2-hole_separation/2,marge_curt,-1]) cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);
	translate([lateral/2+hole_separation/2,marge_curt,-1]) cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);
	
	// left frame-vertex holes
	translate([marge_llarg-hole_separation*cos(60),marge_curt+hole_separation*sin(60),-1]) cylinder(h=grosor+2, r=threaded_rod_diameter/2);
	translate([marge_llarg,marge_curt,-1]) cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);

	// right frame-vertex holes
	translate([lateral-marge_llarg+hole_separation*cos(60),marge_curt+hole_separation*sin(60),-1]) cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);
	translate([lateral-marge_llarg,10,-1]) cylinder(h=grosor+2, r=threaded_rod_diameter/2, $fn=fnfn);

	// top frame-vertex holes
	translate([lateral/2-(hole_separation/2),(lateral-marge_llarg)*sin(60)-marge_curt*cos(60),-1]) cylinder(h=grosor+2, r=threaded_rod_diameter/2,  $fn=fnfn);
	translate([lateral/2+(hole_separation/2),(lateral-marge_llarg)*sin(60)-marge_curt*cos(60),-1]) cylinder(h=grosor+2, r=threaded_rod_diameter/2,  $fn=fnfn);

	// Left rounded corner
	translate([60*sin(60),30,-1+(grosor+2)/2])
	rotate(180)
	MycreateMeniscus(grosor+2,30,60);

	// Right rounded corner
	translate([lateral-60*sin(60),30,-1+(grosor+2)/2])
	rotate([180,0,0])
	MycreateMeniscus(grosor+2,30,60);

	// Top rounded corner
	translate([lateral/2,altura-y_off,-1+(grosor+2)/2])
	rotate([0,0,60])
	MycreateMeniscus(grosor+2,30,60);

	// Left-bottom connection
	translate([lateral/3-15, marge_curt, -1]) Connection();

	// Middle connections (z_end and z_motor)
	translate([lateral/2, marge_curt + threaded_rod_diameter/2 + 6, -1]) Connection();
	translate([lateral/2, (lateral-marge_llarg)*sin(60)-marge_curt*cos(60) + threaded_rod_diameter/2 + 6, -1]) Connection();

	// Left-bottom connection
	translate([lateral*2/3+15, marge_curt, -1]) Connection();

	// front plate connection
	rotate(60)
	translate([lateral-marge_llarg-40,0,0]) BoltHole();

    // Back plate connection
	translate([lateral,0,0]) rotate(120)
	translate([lateral-marge_llarg-40,0,0]) rotate(180) BoltHole();
    
	//Forats per la placa
// 	translate([lateral*3/4-25,40,-1])
// 	cylinder(h=grosor+2,r=m3_diameter/2, $fn=fnfn);
// 	translate([lateral*3/4+25,40,-1])
// 	cylinder(h=grosor+2,r=m3_diameter/2, $fn=fnfn);
// 	translate([lateral*3/4-25,40+73,-1])
// 	cube([m3_diameter,15,grosor+2]);
// 	//cylinder(h=grosor+2,r=m3_diameter/2, $fn=fnfn);
// 	translate([lateral*3/4+25,40+73,-1])
// 	cube([m3_diameter,15,grosor+2]);
// 	//cylinder(h=grosor+2,r=m3_diameter/2);


	// Possibly usefull m3 holes (zipties, bolts, printed parts..)
	// left
	for(ii=[1:4])
	rotate(60)
	translate([50*ii+marge_llarg,-marge_curt,-1]) M3hole();

	// right
	for(ii=[1:4])
	translate([lateral,0,0])
	rotate(120)
	translate([50*ii+marge_llarg,marge_curt,-1]) M3hole();

	// z space left
	for(ii=[0:3])
	translate([lateral/2-ample_z/2-marge_curt,0,0])
	rotate(90)
	translate([50*ii+marge_llarg,0,-1]) M3hole();

	// z space right
	for(ii=[0:3])
	translate([lateral/2+ample_z/2+marge_curt,0,0])
	rotate(90)
	translate([50*ii+marge_llarg,0,-1]) M3hole();

	//top
	translate([lateral/2-15,altura_z+marge_z*2+offset_z,-1]) M3hole();
	translate([lateral/2+15,altura_z+marge_z*2+offset_z,-1]) M3hole();
	translate([lateral/2-15,altura_z+marge_z*2+offset_z+60,-1]) M3hole();
	translate([lateral/2+15,altura_z+marge_z*2+offset_z+60,-1]) M3hole();

}

	// Left foot
	translate([marge_llarg-50/2,0,0]) cube([50,12,grosor]);

	// Middle foot (larger because there are two bars here)
	translate([lateral/2-100/2,0,0]) cube([100,10,grosor]);

	// Right foot
	translate([lateral-marge_llarg-50/2,0,0]) cube([50,12,grosor]);

	// Front plate connection
	translate([0,10,0])
	rotate(60)
	translate([lateral-marge_llarg-40,0,0]) ConnectionOut();
	
	// Backp late connection
	translate([lateral,10,0])
	rotate(120)
	translate([lateral-marge_llarg-40,-grosor,0]) ConnectionOut();
}
}

if (dxf) {
	projection(cut = true) {
		TrianglePlate();
	}
}
else {
	TrianglePlate();
}

