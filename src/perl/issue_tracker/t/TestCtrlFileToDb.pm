#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use strict;
use autodie;
use warnings; 
use warnings    qw< FATAL  utf8     >;
use open        qw< :std  :utf8     >;
use charnames   qw< :full >;
use feature     qw< unicode_strings >;


use FindBin;
BEGIN { unshift @INC, "$FindBin::Bin/../lib" }

require Exporter ;
our @ISA = qw(Exporter);
our %EXPORT_TAGS = ( 'all' => [ qw() ] );
our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw() ;
our $AUTOLOAD =();

use Data::Printer ; 
use Cwd qw ( abs_path ) ;
use Getopt::Long;
use File::Basename      qw< basename >;
use Carp                qw< carp croak confess cluck >;
use Encode              qw< encode decode >;
use Unicode::Normalize  qw< NFD NFC >;
use Test::More tests => 3 ; 


$| = 1;

use IssueTracker::App::Utils::Initiator ; 
use IssueTracker::App::Utils::Logger ; 
use IssueTracker::App::Ctrl::CtrlFileToDb ; 


my $objInitiator 				= 'IssueTracker::App::Utils::Initiator'->new();	
my $appConfig					= {} ;
my $ProductBaseDir 			= $objInitiator->doResolveMyProductBaseDir();
my $ProductDir 				= $objInitiator->doResolveMyProductDir();
my $ProductInstanceDir 		= $objInitiator->doResolveMyProductInstanceDir();
my $EnvironmentName 			= $objInitiator->doResolveMyProductInstanceEnvironment();
my $ProductName 				= $objInitiator->doResolveMyProductName();
my $ProductVersion 			= $objInitiator->doResolveMyProductVersion();
my $ProductType 				= $objInitiator->doResolveMyProductType();
my $ProductOwner 				= $objInitiator->doResolveMyProductOwner();
my $ConfFile 					= $objInitiator->doResolveMyConfFile();
my $HostName					= $objInitiator->doResolveMyHostName();


$appConfig						= $objInitiator->get ('AppConfig'); 
# p($appConfig) ; 
# sleep 6 ; 

$appConfig->{'PrintConsoleMsgs' } = 0 ; 


my $objLogger					= 'IssueTracker::App::Utils::Logger'->new (\$appConfig);

my $LogFile						= $objLogger->get('LogFile') ; 
my $test_counter				= 1 ; 
my $issues_file            = $ProductInstanceDir . "/non/existent/file.txt" ; 
my $ret                    = 0 ; 
my $msg                    = {} ; 

my $objCtrlFileToDb = 
   'IssueTracker::App::Ctrl::CtrlFileToDb'->new ( \$appConfig ) ; 

isa_ok($objCtrlFileToDb, "IssueTracker::App::Ctrl::CtrlFileToDb");
$test_counter++ ; 

can_ok($objCtrlFileToDb, $_) for qw(doLoadTxtIssuesFileToDb);
$test_counter++ ; 

( $ret , $msg )            = $objCtrlFileToDb->doLoadTxtIssuesFileToDb ( $issues_file ) ; 
ok ( $ret eq 1 )  ; 

=debug
   print "start $0 \n" ; 
   p ( $appConfig ) ; 
   p ( $objLogger );
   print "stop  $0 \n" ; 
   sleep 6 ; 
=cut



# give a full stack dump on any untrapped exceptions
local $SIG{__DIE__} = sub {
   $0 = basename($0);  # shorter messages
    confess "Uncaught exception: @_" unless $^S;
};

# now promote run-time warnings into stackdumped exceptions
#   *unless* we're in an try block, in which 
#   case just generate a clucking stackdump instead
local $SIG{__WARN__} = sub {
   $0 = basename($0);  # shorter messages
    if ($^S) { cluck   "Trapped warning: @_" } 
    else     { confess "Deadly warning: @_"  }
};
# test that the return code is 1 if a non-existign isssue file is passed