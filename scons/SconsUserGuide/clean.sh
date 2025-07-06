find . -iname Sconstruct -execdir scons -c \;
find . -iname '.sconsign.dblite' -exec rm {} \;
git status --ignored
