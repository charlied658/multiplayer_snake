int[][] food= new int[900][2];
int pointer=0;
int maxFood=5;

void spawnFood(){
  int storeNumFood=numFood();
  do{
    rand[0]=int(random(dimensions));
    rand[1]=int(random(dimensions));
  }while(tiles[rand[0]][rand[1]]!=0);
  food[storeNumFood][0]=rand[0];
  food[storeNumFood][1]=rand[1];
  tiles[rand[0]][rand[1]]=-1;
}

void spawnFoodTest(int x,int y){
  int storeNumFood=numFood();
  food[storeNumFood][0]=x;
  food[storeNumFood][1]=y;
  tiles[x][y]=-1;
}

void checkFood(int p){
  int pointer=0;
  while (pointer<numFood()){
    if (food[pointer][0]==snakeParts[p][0][0] && food[pointer][1]==snakeParts[p][0][1]){
      //println("looks good!");
      
      length[p]+=5;
      while (pointer<numFood()){
        food[pointer][0]=food[pointer+1][0];
        food[pointer][1]=food[pointer+1][1];
        pointer++;
      }
      spawnFood();
      
      break;
    }
    pointer++;
  }
}

int numFood(){
  pointer=0;
  while(food[pointer][0]!=-1 && pointer<899){
    pointer++;
  }
  return pointer;
}

boolean aboutToCollide(int p){
  switch(newDir[p]){
    case 0:
      if (snakeParts[p][0][1]==0 || tiles[snakeParts[p][0][0]][snakeParts[p][0][1]-1]>0){
        return true;
      }
      else{
        return false;
      }
    case 1:
      if (snakeParts[p][0][0]==dimensions-1 || tiles[snakeParts[p][0][0]+1][snakeParts[p][0][1]]>0){
        return true;
      }
      else{
        return false;
      }
    case 2:
      if (snakeParts[p][0][1]==dimensions-1 || tiles[snakeParts[p][0][0]][snakeParts[p][0][1]+1]>0){
        return true;
      }
      else{
        return false;
      }
    case 3:
      if (snakeParts[p][0][0]==0 || tiles[snakeParts[p][0][0]-1][snakeParts[p][0][1]]>0){
        return true;
      }
      else{
        return false;
      }
    default:
      return false;
  }
}