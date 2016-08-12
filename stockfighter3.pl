#!/usr/bin/perl

use strict;
use warnings;
use JSON::XS  'decode_json';
use LWP::Simple; #needs https support
use Data::Dumper;
print "Enter Venue: "; #use TESTEX
my $VENUE = <STDIN>;
chomp($VENUE);
print "Enter Symbol: "; #use FOOBAR
my $STOCK = <STDIN>;
chomp($STOCK);

my $req = 'https://api.stockfighter.io/ob/api/venues/' . $VENUE . '/stocks/' . $STOCK;
my $json = get ($req);

die "Could not get $req" unless defined $json;
my $decoded_json = decode_json ( $json );
print Dumper $decoded_json;
print "Venue: " . $decoded_json->{venue}, " Symbol: ";
print $decoded_json->{symbol}, "\n";
my @bids = @{ $decoded_json->{bids}};
foreach my $buys (@bids) { #buys == bids
	print "Price: ",$buys->{"price"}," Quantity ",$buys->{"qty"} . "\n";
}
my @asks = @{ $decoded_json->{asks}};
foreach my $offers (@asks) { #offers == asks
	print $offers->{"price"},$offers->{"isBuy"} . "\n";
}
