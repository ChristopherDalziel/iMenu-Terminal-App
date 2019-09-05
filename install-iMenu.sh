chmod +x ./build.sh

mkdir dist
cp .customer.rb ./dist
cp .iMenu_Classes.rb ./dist
cp .menu.csv ./dist
cp .output.csv ./dist
cp .iMenu_UsersGuide.md ./dist

gem install colorize
gem install artii
gem install argv 