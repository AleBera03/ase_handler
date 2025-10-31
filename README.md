# Architetture dei sistemi di elaborazione | PoliTo: 	`ase_handler` wrapper of [`ase_riscv_gem5_sim`](https://github.com/cad-polito-it/ase_riscv_gem5_sim)
This wrapper includes several commands that enhance the experience of using [`ase_riscv_gem5_sim`](https://github.com/cad-polito-it/ase_riscv_gem5_sim). Here the using overall flow:
1. Use 	`https`
```
  git clone https://github.com/AleBera03/ase_handler
```
2. Give permission recursively in order to properly execute all script within repository
```
  sudo chmod -r +x "path/of/rep"
```
3. Execute `script.sh`
```
  cd "path/of/rep"
  ./script.sh
```

**NB:** The project is only tested for Ubuntu-22.04 distro (as far as VM proposed during the course)
