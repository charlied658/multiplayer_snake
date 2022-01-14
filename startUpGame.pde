void startUpGame(){
  
  
  if (startUpGame){
    if (obstacles > 0){
      for (int i=0;i<dimensions;i++){
        for (int j=0;j<dimensions;j++){
          if (int(random(12-obstacles))==1){
            tiles[i][j]=100;
          }
        }
      }
    }
    
    /*
    for (int i=0;i<dimensions;i++){
      for (int j=0;j<dimensions;j++){
        if (i>4 && i<25 && j>4 && j<25 && i!=13 && i!=16){
          tiles[i][j]=100;
        }
      }
    }
    */
    
    for(int i=0;i<900;i++){
      food[i][0]=-1;
      food[i][1]=-1;
    }
    
    for (int i=0;i<maxFood;i++){
      spawnFood();
    }
    
    // (0,0) is a valid coordinate, so all nonexistant snake parts are labeled (-1,-1)
    
    for (int p=0;p<players;p++){
      for(int i=0;i<900;i++){
        snakeParts[p][i][0]=-1;
        snakeParts[p][i][1]=-1;
      }
      alive[p]=true;
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
        tiles[snakeParts[p][0][0]][snakeParts[p][0][1]]=p+1;
        length[p]=5;
        //println("Player "+(p+1)+": "+snakeParts[p][0][0]+","+snakeParts[p][0][1]);
        alive[p]=true;
        spawn[p]=false;
        newDir[p]=-1;
      }  
    }
    
    startUpTimer=180;
    startUpGame=!startUpGame;
  }
  else{
    startUpTimer-=1;
    println(startUpTimer);
  }
}
