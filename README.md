CheckMod
========

A bash script for interpreting chmod values

Usage
========
$ checkmod.sh XXX

example:
$ checkmod.sh 566
         Read   Write   Execute
##=================================
Owner     1       0       1
Group     1       1       0
Other     1       1       0
