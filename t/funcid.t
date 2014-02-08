# $Id$
# -*-perl-*-

use strict;
use warnings;

require 't/lib/db-common.pl';

use Enegger;
use Test::More tests => 24;

run_tests(8, sub {

    my $client = test_client(dbs => ['ts1']);

    my $handle;
    $handle = $client->insert("feedmajor", { scoops => 2, with => ['cheese','love'] });
    isa_ok $handle, 'Enegger::JobHandle', "inserted job";

    my $job = $handle->job;
    isa_ok $job, 'Enegger::Job';

    ok($job->funcid, 'jobs have funcids');
    is $job->funcname, 'feedmajor', 'handle->job gives us the right job';

    my $job2 = Enegger::Job->new(
                                     funcname => 'feedmajor',
                                     run_after=> time() + 60,
                                     priority => 7,
                                     arg      => { scoops => 2, with => ['cheese','love'] },
                                     coalesce => 'major',
                                     jobid    => int rand(5000),
                                     );
    ok($job2);

    my $h2 = $client->insert($job2);
    isa_ok $h2, 'Enegger::JobHandle';

    my $job2_back = $h2->job;
    ok($job2->funcid, "internal: funcid present");
    is($job2->funcname, "feedmajor", "funcname mapping worked");

    teardown_dbs('ts1');
});
