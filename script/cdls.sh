
function cdls(){
    cd $*
    num=$(ls | wc -w)
    if [ $num -lt 500 ]; then ls; fi
}
alias cd=cdls

