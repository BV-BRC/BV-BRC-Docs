.. _cli::p3-login:


########
p3-login
########

.. highlight:: perl


****************************
Create a BV-BRC login token.
****************************



.. code-block:: perl

     p3-login [options] username


Create a BV-BRC login token, used with workspace operations. To use this script, specify your user name on
the command line as a positional parameter. You will be asked for your password.

The following command-line options are supported.


logout
 
 The current user is logged out. If this option is specified, the user name is not required.
 


status
 
 Display the name of the user currently logged in. If this option is specified, the user name is not required.
 


If the command-line option \ ``--logout``\  is specified, you will be logged out. In this case, the user name is not required.

