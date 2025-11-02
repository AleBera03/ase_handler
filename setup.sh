#!/bin/bash

WORKDIR="$(pwd)"
echo $WORKDIR

grep -qxF "export PATH=\"$WORKDIR:\$PATH\"" ~/.bashrc || {
  echo "export PATH=\"$WORKDIR:\$PATH\"" >> ~/.bashrc
}

cd ..
FATHERFIR="$(pwd)"
git clone https://github.com/cad-polito-it/ase_riscv_gem5_sim.git
sudo chmod -R +x ase_riscv_gem5_sim
cd ase_riscv_gem5_sim
# substitute correct gem_visualizer-dep.sh
cp -v "../ase_handler/base_files/gem-visualizer_dep.sh" "utils/Linux/Ubuntu/gem-visualizer_dep.sh"
# set env variable
grep -qxF 'export ASEMANAGEPROGRAM' ~/.bashrc || {
  echo "ASEMANAGEPROGRAM=\"$WORKDIR\"" >> ~/.bashrc
  echo 'export ASEMANAGEPROGRAM' >> ~/.bashrc
  echo "ASEDIR=\"$FATHERFIR/ase_riscv_gem5_sim\"" >> ~/.bashrc
  echo 'export ASEDIR' >> ~/.bashrc
}
source ~/.bashrc

# launch script
./utils/installation.sh

# install libraries for python script
# view doc https://packaging.python.org/en/latest/tutorials/installing-packages/#
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install --upgrade pandas
python3 -m pip install --upgrade openpyxl

cd $WORKDIR
