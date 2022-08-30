#/usr/bin/sh

# Distribution Information
echo -e "\n###############################"
echo "## Distribution  Information ##"
echo -e "###############################\n"
lsb_release -a

echo -e "###### Package Installation Path ######"
echo "dpkg -L <packagename>"

# Compiler Information
## Ref: [Library path in gcc](https://transang.me/library-path-in-gcc/)
echo -e "\n##########################"
echo "## Compiler Information ##"
echo -e "##########################\n"
gcc -v
ldd --version

echo -e "\n###### GCC Default C Include Path ######\n"
echo | gcc -x c -E -Wp,-v - >/dev/null

echo -e "\n###### LD Default Libray Search Path ######\n"
ld --verbose | grep SEARCH_DIR | tr -s ' ;' \\012

echo -e "\n###### GCC Default Libray Search Path ######\n"
gcc -print-search-dirs | sed '/^lib/b 1;d;:1;s,/[^/.][^/]*/\.\./,/,;t 1;s,:[^=]*=,:;,;s,;,;  ,g' | tr \; \\012 | tr : \\012

# Hardware Information
echo -e "\n##########################"
echo "## Hardware Information ##"
echo -e "##########################\n"
lscpu

