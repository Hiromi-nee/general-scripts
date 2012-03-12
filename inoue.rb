# inoue.pl rewritten in Ruby.
# Hiromi

require 'find'
require 'digest'

hito = ARGV

def hashing(fname)
        @md5_digest = Digest::MD5.file(fname).hexdigest
        File.rename(fname, File.dirname(fname)+ "/" + @md5_digest + ".jpg")
	p "#{@md5_digest} #{fname}"
end

Find.find(hito[0])do |filename|  
	hashing(filename) if filename.match(/(\.jpg\.(.)*|\.jpg|\.jpeg|(.)*tumblr_(.)*)$/)
end
