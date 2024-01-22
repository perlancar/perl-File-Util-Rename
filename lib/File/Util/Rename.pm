package File::Util::Rename;

use 5.010001;
use strict;
use warnings;

use Exporter 'import';

# AUTHORITY
# DATE
# DIST
# VERSION

our @EXPORT_OK = qw(
                       rename_noclobber
               );

sub rename_noclobber {
    my $opts = ref $_[0] eq 'HASH' ? shift : {};
    $opts->{pattern} //= " (%02d)";

    my ($from, $to) = @_;
    my $ext; $to =~ s/(\.\w+)\z// and $ext = $1;

    my $i = 0;
    my $to_final;
    while (1) {
        if ($i) {
            my $suffix = sprintf $opts->{pattern}, $i;
            $to_final = $ext ? "$to$suffix$ext" : "$to$suffix";
        } else {
            $to_final = $to;
        }
        lstat $to_final;
        last unless -e _;
        $i++;
    }
    rename $from, $to_final;
}

1;
# ABSTRACT: Utilities related to renaming files

=head1 SYNOPSIS

 use File::Util::Symlink qw(
     rename_noclobber
 );

 rename_noclobber "foo.txt", "bar.txt"; # will rename to "bar (01).txt" etc if "bar.txt" exists


=head1 DESCRIPTION


=head1 rename_noclobber

Usage:

 rename_noclobber( [ \%opts , ] $from, $to );

Known options:

=over

=item * pattern

Str. Defaults to " (%02d)".

=back


=head1 SEE ALSO

L<File::Copy::NoClobber>

=cut
