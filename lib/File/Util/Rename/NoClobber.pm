package File::Util::Rename::NoClobber;

use 5.010001;
use strict 'subs', 'vars';
use warnings;

use Exporter 'import';
use File::Util::Rename ();

# AUTHORITY
# DATE
# DIST
# VERSION

our @EXPORT_OK = qw(
                       rename_noclobber
               );

*rename_noclobber = \&File::Util::Rename::rename_noclobber;

1;
# ABSTRACT: Rename files, avoid clobbering existing files

=head1 DESCRIPTION

This is L<File::Util::Rename>'s C<rename_noclobber>, put into a more explicit
module name for discoverability.


=head1 FUNCTIONS

=head2 rename_noclobber

See L<File::Util::Rename/rename_noclobber> for more details.

=cut
