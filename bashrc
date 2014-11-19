# .bashrc
export EDITOR="vim"
# History settings
export HISTIGNORE="clear:history*"
export HISTCONTROL=ignoreboth

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# User specific aliases and functions

export BLAS=$HOME/local/BLAS/libfblas.a
export LAPACK=$HOME/local/lapack-3.5.0
export openjp2=$HOME/local/usr/local/lib

export PATH=$PATH:$HOME/local/cmake-2.8.12.2/bin
export PATH=$PATH:/usr/local/texlive/2013/bin/x86_64-linux
export PATH=$PATH:$HOME/local/libtool-2.4.2/bin

export PATH=$HOME/local/visit2_7_0.linux-x86_64/bin:$PATH
export PATH=$HOME/anaconda/bin:$PATH
export PATH=$HOME/local/mpich2-install/bin/:$PATH
export PATH=$HOME/hdf5/hdf-java-2.10/usr/bin:$PATH
export PATH=$HOME/local/fftw-3.3.4/bin:$PATH
export PATH=$HOME/local/valgrind/bin:$PATH
export PATH=$HOME/local/asciidoc-8.6.9/bin:$PATH
export PATH=$HOME/local/xmlto-0.0.26/bin:$PATH
export PATH=$HOME/local/git-1.9.2/bin:$PATH
export PATH=$HOME/local/curl/bin:$PATH
export PATH=$HOME/local/yasm-1.2.0/bin:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export LD_LIBRARY_PATH=$HOME/hdf5/lib/:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/libtool-2.4.2/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/H5hut-1.99.13/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/fftw-3.3.4/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/curl/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/openssl/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$HOME/local/usr/local/lib:$LD_LIBRARY_PATH

export DISLIN=$HOME/local/dislin-10.4/
export PATH=$DISLIN/bin:$PATH
export LD_LIBRARY_PATH=$DISLIN:$LD_LIBRARY_PATH

export OMP_NUM_THREADS=3

# PETsc
export PETSC_DIR=$HOME/local/petsc-3.5.2/
export PETSC_ARCH=arch-linux2-c-debug

# TeX
export TEXMFHOME=$HOME/.texmf:$TEXMHOME

# Powerline settings
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. $HOME/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
