#!/bin/bash

install_ase_riscv_gem5_sim(){
  # substitute correct gem_visualizer-dep.sh
  cp -v "../ase_handler/base_files/gem-visualizer_dep.sh" "utils/Linux/Ubuntu/gem-visualizer_dep.sh"
  # launch script
  ./utils/installation.sh
}

install_konata(){
  cd ..
  wget https://github.com/shioyadan/Konata/releases/download/v0.39/konata-linux-x64.tar.gz
  tar -xvzf konata-linux-x64.tar.gz
  rm README.md LICENSE.md THIRD-PARTY-LICENSES.md
  cd $WORKDIR
}

WORKDIR="$(pwd)"
echo $WORKDIR

# if ufficial project is already installed "near" ase_handler
flaga=0
if git -C "../ase_riscv_gem5_sim" rev-parse --is-inside-work-tree &>/dev/null; then
  flaga=1
fi

# if konata is already installed "near" ase_handler
flagk=0
if [[ -d "../konata-linux-x64" ]]; then
  flagk=1
fi

grep -qxF "export PATH=\"$WORKDIR:\$PATH\"" ~/.bashrc || {
  echo "export PATH=\"$WORKDIR:\$PATH\"" >> ~/.bashrc
}

cd ..
FATHERDIR="$(pwd)"
if [[ $flaga -eq 0 ]]; then
  git clone https://github.com/cad-polito-it/ase_riscv_gem5_sim.git
  sudo chmod -R +x ase_riscv_gem5_sim
  cd ase_riscv_gem5_sim
fi
# set env variable
grep -qxF 'export ASEMANAGEPROGRAM' ~/.bashrc || {
  echo "ASEMANAGEPROGRAM=\"$WORKDIR\"" >> ~/.bashrc
  echo 'export ASEMANAGEPROGRAM' >> ~/.bashrc
  echo "ASEDIR=\"$FATHERDIR/ase_riscv_gem5_sim\"" >> ~/.bashrc
  echo 'export ASEDIR' >> ~/.bashrc
}
grep -qxF "export PATH=\"$FATHERDIR/konata-linux-x64:\$PATH\"" ~/.bashrc || {
    echo "KONATADIR=\"$FATHERDIR/konata-linux-x64\"" >> ~/.bashrc
    echo "export KONATADIR" >> ~/.bashrc
    echo "export PATH=\"$FATHERDIR/konata-linux-x64:\$PATH\"" >> ~/.bashrc
}
source ~/.bashrc

if [[ $flaga -eq 0 ]]; then
  install_ase_riscv_gem5_sim
fi

if [[ $flagk -eq 0 ]]; then
  install_konata
fi

# install libraries for python script
# view doc https://packaging.python.org/en/latest/tutorials/installing-packages/#
python3 -m pip install --upgrade pip setuptools wheel
python3 -m pip install --upgrade pandas
python3 -m pip install --upgrade openpyxl

cd $WORKDIR
