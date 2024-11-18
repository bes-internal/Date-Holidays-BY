#!/usr/bin/perl
use utf8; use open qw(:utf8 :std);
use v5.26; no strict;
require "./lib/Date/Holidays/BY.pm";
# $Date::Holidays::BY::lang='ru';

for (1..1000) {
for $y (1992..2024) {

$holidays = Date::Holidays::BY::holidays( $y );
}

#     if ( my $holidayname = Date::Holidays::BY::is_holiday( 2024, 1, 1 ) ) {
#         print "Is a holiday: $holidayname\n";
#     }
#
#     if ( Date::Holidays::BY::is_business_day( 2012, 3, 11 ) ) {
#         print "2012-03-11 is business day on weekend\n";
#     }
#
#     if ( Date::Holidays::BY::is_short_business_day( 2015, 04, 30 ) ) {
#         print "2015-04-30 is short business day\n";
#     }
}

use Data::Dumper;
warn Data::Dumper::Dumper $Date::Holidays::BY::ref->{cache};

