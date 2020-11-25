
__conda_setup="$('/homes/sx233/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/homes/sx233/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/homes/sx233/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/homes/sx233/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda activate test
# <<< conda initialize <<<

