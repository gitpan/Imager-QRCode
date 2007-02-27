use strict;
use Test::More 'no_plan';
use Imager;
use Imager::Color;
use Imager::QRCode qw(plot_qrcode);

my $image01 = plot_qrcode('test test test');
ok(ref $image01 eq 'Imager', "plot_qrcode()");

my $image02 = plot_qrcode('test test test', {
    size          => 2,
    margin        => 2,
    version       => 1,
    level         => 'M',
    casesensitive => 1,
    lightcolor    => Imager::Color->new(255, 255, 255),
    darkcolor     => Imager::Color->new(0, 0, 0),
});
ok(ref $image02 eq 'Imager', "plot_qrcode() with hashref paramaters");

eval { my $image03 = plot_qrcode() };
like($@, qr/^Not enough arguments for plot\(\)/, "plot() must need argument");
