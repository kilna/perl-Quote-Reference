package Quote::Reference;

use warnings;
use strict;

use Filter::Simple;

=head1 NAME

Quote::Reference - Shortcut notation for whitespace-delimited array and hash references

=head1 VERSION

Version 1.0.0

=cut

our $VERSION = '1.0.0';

=head1 SYNOPSIS

    use Quote::Reference;

    # Set $foo = ['this','is','an','array','reference']; 
    my $foo = qwr( this is an array reference ); 

    # Set $bar = {
    #     'red' => 'FF0000',
    #     'green' => '00FF00',
    #     'blue' => '0000FF'
    # }
    my $bar = qhr{
        red    FF0000
        green  00FF00
        blue   0000FF
    };

=head1 DESCRIPTIONG

This module uses source filtering to allow creating hash and array references just as easily and clean as using qw(...).

The following new quotelike operators are created:

=head2 qwr(...)

This behaves in the same way as qw(...) except that it returns an array reference instead of a list.  

Mnemonic: qw that returns a reference

=head2 qhr(...)

This behaves in the same way as qw(...) except that it returns a hash reference instead of a list.  

Mnemonic: quote for hash references

=head1 CAVEATS

Since this module is based on source filtering, if you have the strings 'qwr' or 'qhr' anywhere in your code, you will get unexpected results.

=cut

FILTER_ONLY
    code_no_comments => sub { s/ qwr  \(  (.*?) \) /[ qw($1) ]/gsx   },
    code_no_comments => sub { s/ qwr  \{  (.*?) \} /[ qw{$1} ]/gsx   },
    code_no_comments => sub { s/ qwr  \[  (.*?) \] /[ qw[$1] ]/gsx   },
    code_no_comments => sub { s/ qwr  \<  (.*?) \> /[ qw<$1> ]/gsx   },
    code_no_comments => sub { s/ qwr (\S) (.*?) \1 /[ qw$1$2$1 ]/gsx },
    code_no_comments => sub { s/ qhr  \(  (.*?) \) /{ qw($1) }/gsx   },
    code_no_comments => sub { s/ qhr  \{  (.*?) \} /{ qw{$1} }/gsx   },
    code_no_comments => sub { s/ qhr  \[  (.*?) \] /{ qw[$1] }/gsx   },
    code_no_comments => sub { s/ qhr  \<  (.*?) \> /{ qw<$1> }/gsx   },
    code_no_comments => sub { s/ qhr (\S) (.*?) \1 /{ qw$1$2$1 }/gsx },
    all => sub {
        return unless (defined $Quote::Reference::DEBUG && $Quote::Reference::DEBUG);
        print $_
    };

=head1 AUTHOR

Anthony Kilna, C<< <anthony at kilna.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-quote-reference at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Quote-Reference>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Quote::Reference


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Quote-Reference>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Quote-Reference>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Quote-Reference>

=item * Search CPAN

L<http://search.cpan.org/dist/Quote-Reference>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Anthony Kilna, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Quote::Reference
