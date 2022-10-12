#!/bin/bash

toolchain_file=riscv64-unknown-elf-toolchain-10.2.0-2020.12.8-x86_64-linux-ubuntu14

cd /tmp

# download toolchain
curl -OL https://static.dev.sifive.com/dev-tools/freedom-tools/v2020.12/$toolchain_file.tar.gz && \
    tar -xzf $toolchain_file.tar.gz && \
    mv $toolchain_file ~/riscv64-unknown-elf

riscv64_line_count=$(grep riscv64-unknown-elf $HOME/.bashrc | wc -l)

if [[ $riscv64_line_count != "0" ]]; then
    echo "RISC-V 64 bit toolchain is already installed";

    exit 0
fi

echo "" >> $HOME/.bashrc
echo "# RISC-V 64 bit toolchain installation" >> $HOME/.bashrc
echo "export PATH=\$HOME/riscv64-unknown-elf/bin:\$PATH" >> $HOME/.bashrc

rm -rf $toolchain_file.tar.gz