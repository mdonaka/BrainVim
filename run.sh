function usage {
    cat <<EOF
$(basename ${0})
Usage:
    $(basename ${0}) [-c] <brainfuck file>

Options:
    -c       Compile mode
    -n       Not convert mode
EOF
}

if [ $# = 0 ]; then
    echo "Argument not found error."
    usage
    exit 1
fi

FILE=${@:$#:1}
cat $FILE > tmp
CONVERT=true

while getopts cn OPT; do
    case $OPT in
    c)
        cd transpile
        cargo run ../${FILE} ../in > ../tmp || exit 1
        cd ../
        ;;
    n)
      CONVERT=false
        ;;
    \?)
        usage && exit 1
        ;;
    esac
done

# barinfuckをvimコマンドに変換
if "${CONVERT}"; then
    ./convert.sh tmp
fi
# rm tmp

# Vimコマンドを実行
cat in > out
vi -N -u NONE -i NONE -s command.vim out
cat out
