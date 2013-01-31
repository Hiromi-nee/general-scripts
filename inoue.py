import os
import sys
import hashlib
import re
directory = ""

jpg_re = re.compile("(.*)(\.jpg\.\d*|\.jpg|\.jpeg|\.jpeg\.\d*)$")
png_re = re.compile("(.*)(\.png\.\d*|\.png)$")
def sha1sum(filename):
    sha1 = hashlib.sha1()
    with open(filename, 'rb') as f:
        for chunk in iter(lambda: f.read(128*sha1.block_size), b''):
            sha1.update(chunk)
    return sha1.hexdigest()

def main():
    directory = sys.argv[1]

    for root, dirs, files in os.walk(directory):
        for file in files:
            if jpg_re.match(file):
                sha1hash = sha1sum(root+"/"+file)
                new_name = sha1hash + ".jpg"
                print sha1hash +" "+ root+"/"+file
                os.rename(root+"/"+file, root+"/"+new_name)
            elif png_re.match(file):
                sha1hash = sha1sum(root+"/"+file)
                new_name = sha1hash + ".png"
                print sha1hash +" "+ root+"/"+file
                os.rename(root+"/"+file, root+"/"+new_name)

if __name__ == "__main__":
    if len(sys.argv) == 2:
        main()
    else:
        print "Usage: python "+sys.argv[0]+" <directory>"