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

MACRO_PRE=`read brain_command/macros/preprocess`
MACRO_E=`read brain_command/macros/e`
MACRO_A=`read brain_command/macros/a`
MACRO_X=`read brain_command/macros/x`
MACRO_S=`read brain_command/macros/s`
MACRO_L=`read brain_command/macros/l`
MACRO_C=`read brain_command/macros/c`
MACRO_Z=`read brain_command/macros/z`
MACRO_R=`read brain_command/macros/r`
MACRO_D=`read brain_command/macros/d`
MACRO_F=`read brain_command/macros/f`
MACRO_T=`read brain_command/macros/t`
MACRO_G=`read brain_command/macros/g`
MACRO_H=`read brain_command/macros/h`
MACRO_M=`read brain_command/macros/m`
MACRO_B=`read brain_command/macros/b`
MACRO_V=`read brain_command/macros/v`
MACRO_P=`read brain_command/macros/p`
MACRO_Q=`read brain_command/macros/q`

PREPROCESS=`read brain_command/preprocess`
POSTPROCESS=`read brain_command/postprocess`
PLUS=`read brain_command/plus`
MINUS=`read brain_command/minus`
DOT=`read brain_command/dot`
LEFT_ANGLE=`read brain_command/left_angle`
RIGHT_ANGLE=`read brain_command/right_angle`
LEFT_SQUARE=`read brain_command/left_square`
RIGHT_SQUARE=`read brain_command/right_square`

DATA=`cat $FILE`
DATA=${DATA//+/$PLUS}
DATA=${DATA//+/hoge}
DATA=${DATA//-/$MINUS}
DATA=${DATA//./$DOT}
DATA=${DATA//</$LEFT_ANGLE}
DATA=${DATA//>/$RIGHT_ANGLE}
DATA=${DATA//[/$LEFT_SQUARE}
DATA=${DATA//]/$RIGHT_SQUARE}

echo $MACRO_PRE$MACRO_A$MACRO_E$MACRO_X$MACRO_S$MACRO_C$MACRO_Z$MACRO_L$MACRO_R$MACRO_D$MACRO_F$MACRO_T$MACRO_G$MACRO_H$MACRO_M$MACRO_V$MACRO_B$MACRO_P$MACRO_Q > command.vim
echo $PREPROCESS >> command.vim
echo $DATA >> command.vim
echo $POSTPROCESS >> command.vim
echo "convert success"
