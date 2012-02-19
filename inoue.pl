#!/usr/bin/perl

#Usage
#perl inoue.pl /path/to/top/directory/
#Renames file.jpg to md5(file).jpg
#matches *.jpg and *.jpg.* (wget repetitions)
#By Hiromi

use File::Find;
use Digest::MD5;
$md5 = new Digest::MD5;

@directories = shift;

finddepth(\&hash, @directories);

sub hash{
        if ($File::Find::name =~ /$\.jpg\.(.)*/ || $File::Find::name =~ /$\.jpg/){
                open(FILE, $File::Find::name) or die "Can't open '$File::Find::name': $!";
                seek(FILE, 0, 0);
                $md5->reset;
                $md5->addfile(FILE);
                $d = $md5->hexdigest;
                printf "$d $File::Find::name\n";
                $f2 = $d . ".jpg";
                rename($File::Find::name, $f2) or die "Herped";
         }
}