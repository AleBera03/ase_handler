# Architetture dei sistemi di elaborazione | PoliTo: 	`ase_handler` wrapper of [`ase_riscv_gem5_sim`](https://github.com/cad-polito-it/ase_riscv_gem5_sim)
This wrapper includes several commands that enhance the experience of using [`ase_riscv_gem5_sim`](https://github.com/cad-polito-it/ase_riscv_gem5_sim). Here the using overall flow:
1. Use 	`https`
```
git clone https://github.com/AleBera03/ase_handler
```
2. Check permission of rep with
```
ls -la "../path/of/rep"
```
3. Give permission recursively if there are not perms
```
sudo chmod -R +x "path/of/rep"
```
4. Execute `script.sh`
```
cd "path/of/rep"
./script.sh
```
5. The above script install [`ase_riscv_gem5_sim`](https://github.com/cad-polito-it/ase_riscv_gem5_sim) rep in `'path/of/rep/ase_riscv_gem5_sim'` directory

**NB:** The project is only tested for Ubuntu-22.04 distro (same version of VM proposed during the course)

## Why ?
The *goal* of this project is to avoid manual and repetitive cli operations throught folders. Hence, I implemented three very simple command capable to *handle* the source code even outside
the ufficial project folder.

## How ?
The `script.sh` properly export the env variable, so you can run commands wherever
- `ase_add`: create the proper folder within ufficial project respecting `Makefile` format and creating an hard link inside [^1]
- `ase_rem`: fistly list the remaining programs in the ufficial project. Then, it is possible to choose one of them to delete
- `ase_sim`: start the simulation launching `simulate.sh` (`-h | --help` for more details). It is possible to modify the latencies. Finally, in order to speed the workflow, the option `-a | --add <file>` automatically add the program in the proper folder

**Tip:** a combination of `ase_sim` and `ase_rem` should be sufficent

**NB:** the simulation run in interactive mode every time (read [here](https://github.com/cad-polito-it/ase_riscv_gem5_sim?tab=readme-ov-file#howto---simulate-a-program))




[^1]: the role of hard link is to sync changes from original file towards the one within ufficial project