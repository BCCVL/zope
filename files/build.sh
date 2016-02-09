#!/bin/bash
#
# Buildout config file to use. Default: base.cfg
#
if [ -z "$CONFIG" ]; then
    CONFIG="base.cfg"
fi
echo "Using $CONFIG"
echo ""

#
# Use python version. Default: 2.7
#
if [ -z "$PYTHON" ]; then
  PYTHON="/usr/bin/env python"
fi
echo "Using Python: "
echo `$PYTHON --version`
#
# Run bootstrap.py
#
# we need eggs folder so that we can collective.recipe.environment during bootstrap
mkdir -p eggs
echo "Running $PYTHON bootstrap-buildout.py -c $CONFIG --buildout-version=$ZCBUILDOUT --setuptools-version=$SETUPTOOLS"
$PYTHON "bootstrap-buildout.py" -c $CONFIG --buildout-version $ZCBUILDOUT --setuptools-version=$SETUPTOOLS

mkdir -p $Z_VAR
mkdir -p $Z_CONF

#
# Run buildout
#
echo "Running bin/buildout -c $CONFIG"
./bin/buildout -c $CONFIG

chown -R zope:zope $Z_CONF
chown -R zope:zope $Z_VAR
