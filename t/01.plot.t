use strict;
use Test::More 'no_plan';
use Imager;
use Imager::Color;
use Imager::QRCode;

my $qrcode01 = Imager::QRCode->new();
my $image01 = $qrcode01->plot('test test test');
ok(ref $image01 eq 'Imager', "new()");

my $qrcode02 = Imager::QRCode->new(
    size          => 2,
    margin        => 2,
    version       => 1,
    level         => 'M',
    casesensitive => 1,
    lightcolor    => Imager::Color->new(255, 255, 255),
    darkcolor     => Imager::Color->new(0, 0, 0),
);
my $image02 = $qrcode02->plot('test test test');
ok(ref $image02 eq 'Imager', "new() with parameters");

my $qrcode03 = Imager::QRCode->new({
    size          => 2,
    margin        => 2,
    version       => 1,
    level         => 'M',
    casesensitive => 1,
    lightcolor    => Imager::Color->new(255, 255, 255),
    darkcolor     => Imager::Color->new(0, 0, 0),
});
my $image03 = $qrcode03->plot('test test test');
ok(ref $image03 eq 'Imager', "new() with hashref parameters");

eval { my $image04 = $qrcode03->plot() };
like($@, qr/^Not enough arguments for plot\(\)/, "plot() must need argument");

eval { my $image04 = $qrcode03->_imager() };
like($@, qr/_imager\(\) argument must be Imager::ImgRaw/, "_imager() argument check");

