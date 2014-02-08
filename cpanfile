requires 'Data::ObjectDriver', '0.04';
requires 'Digest::MD5';
requires 'Storable';

on build => sub {
    requires 'ExtUtils::MakeMaker', '6.36';
    requires 'Test::More', '0.88';
};
