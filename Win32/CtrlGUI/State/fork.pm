###########################################################################
# Copyright 2000, 2001 Toby Everett.  All rights reserved.
#
# This file is distributed under the Artistic License. See
# http://www.ActiveState.com/corporate/artistic_license.htm or
# the license that comes with your perl distribution.
#
# For comments, questions, bugs or general interest, feel free to
# contact Toby Everett at teverett@alascom.att.com
##########################################################################
use Win32::CtrlGUI;
use Win32::CtrlGUI::State;
use Win32::CtrlGUI::State::seq_opt;

use strict;

package Win32::CtrlGUI::State::fork;
use vars qw($VERSION @ISA);

@ISA = ('Win32::CtrlGUI::State::seq_opt');

$VERSION='0.10';

sub _is_recognized {
  my $self = shift;

  foreach my $i (0..$#{$self->{states}}) {
    if ($self->{states}->[$i]->is_recognized) {
      $self->{state} = 'rcog';
      $self->{states} = [ @{$self->{states}}[$i] ];
      return 1;
    }
  }
  return 0;
}

1;