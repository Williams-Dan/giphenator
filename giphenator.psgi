use strict;
use warnings;

use Giphenator;

my $app = Giphenator->apply_default_middlewares(Giphenator->psgi_app);
$app;

