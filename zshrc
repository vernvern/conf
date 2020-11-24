
ZSH_THEME="bira"

# set bell-style none
unsetopt BEEP

# 魔法阵
# imgcat ~/.zshtop.png

# 水族馆
# asciiquarium

# 黑客帝国
# cmatrix


function cdls(){
    cd $*
    num=$(ls | wc -w)
    if [ $num -lt 500 ]; then ls; fi
}
alias cd=cdls


