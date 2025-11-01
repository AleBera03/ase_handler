#!/bin/bash

WORKDIR="$(pwd)"
echo $WORKDIR

echo 'export PATH="$WORKDIR:$PATH"' >> ~/.bashrc

git clone https://github.com/cad-polito-it/ase_riscv_gem5_sim.git
sudo chmod -R +x ase_riscv_gem5_sim
cd ase_riscv_gem5_sim
# modify gem_visualizer-dep.sh
cp "../base_files/gem-visualizer_dep.sh" "utils/Linux/Ubuntu/gem-visualizer_dep.sh"
# set env variable
echo "ASEMANAGEPROGRAM=\"$WORKDIR\"" >> ~/.bashrc
echo 'export = ASEMANAGEPROGRAM' >> ~/.bashrc
echo "ASEDIR=\"$WORKDIR/ase_riscv_gem5_sim\"" >> ~/.bashrc
echo 'export = ASEDIR' >> ~/.bashrc

source ~/.bashrc

cd utils
./installation.sh

cd $WORKDIR