### generates a precompiled zig lang dir in the current dir
### for different systems and versions, 
### simply change the system architecture and zig version after yq on line 12

# if test "$(ls | sed -e "s/zig-lang//"  -e "s/zig-update.fish//")" != ""
# 	echo dir is dirty 
# 	exit
# end

echo querying zig master image...
echo setting master package uri...
set -l uri $(curl https://ziglang.org/download/index.json | yq .master.x86_64-linux.tarball | string trim)
echo ...done\r\n

echo fetching tar file contents...
wget $uri
echo ...done\r\n

echo getting tar file name...
set -l pkg $(ls | rg "\.tar\.xz" | string trim)
echo ...done\r\n

echo unpacking tar...
tar -xf $pkg
echo ...done\r\n


echo removing tar file $pkg...
rm -rf $pkg 
echo ...done\r\n

echo checking if zig-lang/ already exists...
if test $(fd zig-lang -t d) 
	echo removing old zig-lang/ dir...
	rm zig-lang -rf 
	# if test $(ls | wc -l) != 2
	# 	echo assert failed
	# 	exit
	# end
	echo ...done\r\n
end
echo ...done\r\n

echo setting new zig-lang/ dir...
set -l zd $(echo $pkg | string trim --right --chars=".tar.xz")
echo ...done\r\n

echo renaming $zd to zig-lang...
mv $zd zig-lang
echo ...done\r\n

echo finished successfully
