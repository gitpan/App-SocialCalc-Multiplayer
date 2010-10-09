#!/usr/bin/env perl
use strict;
use Plack::Runner;
use File::ShareDir 'dist_dir';
my $home = dist_dir('App-SocialCalc-Multiplayer');
if ($> == 0) {
    system(qq["$^X" "$home/socketpolicy.pl" &]);
}
print "Please connnect to: http://localhost:9999/\n";
my $runner = Plack::Runner->new;
$runner->parse_options(-s => Feersum => -p => 9999 => "$home/app.psgi");
$runner->run;
