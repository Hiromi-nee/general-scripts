#!/usr/bin/perl

#Renames file.jpg to md5(file).jpg
#matches *.jpg and *.jpg.* (wget repetitions)
#By Hiromi

use Digest::MD5;
$md5 = new Digest::MD5;

opendir(DIR, "./");
my @files = readdir(DIR);


foreach my $files (@files) {
        if ($files =~ /$\.jpg\.(.)*/ || $files =~ /$\.jpg/){
                open(FILE, $files) or die "Can't open '$files': $!";
                seek(FILE, 0, 0);
                $md5->reset;
                $md5->addfile(FILE);
                $d = $md5->hexdigest;
                printf "$d $files\n";
                $f2 = $d . ".jpg";
                rename($files, $f2) or die "Herped";
                }
        }