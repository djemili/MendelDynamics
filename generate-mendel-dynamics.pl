#!/usr/bin/perl

# Mendel Dynamics
# Perl script that generates the STL and DXF files
# GNU GPL v3
# Emili Sapena 
# emili@bcndynamics.com
# bcndynamics.com
# http://wiki-es.bcndynamics.com/Mendel_Dynamics
# http://github.com/djemili/MendelDynamics

# Set of plates. Can be done by laser-cut methacrylate, wood, aluminium.
# Many of them can also be 3D-printed
my @plates = ('triangle', 'base', 'front', 'back', 'bed', 'x-carriage', 'x-end-motor', 'x-end-motor-top', 'x-end-motor-v',
'x-end-idler', 'x-end-idler-top', 'x-end-idler-v', 'y-motor', 'z-motor', 'z-end', 'z-end-bottom');

# Set of printable pieces
my @pieces = ();

# openscad -s metric-prusa/z-motor-mount.stl source/z-motor-mount.scad
