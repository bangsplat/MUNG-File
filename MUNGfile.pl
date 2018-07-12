#!/usr/bin/perl

use strict;
use Getopt::Long;

# 
#   MUNG File
#   MUNGfile.pl
# 
#   Mash Until No Good
#   copy a file, introducing errors so as to make it corrupt
# 
#   version 0.1
# 


# initial thoughts
#
# input file
# output file
# frequency of issue
# likelihood of issue
# severity of issue
# header
# footer
# 
# say file is 1000 bytes long
# frequency is 1%
# so one byte in the first 100 will be chosen for possible munging
# 
# copy header bytes over uncorrupted (so tools will still recognize it as its intended file type)
# step through byte by byte
# each byte, calculate based on how far we are into the frequency chunk we are
# generate a random number
# if we’re over the calculated value, this is the byte
#     generate another random number
#     if we’re over the likelihood 
#         mess up the byte
#     skip the rest of the frequency chunk
# repeat
# once we get to filesize-footer
#     copy rest of file uncorrupted
# 
# severity is meant to be a value from 1-8, which tells how many bits get munged
# > 8 means bytes following target byte are also munged?
# 1 means one bit gets flipped (randomly, ideally)
# 8 means every bit gets flipped
# convert every target byte into a bitstring and do bitwise operation (XOR?) to get result


my( $help_param, $version_param, $input_param, $output_param );
my( $frequency_param, $likelihood_param, $severity_param );
my( $header_param, $footer_param );
my( $debug_param, $test_param );


GetOptions( 'help|?'        =>  \$help_param,
            'version|v'     =>  \$version_param,
            'input|i=s'     =>  \$input_param,
            'output|o=s'    =>  \$output_param,
            'frequency|f=n' =>  \$frequency_param,
            'chance|c=n'    =>  \$likelihood_param,
            'severity|s=n'  =>  \$severity_param,
            'header=n'      =>  \$header_param,
            'footer=n'      =>  \$footer_param,
            'test!'         =>  \$test_param,
            'debug!'        =>  \$debug_param );

if ( $debug_param ) {
    print "Passed Parameters:\n";
    print "help = $help_param\n";
    print "verion = $version_param\n";
    print "input = $input_param\n";
    print "output = $output_param\n";
    print "frequency = $frequency_param\n";
    print "likelihood = $likelihood_param\n";
    print "severity = $severity_param\n";
    print "header = $header_param\n";
    print "footer = $footer_param\n";
    print "test = $test_param\n";
    print "debug = $debug_param\n";
}

# if the user asked for version information, display it and quit
if ( $version_param ) {
    print "$0 version 0.1\n";
    exit;
}

if ( $help_param ) {
    print "$0\n";
    print "verion 0.1\n";
    print "Command line parameters:\n\n";
    exit;
}

if ( $input_param eq undef ) { die "Please specify an input file\n"; }

# set parameter defaults
if ( $debug_param eq undef ) { $debug_param = 0; }		# false
if ( $test_param eq undef ) { $test_param = 0; }		# false

if ( $header_param eq undef ) { $header_param = 0; }    # no header
if ( $footer_param eq undef ) { $footer_param = 0; }    # no footer

## output should be input file name with something appended ("_mung"?)
## frequency should default to something like 1000000 (1 byte every 1 million bytes)
## likelihood should default to something like 0.5 (50%)
## severity should be default to something like 1 (1 bit)

if ( $debug_param ) {
    print "Adjusted Parameters:\n";
    print "help = $help_param\n";
    print "verion = $version_param\n";
    print "input = $input_param\n";
    print "output = $output_param\n";
    print "frequency = $frequency_param\n";
    print "likelihood = $likelihood_param\n";
    print "severity = $severity_param\n";
    print "header = $header_param\n";
    print "footer = $footer_param\n";
    print "test = $test_param\n";
    print "debug = $debug_param\n";
}












