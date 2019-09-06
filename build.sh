chmod +x ./build.sh

mkdir dist
cp ./iMenu-Main.rb ./dist
cp ./iMenu-Classes.rb ./dist
cp ./menu-iMenu.csv ./dist
cp ./output-iMenu.csv ./dist

gem install colorize
gem install artii