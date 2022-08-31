.. _cli::p3-collate:


##########
p3-collate
##########


***************************************************
Extract the First N Rows for Each Value of a Column
***************************************************



.. code-block:: perl

     p3-collate.pl N [options]


This script will read through a tab-delimited file on the standard input and output the first N rows for each specific
value found in the key column. For example, if we have a set of genomes sorted by quality and we ask for a 3-row sample
based on the species column, it will extract the 3 best-quality genomes for each species.

Parameters
==========


The positional parameter must be the number of rows to extract for each value.

The standard input can be overridden using the options in :ref:`cli-input-options`.

Use the options in :ref:`cli-column-options` to select the key column.
=cut

use strict;
use P3DataAPI;
use P3Utils;

# Get the command-line options.
my $opt = P3Utils::script_opts('N', P3Utils::col_options(), P3Utils::ih_options(),
        );
# Open the input file.
my $ih = P3Utils::ih($opt);
# Read the incoming headers.
my ($outHeaders, $keyCol) = P3Utils::process_headers($ih, $opt);
# Form the full header set and write it out.
if (! $opt->nohead) {
    P3Utils::print_cols($outHeaders);
}
# Get the number of rows to sample. The default is 1.
my ($N) = @ARGV;
$N //= 1;
if ($N < 1) {
    die "Collation specifies no output.";
}
# This is the collation hash.
my %groups;
# Loop through the input.
while (! eof $ih) {
    my $couplets = P3Utils::get_couplets($ih, $keyCol, $opt);
    for my $couplet (@$couplets) {
        my ($key, $row) = @$couplet;
        if (! $groups{$key}) {
            $groups{$key} = [$row];
        } else {
            my $group = $groups{$key};
            if (scalar @$group < $N) {
                push @$group, $row;
            }
        }
    }
}
# Write the output.
for my $key (sort keys %groups) {
    my $group = $groups{$key};
    for my $row (@$group) {
        P3Utils::print_cols($row);
    }
}


