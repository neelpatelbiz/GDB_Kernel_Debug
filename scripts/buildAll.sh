source settings.sh
echo "compiling kernel using cpus ..."
export cpus=$1
./retrieve_compile_kernel.sh
./copy_scripts.sh
