int menuStage=0;
int speed=5;
int obstacles=0;
int players=2;
int gameMode=0;
boolean startUpGame=true;
int startUpTimer=0;
int dimensions=30;
int tiles[][]= new int[50][50];
int[] rand={0,0};
boolean[] alive={false,false,false,false};
boolean[] spawn={true,true,true,true};
int[] respawnTimer={0,0,0,0};
int[] scoreList={0,1,2,3};

// Will keep track of the coordinates of each segment of each snake, in order from head to tail
int snakeParts[][][] = new int[4][900][2];
// Length of each snake (an integer value)
int[] length={5,5,5,5};

// Direction each snake faces (Set to -1 at first to prevent movement)
//
//               0
//               |
//          3----X----1
//               |
//               2
//

int[] dir={-1,-1,-1,-1};
int[] newDir={-1,-1,-1,-1};

// Main ===============================================================================================================================

void setup(){
  maxFood=int(dimensions*(players+1)/20);
  size(1000,600);
  background(0);
}

void draw(){
  if (menuStage==0){
    if (frameCount<0){
      loadMenu(0);
    }
    else{
      loadMenu(1);
    }
  }
  if (menuStage==1){
    if (startUpGame || startUpTimer>0){
      startUpGame();
    }
    if(!startUpGame){
      if (startUpTimer==0){
        if(frameCount%(21-(2*speed))==0){
          update();
        }
      }
      drawSnake();
    }
  }
}