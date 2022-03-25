export ROOT_DIR=
export BUILD_DIR=${ROOT_DIR}/Builds
export SCRIPT_DIR=${ROOT_DIR}/scripts
export Qemu_x86=$(which qemu-system-x86_64)
export cpus=$(( $(nproc) / 2 ))
export mem="2048"
export Linux_Version="linux-5.15.31"
