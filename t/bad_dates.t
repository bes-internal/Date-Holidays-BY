#!perl -T

use Test::More tests => 19;
use Test::Exception;

BEGIN {
	use_ok( 'Date::Holidays::BY' );
}

for my $f (qw( is_holiday is_business_day is_short_business_day )) {
	no strict 'refs';
	my $sub = \&{"Date::Holidays::BY::$f"};
	throws_ok { $sub->( 2024, 2, 31 ) } qr/^Bad date: 2024-2-31/, "$f: 31 Feb";
	throws_ok { $sub->( 2023, 2, 29 ) } qr/^Bad date: 2023-2-29/, "$f: 29 Feb, not leap year";
	throws_ok { $sub->( 2024, 13, 1 ) } qr/^Bad date: 2024-13-1/, "$f: month 13";
	throws_ok { $sub->( 2024, 4, 31 ) } qr/^Bad date: 2024-4-31/, "$f: 31 Apr";
	lives_ok  { $sub->( 2024, 2, 29 ) } "$f: 29 Feb, leap year";
	lives_ok  { $sub->( 2024, '02', '03' ) } "$f: zero-padded strings";
}
