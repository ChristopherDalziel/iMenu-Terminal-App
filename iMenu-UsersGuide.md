# iMenu - Users Guide

## Install 
Double click the `install-iMenu.sh` file for automated install. 
Required gems: colorize, artii and argv (will install automatically if not already on your system).

### System Requirements 
System requirements Ruby 2.5.1, `rbenv` and homebrew.
macOS

### Basic Users Guide
1. Getting your custom menu input, move to the `menu.csv` file and input your menu items in order `name,description,price` exactly as the highlighted example.
2. Move to the `iMenu-Main.rb` file and edit the welcome graphic to suit your buisness, replacing over the `('BurgerLand')` example, more notes in file. 
3. To run iMenu at full functionally use the boot function `ruby customer.rb show_menu`, your other option is to run the app without the menu functions (preferable for a CSR who already knows your menu's) to do this instead boot without 'show_menu' by entering `ruby iMenu-Main.rb`.
4. Run through a test transaction and check the `output.csv` file for your transaction history.
5. Complete! 

### Error Handling
Error handling with iMenu is easy, since we always have an on screen display we can see where the error has gone wrong, if an input is incorrect iMenu is designed to let you know and stop you from proceeding.
If an error is ever made during a transaction (Example; payment error) and the customer made an incorrect payment or purchase all history is inside `output-iMenu.csv`. 
Incase of a major error, please if possible screen grab your error code (or written, if screen grab isn't possible) and email to `iMenu-errors@outlook.com`, we will aim to get back to you within 48 hours.

### Known Bugs
I am currently aware of a bug of been able to add a random input when making a burger selection (Example: "siognirj" will output a result), I am still working to fix this, at this time.

Check back for new features soon!