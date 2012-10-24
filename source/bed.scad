// Mendel Dynamics
// Bed plate. Should be wood or a material that can hold more than 110ºC
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
 * @id bed-plate
 * @name Bed plate
 * @category Plate
 */


// 1 Part superior
// 0 Part inferior
module Safata(part=0){

	difference(){
		translate([ample_safata/2, llarg_safata/2, grosor/2])
		roundCornersCube(ample_safata, llarg_safata, grosor, 4);

		//forats corners
		translate([5,5,-1]) M3Hole(0);
		translate([distC_safata+5,5,-1]) M3Hole(0);
		translate([5,distC_safata+5,-1]) M3Hole(0);
		translate([distC_safata+5,distC_safata+5,-1]) M3Hole(0);


		//Bushing pels rodaments
		translate([distC_safata/2+5-distV_safata/2-dist_bushing/2,distC_safata/2+5+100/2,-1]) M3Hole(part);
		translate([distC_safata/2+5-distV_safata/2+dist_bushing/2,distC_safata/2+5+100/2,-1]) M3Hole(part);
		translate([distC_safata/2+5-distV_safata/2-dist_bushing/2,distC_safata/2+5-100/2,-1]) M3Hole(part);
		translate([distC_safata/2+5-distV_safata/2+dist_bushing/2,distC_safata/2+5-100/2,-1]) M3Hole(part);
		translate([distC_safata/2+5+distV_safata/2-dist_bushing/2,distC_safata/2+5+100/2,-1]) M3Hole(part);
		translate([distC_safata/2+5+distV_safata/2+dist_bushing/2,distC_safata/2+5+100/2,-1]) M3Hole(part);
		translate([distC_safata/2+5+distV_safata/2-dist_bushing/2,distC_safata/2+5-100/2+15,-1]) M3Hole(part);
		translate([distC_safata/2+5+distV_safata/2+dist_bushing/2,distC_safata/2+5-100/2+15,-1]) M3Hole(part);

		//Per sostenir la corretja
		translate([distC_safata/2+5-dist_belt/2, distC_safata/2+5+distB_safata/2,-1]) M3Hole(part);
		translate([distC_safata/2+5+dist_belt/2, distC_safata/2+5+distB_safata/2,-1]) M3Hole(part);
		translate([distC_safata/2+5-dist_belt/2, distC_safata/2+5-distB_safata/2,-1]) M3Hole(part);
		translate([distC_safata/2+5+dist_belt/2, distC_safata/2+5-distB_safata/2,-1]) M3Hole(part);

		//Espai pels cables de la safata PCB
		translate([0,llarg_safata/2,grosor/2]) roundCornersCube(25, 40, grosor+2, 4);
		
		//Espais per tenir distancia entre varilles
		translate([distC_safata/2+5-distV_safata/2,0,-1]) M8Hole();
		translate([distC_safata/2+5+distV_safata/2,0,-1]) M8Hole();
		translate([distC_safata/2+5,0,grosor/2]) roundCornersCube(6, 5, grosor+2, 2);

	}
}


