# $Id$

package Enegger::ExitStatus;
use strict;
use parent qw( Data::ObjectDriver::BaseObject );

__PACKAGE__->install_properties({
               columns     => [ qw( jobid status funcid
                                    completion_time delete_after ) ],
               datasource  => 'exitstatus',
               primary_key => 'jobid',
           });

1;
