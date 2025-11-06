#!/bin/bash

install_ase_riscv_gem5_sim(){
  # substitute correct gem_visualizer-dep.sh
  cp -v "../ase_handler/base_files/gem-visualizer_dep.sh" "utils/Linux/Ubuntu/gem-visualizer_dep.sh"
  # launch script
  ./utils/installation.sh
}

install_konata(){
  # install node.js
  sudo apt-get install curl
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  \. "$HOME/.nvm/nvm.sh"
  nvm install 24
  node -v # Should print "v24.11.0".
  npm -v # Should print "11.6.1".
  # clone Konata
  cd "$WORKDIR/.."
  git clone "https://github.com/shioyadan/Konata"
  sudo chmod -R +x Konata
  cd Konata
  ./install.sh
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
if git -C "../Konata" rev-parse --is-inside-work-tree &>/dev/null; then
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
grep -qxF "export PATH=\"$FATHERDIR/Konata:\$PATH\"" ~/.bashrc || {
    echo "export PATH=\"$FATHERDIR/../Konata:\$PATH\"" >> ~/.bashrc
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
