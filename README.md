# LoginDialog

Using QML to create a simple dialog that allows a user to log into an
application configuration utility we will create.

The login dialog is fairly simple in concept and much like many other login dialogs
you’ve likely encountered. Here are a few places it diverges from what you
might otherwise expect. 

The username is a drop down of pre-configured usernames read from a SQLite
database. 

The password will be masked so no one can see what is typed (ex: ********), but once the password 
matches, the password mask will turn green. If a username is selected and the password
field has any characters in it, the Ok button will be enabled, otherwise the Ok button is disabled.  

The password will be stored in a SQLite database as a hash so the password will
need to be run though a C++ hash function in order to know if the password
should be shown in green. 

The Username and Password label text will come from a C++ method call and will
contain UTF-8 strings. Username and password values will also contain UTF-8 strings.

The dialog is fixed in size at runtime but must display on a wide range of display sizes. 

The dialog will be reused in multiple applications. To help with this, modularizing the dialog is important. 
Lack of modularity will carefully scrutinized. 

The goal is to estimate on how long it should take us to implement this dialog. 
