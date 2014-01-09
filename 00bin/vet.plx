#!/usr/bin/perl
#use warnings; use strict;

my $vetting_ok = 0;

open(U, '00atf/unvetted.atf') || die;
open(V, '>v') || die;
open(X, '>x') || die;
while (<U>) {
    if (/^###V/) {
	$vetting_ok = 1;
	next;
    }
    if ($vetting_ok) {
	print X;
    } else {
	print V;
    }
}
close(X);
close(V);

if ($vetting_ok) {
    system "cat v >>00atf/vetted.atf";
    system "mv x 00atf/unvetted.atf";
    system "wc v";
} else {
    warn "vet.plx: no ###V tag found; vetting cancelled\n";
}

1;
