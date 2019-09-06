# iMenu - Terminal App(Assignment 1)
Christopher Dalziel, Due: Friday 6th, September 2019

## Pitch 
iMenu is created to be a easy to use POS sale system that can be used directly by the customer (or with slight modification a trained CSR)
The built in menu datacase makes changing your menu and breeze! Alls you need to do is punch in a name, description and price of an item and the app will do the rest! Removing an item is just as easy. After the iMenu app takes payment from your customer it exports that data for you to an easy to read output file, which can be customized to output any of the data that is input via the app. In the future extra functionallity will include output data calculated in app to show profits and other relevant data and further options to add more databases, multiple menus, and have the ability for the customer to add/remove items from their order.

## List of features 
1. Database menu/Display
2. Further database display (Multiple Menu's, Future)
3. Customer order input
4. Change order (Future)
5. Pay
6. Print orders for the day

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

## Development Plan
Begin app with a basic linked csv file for the menu, put some basic information in this file (eg. name, description, price, sku(?)). Link the files and seperate the information from the csv menu file so it can be printed appealingly into a menu. 
- Removed sku for app simplicity/requirement although if required in the future I'm sure it could be implimented

Allow the user to select an item from the menu to purchase and make changes before purchasing. (Add extra condiments, drinks etc).
- I thought of a few ways of doing this, seperate menus in other csv files, adding the total together before completeing the order, would probably be the easiest, other class options potentionally. A hash? 

App asks for a payment and returns a change value of the user attempted to pay too much, system asks for more money if the purchase.
- App currently does this expanding on this idea however I touch on at the bottom of the plan using ARGV to impliment a till or similiar options.

Upon the payment been completed the app will process and export information to a seperaye output csv, the purpose of this will be to track purchases, profits or just general incoming money. etc. 
- App currently does export data post transaction and can export any data taken in during the process if desired, In the future I'd like to improve on this by including a profit output instead which would be calculated in app, potentionally combined at the end of day or when the user desires.

Then ask if there is another order and loops back to the top of the code if required.
- App achieves this

Using ARGV there are some things we could impliment - Removing sections of the app to make service easier for a cashier or for a user who is aware of the menu/system already.
- I also thought about adding a cashier options would take or remove an amount from a till amount added at the begining of code.

I am currently aware of a bug of been able to add a random input when making a burger selection (Example: "siognirj" will output a result), I am still working to fix this, at this time.

## How the user will interact with your app 
Open opening the app a pre-installed menu will be displayed, the user will be able to ask for further info on each intem displayed here or chose to move on without it. The app will them ask the user to place an order of an item displayed off the menu. In the future the menu will be adjusted to include multiple's of the same items, and further items/extra menu's (Drinks, Deserts etc.). 
Once the user has has chosen their item(s) the system will congradulate, repeat their order and ask for a payment input. If the user puts in the correct amount the app will return change or return their input to them if it's below the required, an amount equal to the required will proceed. 
Once the order is completed the order will be exported to a seperate csv file for records, which at a later date can be improved to track profits, order numbers, etc. Then the app will ask if there is another customer/order and repeat or end.

### Status Update 1
Hey Rachael/Harrison.

Emailing my first status update. 

My app is at point where it is doing the bare minimum of what it is supposed to be able to achieve. 
I’m able to display my menu database in the terminal, and have the user make a selection for their order, have my app inform them of a price and have the user enter a pay value. 
I also currently have a feature where at the end of my app the payment amount is outputted to a CSV file, I’m looking to expand on this to make it a profit sheet or a daily value possibly. 

My issues at the moment are struggling to create a loop to get the correct payment type. 
I feel as though my code isn’t very “DRY” but a lot of it is reliant on the users input into the terminal and I’m not too sure how dry it can be. 
Hoping to talk to one of you about that soon. 

Looking to implement another CSV for a drink menu for another feature and combine that will the final order input. 
Still need to implement a gem and look at documentation but I have made a very small start. 

Thanks, 
Christopher Dalziel

### Status Update 2
Hey Harrison/Rach 

Just sending you my second status update. 

I’m currently happy with where my app is sitting and I’m now focusing on all the documentation that goes with it. 
Feel like I’ve touch on almost all of the things, following through using my trello. I feel like I may have some questions about the format of the files and how they’re supposed to be split because I feel like a few people had a few different ideas? 

I still need to automate my app. 

I think that’s everything, see you tomorrow! 

Thanks,
Chris

### Links
GitHub: 'https://github.com/ChristopherDalziel/t_app'

Trello: 'https://trello.com/b/n96kg5Td/terminal-app'