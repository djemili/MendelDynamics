#!/usr/bin/perl

# Mendel Dynamics
# Perl script that generates the STL and DXF files
# GNU GPL v3
# Emili Sapena 
# emili@bcndynamics.com
# bcndynamics.com
# http://wiki-es.bcndynamics.com/Mendel_Dynamics
# http://github.com/djemili/MendelDynamics

use strict;

# Set of plates. Can be done by laser-cut methacrylate, wood, aluminium.
# Many of them can also be 3D-printed
my @plates = ('triangle', 'base', 'front', 'back', 'bed', 'x-carriage', 'x-end-motor', 'x-end-motor-top', 'x-end-motor-v',
'x-end-idler', 'x-end-idler-top', 'x-end-idler-v', 'y-motor', 'z-motor', 'z-end', 'z-end-bottom');

# Set of printable pieces
my @pieces = (); #('bar-clamp', 'belt-clamp', 'corner', 'plate-clamp', );

# openscad -s metric-prusa/z-motor-mount.stl source/z-motor-mount.scad

# plates in DXF
print "Generating plates:\n";
foreach my $plate (@plates) {
	my $cmd = "openscad -o objects/plates/$plate.dxf -D 'dxf=true' source/$plate.scad &> log/$plate.dxf.log";
	print "Executing $cmd...\n";
	system($cmd);
	$cmd = "openscad -o objects/plates/$plate.stl -D 'dxf=false' source/$plate.scad &> log/$plate.stl.log";
	print "Executing $cmd...\n";
	system($cmd);
}

# printable pieces STL
print "Generating pieces:\n";
foreach my $piece (@pieces) {
	my $cmd = "openscad -o objects/pieces/$piece.stl source/$piece.scad > log/$piece.stl.log";
	print "Executing $cmd...\n";
	system($cmd);
}
