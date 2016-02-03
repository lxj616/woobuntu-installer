# woobuntu-installer
A gui installer for woobuntu tools

Used QT5 for development

If you're using woobuntu , all dependencies have been met

    qmake
    make

Update on 20160202: Don't use root privilege now , all scripts will ask for sudo
 when needed

Tests showed that woobuntu-installer would support more linux distributions usin
g gnome-terminal now , but there could be other problems ( encoding\root login\dependencies )

## Plugins development ##

Just create a script under script/ folder's sub-directory

    script/some-catagory/xxx.sh

Then make a description under desc/ folder with the same name pattern

    desc/some-catagory/xxx.sh.desc
