
sed "s/ROOT_DIR=/ROOT_DIR=$(pwd)/" scripts/*
[[ ! -d "./Builds" ]] && mkdir Builds
