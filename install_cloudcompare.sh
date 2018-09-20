#!/bin/bash

# Dependencies boost,flann,Eigen,Qt,VTK,PCL are assumed to be installed in
# /usr/local. Tested with the following versions:
# 
# boost: 1.62.0
# flann: 1.8.4
# Eigen: 3.2.10
# Qt: 5.9.1
# VTK: 7.0.0
# PCL: 1.8.0

OLD_PWD=$(pwd)

cd && mkdir -p cloudcompare && cd cloudcompare
git clone https://github.com/cloudcompare/trunk.git 
mkdir -p build && cd build

cmake ../trunk \
  -DCMAKE_INSTALL_PREFIX=/usr/local \
  -DCMAKE_BUILD_TYPE=Release \
  -DQT5_ROOT_PATH=/usr/local/ \
  -DEIGEN_ROOT_DIR=/usr/local/include/eigen3 \
  -DCOMPILE_CC_CORE_LIB_WITH_TBB=ON \
  -DOPTION_USE_DXF_LIB=ON \
  -DOPTION_USE_SHAPE_LIB=ON \
  -DINSTALL_EXAMPLE_PLUGIN=ON \
  -DINSTALL_EXAMPLE_GL_PLUGIN=ON \
  -DINSTALL_EXAMPLE_IO_PLUGIN=ON \
  -DINSTALL_QADDITIONAL_IO_PLUGIN=OFF \
  -DINSTALL_QANIMATION_PLUGIN=OFF \
  -DINSTALL_QBROOM_PLUGIN=OFF \
  -DINSTALL_QCOMPASS_PLUGIN=OFF \
  -DINSTALL_QCSF_PLUGIN=OFF \
  -DINSTALL_QEDL_PLUGIN=OFF \
  -DINSTALL_QFACETS_PLUGIN=OFF \
  -DINSTALL_QHOUGH_NORMALS_PLUGIN=OFF \
  -DINSTALL_QHPR_PLUGIN=OFF \
  -DINSTALL_QM3C2_PLUGIN=OFF \
  -DINSTALL_QPCV_PLUGIN=OFF \
  -DINSTALL_QPHOTOSCAN_IO_PLUGIN=OFF \
  -DINSTALL_QPOISSON_RECON_PLUGIN=OFF \
  -DINSTALL_QSRA_PLUGIN=OFF \
  -DINSTALL_QSSAO_PLUGIN=OFF \
  -DINSTALL_QPCL_PLUGIN:BOOL=ON

make -j4 && sudo make install

cd $OLD_PWD
