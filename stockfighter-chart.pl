#!/usr/bin/perl

use strict;
use warnings;
use JSON::XS  'decode_json';
use LWP::Simple; #needs https support
use Data::Dumper;
my $decoded_json ;

print "Enter Venue: "; #use TESTEX
my $VENUE = <STDIN>;
chomp($VENUE);
print "Enter Symbol: "; #use FOOBAR
my $STOCK = <STDIN>;
chomp($STOCK);


my $req = 'https://api.stockfighter.io/ob/api/venues/' . $VENUE . '/stocks/' . $STOCK . '/quote';
do {
my $json = get ($req);

die "Could not get $req" unless defined $json;
my $decoded_json = decode_json ( $json );

print "bid: \$" . $decoded_json->{bid} . "\n";
sleep(5);   
}
#print Dumper $decoded_json;
#open FILE, "chart.svg" or $die!;
while ($decoded_json->{ok});
