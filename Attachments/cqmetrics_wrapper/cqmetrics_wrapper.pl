#!/usr/bin/env perl

use warnings;
use strict;


use IPC::Open2;
use Data::Dumper;
use v5.10;
undef $/;


my $whole_function_regex =
qr/
        (?:static\ |)              # optional static keyword
        (?:inline\ |)              # optional inline keyword
        (?:\w+(?:\s\*+|\s\*+\s|\*+\s|\s))  # return type
        (?:\w+)                    # function name
        \([^\)]*?\)                        # parameters
        \n\{                                # the opening brace: {
        [\s\S]*?                            # function body
        \n\}                                # closing brace
/x;

my $function_name_regex =
    qr/
          (?:static\ |)              # optional static keyword
          (?:inline\ |)              # optional inline keyword
          (?:\w+(?:\s\*+|\s\*+\s|\*+\s|\s))  # return type
          (?<function_name>\w+)                    # function name
          \([^\)]*?\)                        # parameters
          \n\{                                # the opening brace: {
          [\s\S]*?                            # function body
          \n\}                                # closing brace
      /x;

print_header();

# Print metrics for all files
while ( my $c_file = <> )
{
    my $current_filename = $ARGV;

    my @all_c_functions =
        ($c_file =~ /$whole_function_regex/g) ;

    # print metrics for all function in file
    for my $function ( @all_c_functions)
    {
        generate_and_print_stats($function, $current_filename);
    }
}


sub generate_and_print_stats
{
    my $function         = shift;
    my $current_filename = shift;

    # Obtain function name
    $function =~ m/$function_name_regex/;
    my $function_name = $+{function_name};

    # run cqmetrics with stdin and stdout redirected to this process
    my ($cqmetrics_out, $cqmetrics_in);
    open2($cqmetrics_out, $cqmetrics_in, '/home/richi/Coding/cqmetrics/qmcalc');

    print $cqmetrics_in $function;
    close($cqmetrics_in);

    my $function_stats = <$cqmetrics_out>;

    # say $function . "\n\n-------------------------------------------\n\n";
    print "$function_name\t" . "$current_filename\t" . $function_stats;
}

sub print_header
{
    open(my $header_file, "<", "/home/richi/Coding/cqmetrics/header.tab" );
    my $header = <$header_file>;
    print "function_name\t" . "file_name\t" . $header;
}

