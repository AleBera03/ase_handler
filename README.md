# Architetture dei sistemi di elaborazione | PoliTo: 	`ase_handler` wrapper of [`ase_riscv_gem5_sim`](https://github.com/cad-polito-it/ase_riscv_gem5_sim)
This wrapper includes several commands that enhance the experience of using [`ase_riscv_gem5_sim`](https://github.com/cad-polito-it/ase_riscv_gem5_sim). Here the using overall flow:
1. Use 	`https`
```
git clone https://github.com/AleBera03/ase_handler
```
2. Check permission of rep with
```
ls -la "../path/to/ase_handler"
```
3. Give permission recursively if there are not perms
```
sudo chmod -R +x "path/to/ase_handler"
```
4. Execute `script.sh`
```
cd "path/to/ase_handler"
./script.sh
```
5. The above script install [`ase_riscv_gem5_sim`](https://github.com/cad-polito-it/ase_riscv_gem5_sim) rep in this way
```
father_dir
    |-- ase_handler
    |-- ase_riscv_gem5_sim
    |-- other ...
```

**NB:** The project is only tested for Ubuntu-22.04 distro (same version of VM proposed during the course)

## Why ?
The *goal* of this project is to avoid manual and repetitive cli operations throught folders. Hence, I implemented three very simple command capable to *handle* the source code even outside
the ufficial project folder.

## How ?
The `script.sh` properly export the env variable, so you can run commands wherever

**Tip:** a combination of `ase_sim` and `ase_rem` should be sufficent

**NB:** the simulation run in interactive mode every time (read [here](https://github.com/cad-polito-it/ase_riscv_gem5_sim?tab=readme-ov-file#howto---simulate-a-program))

# `ase_add`
Create the proper folder within ufficial project respecting `Makefile` format and creating an hard link inside [^1]
Type everywhere
```
ase_add <ex.s>
```
to produce this
```
ase_riscv_gem5_sim
    |-- programs
        |-- ex
            |-- Makefile    # ASM = ./ex.s
            |-- linked.ld
            |-- ex.s
        |-- other_programs ...
    |-- other ...
```

# `ase_rem`
Fistly list the remaining programs in the ufficial project. Then, it is possible to choose one of them to delete

# `ase_sim`
Start the simulation launching `simulate.sh` (`-h | --help` for more details). It is possible to modify the latencies. Finally, in order to speed the workflow, the option `-a | --add <file>` automatically add the program in the proper folder if there is not yet. \
**ONLY FOR WSL2 USERS:** with the option `-t | --table` it is possible to generate a excel file creating a link
```
C:\Users\<user>\Documents\ex.xlsx <<--->> ase_riscv_gem5_sim/programs/ex/ex.xlsx
```




[^1]: the role of hard link is to sync changes from original file towards the one within ufficial project