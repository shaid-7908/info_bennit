
# Bennit Prototype

## Pre-requisites

- PHP 7.4+ on a web server
- MySQL driver for your webserver
    - `sudo apt install php-mysql`
- MySQL or compatible database:
    - https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04
- Snowflake
    - `composer require godruoyi/php-snowflake`
- Stripe PHP
    - See [below](#Stripe).

## Install

- Create the database in `mysql` with admin privileges...
 ```
 CREATE DATABASE bennit;
 ```

- Import database file:
 ```
 USE bennit;

 SOURCE /path/to/bennit.sql;
 ```

- Create user and permissions:
 ```
CREATE USER 'dev'@'localhost' IDENTIFIED BY 'Str0ngP@ssword';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER 
 ON bennit.* TO 'dev'@'localhost' IDENTIFIED BY 'Str0ngP@ssword';

FLUSH PRIVILEGES;
 ```

## Default Credentials (You should change these!)

- Admin username: jonathan@bennit.ai
- Admin pass: 4SeekerSolverXChange(!)
- Guest username: guest@bennit.ai
- Guest password: bennitguest
- Other users password: 4Bennit!

## Stripe

- STRIPE_KEY in config (both live and debug)
- `sudo apt install composer`
- `sudo apt install php-curl`
- `composer require stripe/stripe-php` in the web app deploy folder

## Code Organization

This is basically just a CRUD system. 

Generally, the Create Read Update Delete functions are in a Class file in the `Class` roughly named after the corresponding table in the database. Classes start with a capital letter, and are instantiated in the `inc/header.php` with a lowercase letter.

The Create and Update (and sometimes Read) user interface generally is defined in a php file in the root roughly named after the corresponding class, but with an all lowercase file name. Generally, if a function in a class needs another class, it expects it to be passed in as an argument (the Views class is an exception, since it always needs the data Classes, so it keeps its own reference.)

The rest of the Read and Delete user interface is usually similarily named, but suffixed with "List.php" php file in the root, which loads a grid for list actions. The grids themselves are defined in the `Views` class. 

So for example, to show a list of users, a function in `classes/Users.php` class is used to query the database, the `userList.php` UI: checks permissions, invokes the class's query, sets up the page and grid settings, then calls `makeUserGrid` in `classes/Views.php` passing in the query result and config.

Generally, each UI page: checks if the user is logged in, shows any pending messages from server-side actions, checks if the user belongs there (has sufficient privileges and/or data), parses any queries (GET, POST or both, depending on the page), then interacts with the classes to perform any requested actions, then load and display data or results.

## Aditional info for code added by Xanther
The main entery point and the flow is almost same as before , we are still tracking the ``first_run`` to complete on boarding ,

No changes have been made in the code in regards to security , the login and registration process is same as before with few tweaking.

In the current flow the registration begins with ```choosePlan.php`` , In this page user will select a plan and it will take them to ```proceedPlan.php``` (note: you can find the stripe related js code here ) here user will enter an active email, which will be send to ```stripe``` , on completing the payment ```stripe``` will send the user to ```paymentsNregister.php``` with ```payment_id```. On this ```paymentsNregister.php``` we are collecting the ```payment_id``` and ```email``` used for payment , then we are storing it in ```tbl_bennit_subscriptions``` for later use and also we are sending mail to the same ```email`` for registering the user.

Once mail is recived user can click and it will take them to ```register.php``` and will complete the registration process. In case if user dosen get the link , or some how the link have been deleted then user can click the register icon on ```login.php``` and will take you to ```verifyandRegister.php``` where user will be able to enter the email , and if user have an active sub and is not registered it will take them to ```register.php``

If user have forgot the password he can go to ```forgotPassword.php`` , there if the user enters an email it will send a email with link to reset the password.

```findOpportunity.php``` is the page where user will be able to find the opportunities , in this page we have few modals , we are using ajax to set the content of those modals , you can find them in ```modal_forms``` folders

same goes for ```findsolver.php```

In every new page ```header.php``` and ```topbar.php``` must be included , ```header.php``` contains all ```class``` file imports and ```topbar.php``` conatins top nav bar 

Most pagse are devided into three parts top/side/body , to achive this we have writen 3 class ```xt-card-organizations``` the main wrapper inside that we have ```xt-sidebar-organization1``` and ```xt-body-organization1```

#### The ```bennit_n.sql``` conatins the structure of the data base
