package Template::Plugin::TallyMarks;

use 5.006;
use strict;
use warnings;

use parent 'Template::Plugin::Filter';

=head1 NAME

Template::Plugin::TallyMarks - Convert numbers to tally marks.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

The module implements a filter that changes a number into tally marks.

    use Template;
    my $tt = 'Template'->new;
    $tt->process( \ '[% USE TallyMarks %][% n | tally_marks %]',
                  { n => 12 },
                  \ my $result );
    print $result;  # <s>||||</s>&nbsp;<s>||||</s>&nbsp;||

=head1 Filters

=head2 tally_marks

Transforms the input parameter into tally marks.

=cut

sub init {
    my $self = shift;
    $self->install_filter('tally_marks');
    return $self
}


sub filter {
    my ($self, $n) = @_;
    return join '&nbsp;',
                ('<s>||||</s>') x int($n / 5),
                ('|' x ($n % 5)) || ()
}

=head1 AUTHOR

E. Choroba, C<< <choroba at matfyz.cz> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-template-plugin-tallymarks at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Template-Plugin-TallyMarks>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Template::Plugin::TallyMarks


You can also look for information at:

=over 4

=item * MetaCPAN

L<https://metacpan.org/Template::Plugin::TallyMarks>

=item * GitHub Repository

L<https://github.com/choroba/template-plugin-tallymarks/>

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Template-Plugin-TallyMarks>

=item * Search CPAN

L<https://metacpan.org/dist/Template-Plugin-TallyMarks/>

=back


=head1 ACKNOWLEDGEMENTS

Thanks to Mohammad S Anwar for contribution.

=head1 LICENSE AND COPYRIGHT

Copyright 2016 E. Choroba.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

__PACKAGE__
