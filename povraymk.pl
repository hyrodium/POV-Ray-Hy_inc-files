use strict;
use warnings;
use File::Modified;

print "Hello. This is povraymk, version 0.1.0.\n";
my @file = glob "*.pov";

if($#file == -1){
    print "No pov file in this directory.";
}
else{
    my $pov=$file[0];
    my $d = File::Modified->new(files=>[$pov]);

    print "Now rendering ";
    print $pov;
    print "...\n";
    system "start", "pvengine /RENDER \"".$pov."\"";

    while(1){
        my (@changes) = $d->changed;
        if (@changes) {
            print "Now rendering ";
            print $pov;
            print "...\n";
            system "start", "pvengine /RENDER \"".$pov."\"";
            $d->update();
        };
        sleep 1;
    };
}
