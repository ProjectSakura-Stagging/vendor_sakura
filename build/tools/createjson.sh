# Specify colors utilized in the terminal
ppl='\033[0;35m'   # magenta
pnk='\033[1;35m'   # bright pink
wht='\033[1;37m'   # bold white
cya='\033[0;36m'   # cyan
rst='\033[0m'

echo "# GENERATING OTA JSON #"
echo "{"
echo '"response": ['
echo "{"
echo ' "datetime":' "\"$(grep ro\.build\.date\.utc $OUT/system/build.prop | cut -d= -f2)\","
echo ' "filename":' "\"$(basename $(ls $OUT/ProjectSakura*.zip))\","
echo ' "id":' "\"$((md5sum $OUT/ProjectSakura*.zip) | cut -d ' ' -f1)\","
echo ' "romtype":'"\"nightly\","
echo ' "size":' "$(stat -c%s $OUT/ProjectSakura*.zip)",
echo ' "support":' "false,"
echo ' "url":' "\"https://master.dl.sourceforge.net/project/projectsakura/$LINEAGE_BUILD/$(basename $(ls $OUT/ProjectSakura*.zip))\","
echo ' "version":' "\"17.0\","
echo ' "updater":' "true,"
echo ' "maintainer":' "\"$(printenv SAKURA_MAINTAINER)\","
echo "}"
echo "]"
echo "}"
echo " "
echo -e ${grn}"DONE!"
