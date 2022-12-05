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

DATA=`cat main2.bf`
DATA=${DATA%.}
DATA=${DATA//+/$PLUS}
DATA=${DATA//+/hoge}
DATA=${DATA//-/$MINUS}
DATA=${DATA//./$DOT}
DATA=${DATA//</$LEFT_ANGLE}
DATA=${DATA//>/$RIGHT_ANGLE}

echo $PREPROCESS > main.vim
echo $DATA >> main.vim
echo $POSTPROCESS >> main.vim
echo "convert success"
