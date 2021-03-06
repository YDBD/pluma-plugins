#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="pluma-plugins"

(test -f $srcdir/configure.ac) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level $PKG_NAME directory"
    exit 1
}

which mate-autogen || {
    echo "You need to install mate-common from MATE Git"
    exit 1
}

ACLOCAL_FLAGS="$ACLOCAL_FLAGS -I m4" \
REQUIRED_AUTOMAKE_VERSION=1.9 \
REQUIRED_MACROS=python.m4 \
USE_MATE2_MACROS=1 \
. mate-autogen
