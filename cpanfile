requires 'perl', '5.008005';
requires 'Data::ObjectDriver', '0.04';
requires 'Digest::MD5';
requires 'Storable';
requires 'parent';

on test => sub {
    requires 'Test::More', '0.98';
};
