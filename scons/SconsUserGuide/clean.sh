set -e

find . -iname Sconstruct -execdir scons -c \;
find . -iname '.sconsign.dblite' -exec rm {} \;
find . -iname '*.o' -exec rm {} \;
git status --ignored
