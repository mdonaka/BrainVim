IFS=
read (){
  readarray data < $1
  echo "${data[*]}"
}

PREPROCESS=`read BrainCommand/preprocess`
POSTPROCESS=`read BrainCommand/postprocess`
PLUS=`read BrainCommand/plus`
MINUS=`read BrainCommand/minus`
DOT=`read BrainCommand/dot`
LEFT_ANGLE=`read BrainCommand/left_angle`
RIGHT_ANGLE=`read BrainCommand/right_angle`
LEFT_SQUARE=`read BrainCommand/left_square`
RIGHT_SQUARE=`read BrainCommand/right_square`

DATA=`cat main.bf`
DATA=${DATA%.}
DATA=${DATA//+/$PLUS}
DATA=${DATA//+/hoge}
DATA=${DATA//-/$MINUS}
DATA=${DATA//./$DOT}
DATA=${DATA//</$LEFT_ANGLE}
DATA=${DATA//>/$RIGHT_ANGLE}
DATA=${DATA//[/$LEFT_SQUARE}
DATA=${DATA//]/$RIGHT_SQUARE}

echo $PREPROCESS > main.vim
echo $DATA >> main.vim
echo $POSTPROCESS >> main.vim
echo "convert success"
