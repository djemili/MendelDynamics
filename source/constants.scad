// Mendel Dynamics
// Constant values used in many files
// GNU GPL v3
// Emili Sapena 
// emili@bcndynamics.com
// bcndynamics.com
// http://wiki-es.bcndynamics.com/Mendel_Dynamics
// http://github.com/djemili/MendelDynamics
// http://www.reprap.org/wiki/Mendel_Dynamics

//DEBUG
//fnfn=10;

//RENDER
fnfn=60;


// Plates' thickness
grosor=5;

threaded_rod_diameter = 8.7;
m3_diameter = 3.6;
m3_nut_diameter = 5.3;
m3_nut_diameter_horizontal = 6.1;

m8_clearance_hole=8.8;
m8_hole=8.4;
hole_for_608=22.3;
608_diameter=22;
pulley_diameter=10; //TODO

hole_separation=58.5; //from Prusa's frame vertex
xbars_separation=50;
hotend_hole_sep=30;
xventilador=10; //TODO
l_motor=50; // 47 mesurat per mi! deixem 50 per si hi ha motors mes llargs
a_motor=42.4; //mesurat per mi!
motor_h_sep=31;

pla_diam=3;
teflon_diam=16.3;

bushing_holes_dist=28;
rod_clamp_holes_dist=15;
belt_clamp_holes_dist=18;

//Recheck these values:
ramps_holes_a=48;
ramps_holes_b=82.5;
ramps_holes_c=75;

lme8uu=false;
lm8uu_diameter=(lme8uu==true) ? 16 : 15;
lm8uu_length=(lme8uu==true) ? 25 : 24;
lm8uu_radius = lm8uu_diameter / 2;
block_height = 2*lm8uu_length+17;

//==================================


// Triangles
marge_llarg=75;
marge_curt=10;
lateral=320+marge_llarg*2;
altura=lateral*sin(60);

//y_off=7*8.65;
y_off=60;
ample_z=100;
marge_z=20;
offset_z=20; //eleva inici del forat eix z
altura_z=(lateral-(ample_z/2+marge_z)/cos(60))*sin(60)-marge_z-offset_z;


// Lamines base i frontal

llarg_base=234;
curt_base=80;
llarg_front=llarg_base+40;

// Safata
distC_safata=210;
distV_safata=140;
distB_safata=40;
dist_belt=18;
ample_safata=220;
llarg_safata=220;
dist_bushing=28;

ample_total=410; //distancia entre centres de varilles llises Z
// z_motor
llarg_zm=(ample_total-llarg_base-grosor*2)/2 + 20;
//llarg_zm=100;
ample_zm=hole_separation+m8_clearance_hole*2+10;
zdist=30;

//extruder
x_motor_ex=xventilador+10+hotend_hole_sep/2+10;
y_motor_ex=10;
hotend_rotation=90; 
llarg_ex=xventilador+hotend_hole_sep+l_motor+30;
ample_ex=xbars_separation+m8_clearance_hole*2+10;

//xend
ample_xe=ample_ex;
llarg_xe=zdist+40;


//y motor
llarg_ym=hole_separation+threaded_rod_diameter+20;

//alt
ample_ym=a_motor+10;

//x carriage
llarg_xc=105;
ample_xc=xbars_separation+bushing_holes_dist+10;

