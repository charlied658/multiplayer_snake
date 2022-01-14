void update(){
  
  //Sort scores
  
  int sortCount=0;
  int tempVar=0;
  
  while(true){
    sortCount=0;
    for (int i=0;i<3;i++){
      if (length[scoreList[i+1]]>length[scoreList[i]]){
        tempVar=scoreList[i+1];
        scoreList[i+1]=scoreList[i];
        scoreList[i]=tempVar;
        sortCount++;
      }
    }
    if (sortCount==0){
      break;
    }
  }
  
  for (int p=0;p<players;p++){
  
    if (!alive[p]){
      if (respawnTimer[p]>0){
        respawnTimer[p]--;
      }
      if (respawnTimer[p]==0){
        spawn[p]=true;
      }
    }
    
    //Spawn player
    if(spawn[p]){
      
      //Delete old parts
      for (int i =0;i<length[p];i++){
        if (snakeParts[p][i][0]!=-1){
          tiles[snakeParts[p][i][0]][snakeParts[p][i][1]]=0;
          snakeParts[p][i][0]=snakeParts[p][i][0]=-1;
        }
      }
      
      do{
        rand[0]=int(random(dimensions));
        rand[1]=int(random(dimensions));
      }while(tiles[rand[0]][rand[1]]!=0);
      
      snakeParts[p][0][0]=rand[0];
      snakeParts[p][0][1]=rand[1];
      length[p]=5;
      //println("Player "+(p+1)+": "+snakeParts[p][0][0]+","+snakeParts[p][0][1]);
      alive[p]=true;
      spawn[p]=false;
      newDir[p]=-1;
    }
    
    checkFood(p);
    
    if (!aboutToCollide(p) && alive[p]){
      
      
      //println("Food[0]: "+food[0][0]+","+food[0][1]);
      
      
      //Delete old parts on the tile[] grid
      
      if (snakeParts[p][length[p]-1][0]!=-1){
        tiles[snakeParts[p][length[p]-1][0]][snakeParts[p][length[p]-1][1]]=0;
      }
      
      // Shift body parts
      
      for (int i=length[p]-1;i>0;i--){
        snakeParts[p][i][0]=snakeParts[p][i-1][0];
        snakeParts[p][i][1]=snakeParts[p][i-1][1];
      }
      
      
      // Move head forward -----------------------------------------------------------------------------
      
      dir[p]=newDir[p];
      switch(dir[p]){
        case 0:
          snakeParts[p][0][1]--;
          break;
        case 1:
          snakeParts[p][0][0]++;
          break;
        case 2:
          snakeParts[p][0][1]++;
          break;
        case 3:
          snakeParts[p][0][0]--;
          break;
        default:
          break;
      }   
     
      
      //Update tiles
      for (int i=0;i<length[p];i++){
        if (snakeParts[p][i][0]!=-1){
          tiles[snakeParts[p][i][0]][snakeParts[p][i][1]]=p+1;
        }
      }
    }
    else if(aboutToCollide(p) && alive[p]){
      alive[p]=false;
      respawnTimer[p]=20;
    }
  }
}