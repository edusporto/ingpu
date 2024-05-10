#!/bin/bash

if [ ! -f boost_1_55_0.tar.gz ] ; then
  wget http://sourceforge.net/projects/boost/files/boost/1.55.0/boost_1_55_0.tar.gz
fi

if [ ! -d boost_1_55_0 ] ; then
  tar -xvzf boost_1_55_0.tar.gz
fi

if [ ! -d build ] ; then
  mkdir build
fi

cd build
cmake ..
make

