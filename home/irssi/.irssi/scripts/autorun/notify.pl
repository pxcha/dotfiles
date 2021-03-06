##
## Put me in ~/.irssi/scripts, and then execute the following in irssi:
##
##       /load perl
##       /script load notify
##

use strict;
use Irssi;
use vars qw($VERSION %IRSSI);

$VERSION = "0.01";
%IRSSI = (
    authors     => 'Luke Macken, Paul W. Frields',
    contact     => 'lewk@csh.rit.edu, stickster@gmail.com',
    name        => 'notify.pl',
    description => 'Use libnotify to alert user to hilighted messages',
    license     => 'GNU General Public License',
    url         => 'http://lewk.org/log/code/irssi-notify',
);

Irssi::settings_add_str('notify', 'notify_icon', '/home/pacha/.icons/irssi.png');
Irssi::settings_add_str('notify', 'notify_time', '5000');
Irssi::settings_add_str('notify', 'rotc', '/usr/share/pixmaps/rotc-ethernet.png');

sub notify {
    my ($server, $summary, $message) = @_;

    # Make the message entity-safe
    $message =~ s/&/&amp;/g; # That could have been done better.
    $message =~ s/</&lt;/g;
    $message =~ s/>/&gt;/g;
    $message =~ s/'/&apos;/g;

    my $cmd = "EXEC - notify-send" .
    " -i " . Irssi::settings_get_str('notify_icon') .
    " -t " . Irssi::settings_get_str('notify_time') .
    " '" . $summary . "'" .
    " '" . $message . "'";

    $server->command($cmd);
}

sub rotc {
    my ($server, $summary, $message) = @_;

    # Make the message entity-safe
    $message =~ s/&/&amp;/g; # That could have been done better.
    $message =~ s/</&lt;/g;
    $message =~ s/>/&gt;/g;
    $message =~ s/'/&apos;/g;

    my $cmd = "EXEC - notify-send" .
    " -i " . Irssi::settings_get_str('rotc') .
    " -t " . Irssi::settings_get_str('notify_time') .
    " '" . $summary . "'" .
    " '" . $message . "'";

    $server->command($cmd);
}

sub print_text_notify {
    my ($dest, $text, $stripped) = @_;
    my $server = $dest->{server};

    return if (!$server || !($dest->{level} & MSGLEVEL_HILIGHT));
    notify($server, $dest->{target}, $stripped);
}

sub private_msg_notify {
    my ($server, $msg, $nick, $address) = @_;

    return if (!$server);
    if ($nick eq "rotcbot") {
      rotc($server, "ROTC: Ethernet", $msg);
    } else {
      notify($server, "Private message from ".$nick, $msg);
    }
}

Irssi::signal_add('print text', 'print_text_notify');
Irssi::signal_add('message private', 'private_msg_notify');

