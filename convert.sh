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

DATA=`cat main.bf`
DATA=${DATA%.}
DATA=${DATA//+/$PLUS}
DATA=${DATA//-/$MINUS}
DATA=${DATA//./$DOT}

echo $PREPROCESS > main
echo $DATA >> main
echo $POSTPROCESS >> main
echo "convert success"
