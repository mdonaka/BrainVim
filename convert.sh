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

IFS=
read (){
  readarray data < $1
  echo "${data[*]}"
}

FILE=$1

PREPROCESS=`read BrainCommand/preprocess`
POSTPROCESS=`read BrainCommand/postprocess`
PLUS=`read BrainCommand/plus`
MINUS=`read BrainCommand/minus`
DOT=`read BrainCommand/dot`
LEFT_ANGLE=`read BrainCommand/left_angle`
RIGHT_ANGLE=`read BrainCommand/right_angle`
LEFT_SQUARE=`read BrainCommand/left_square`
RIGHT_SQUARE=`read BrainCommand/right_square`

DATA=`cat $FILE`
DATA=${DATA%.}
DATA=${DATA//+/$PLUS}
DATA=${DATA//+/hoge}
DATA=${DATA//-/$MINUS}
DATA=${DATA//./$DOT}
DATA=${DATA//</$LEFT_ANGLE}
DATA=${DATA//>/$RIGHT_ANGLE}
DATA=${DATA//[/$LEFT_SQUARE}
DATA=${DATA//]/$RIGHT_SQUARE}

echo $PREPROCESS > command.vim
echo $DATA >> command.vim
echo $POSTPROCESS >> command.vim
echo "convert success"
