function usage {
    cat <<EOF
$(basename ${0})
Usage:
    $(basename ${0}) [brainfuck file]
EOF
}
if [ $# != 1 ]; then
    echo "Argument not found error."
    usage
    exit 1
fi

# barinfuckをvimコマンドに変換
FILE=$1
./convert.sh $FILE

# Vimコマンドを実行
cat in > out
vi -N -u NONE -i NONE -s command.vim out
cat out
