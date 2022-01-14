void drawSnake(){
  clear();
  background(0);
  stroke(0);
  fill(200);
  rect(200,0,600,600);
  
  fill(0);
  stroke(255);
  rect(20,20,160,100);
  for (int i=0;i<players;i++){
    switch (scoreList[i]){
      case 0:
        fill (0,200,255);
        break;
      case 1:
        fill (255,255,0);
        break;
      case 2:
        fill (0,255,0);
        break;
      case 3:
        fill (255,160,0);
        break;
    }
    text("Player "+(scoreList[i]+1)+":",0,50+100*i,200,200);
    text(length[scoreList[i]]+" ",0,80+100*i,200,200);
  }
  stroke(0);
  
  for(int i=0;i<dimensions;i++){
    line(200+(600/float(dimensions))*i,0,200+(600/float(dimensions))*i,600);
    line(200,(600/float(dimensions))*i,800,(600/float(dimensions))*i);
  }

  for (int p=0;p<players;p++){
    switch (p){
        case 0:
          fill (0,200,255);
          break;
        case 1:
          fill (255,255,0);
          break;
        case 2:
          fill (0,255,0);
          break;
        case 3:
          fill (255,160,0);
          break;
        default:
          break;
      }
    
    for (int s=length[p]-1;s>=0;s--){
      if (snakeParts[p][s][0]!=-1){
        //if(frameCount%(21-(2*speed))>(21-(2*speed))-10){
        //  rect(200+(600/float(dimensions))*snakeParts[p][s][0]+((frameCount%(21-(2*speed)))-10)*float(dimensions)/10*(snakeParts[p][s-1][0]-snakeParts[p][s][0]),(600/float(dimensions))*snakeParts[p][s][1]+(frameCount%(21-(2*speed))-10)*float(dimensions)/10*(snakeParts[p][s-1][1]-snakeParts[p][s][1]),600/float(dimensions),600/float(dimensions));
        //}
        //else{
          rect(200+(600/float(dimensions))*snakeParts[p][s][0],(600/float(dimensions))*snakeParts[p][s][1],600/float(dimensions),600/float(dimensions));
        //}
      }
    }
  }

  for (int i=0;i<dimensions;i++){
    for (int j=0;j<dimensions;j++){
      /*
      if (tiles[i][j]>=1 && tiles[i][j]<=4){
        if (tiles[i][j]==1){
          fill (0,200,255);
        }
        if (tiles[i][j]==2){
          fill (255,255,0);
        }
        if (tiles[i][j]==3){
          fill (0,255,0);
        }
        if (tiles[i][j]==4){
          fill (255,160,0);
        }
        rect(200+(600/float(dimensions))*i,(600/float(dimensions))*j,600/float(dimensions),600/float(dimensions));
      }
      */
      if (tiles[i][j]==-1){
        fill (255,0,0);
        ellipse(200+(600/float(dimensions))*i+(600/float(dimensions))/2,(600/float(dimensions))*j+(600/float(dimensions))/2,0.8*600/float(dimensions),0.8*600/float(dimensions));
      }
      if (tiles[i][j]==100){
        fill (0);
        rect(200+(600/float(dimensions))*i,(600/float(dimensions))*j,600/float(dimensions),600/float(dimensions));
      }
    }
  }
  
  for (int p=0;p<players;p++){
    
    //Dead 
    
    if (!alive[p]){
      fill(200,0,0);
      rect(200+(600/float(dimensions))*snakeParts[p][0][0],(600/float(dimensions))*snakeParts[p][0][1],600/float(dimensions),600/float(dimensions));
    }  
    
    //Draw eyes
    
    fill(0);
    switch(newDir[p]){
      case -1:
        rect(200+(600/float(dimensions))*snakeParts[p][0][0]+3*600/(float(dimensions)*5),(600/float(dimensions))*snakeParts[p][0][1]+2*600/(float(dimensions)*5),600/(float(dimensions)*5),600/(float(dimensions)*5));
        rect(200+(600/float(dimensions))*snakeParts[p][0][0]+600/(float(dimensions)*5),(600/float(dimensions))*snakeParts[p][0][1]+2*600/(float(dimensions)*5),600/(float(dimensions)*5),600/(float(dimensions)*5));
        break;
      case 0:
        rect(200+(600/float(dimensions))*snakeParts[p][0][0]+3*600/(float(dimensions)*5),(600/float(dimensions))*snakeParts[p][0][1]+600/(float(dimensions)*5),600/(float(dimensions)*5),600/(float(dimensions)*5));
        rect(200+(600/float(dimensions))*snakeParts[p][0][0]+600/(float(dimensions)*5),(600/float(dimensions))*snakeParts[p][0][1]+600/(float(dimensions)*5),600/(float(dimensions)*5),600/(float(dimensions)*5));
        break;
      case 1:
        rect(200+(600/float(dimensions))*snakeParts[p][0][0]+3*600/(float(dimensions)*5),(600/float(dimensions))*snakeParts[p][0][1]+600/(float(dimensions)*5),600/(float(dimensions)*5),600/(float(dimensions)*5));
        rect(200+(600/float(dimensions))*snakeParts[p][0][0]+3*600/(float(dimensions)*5),(600/float(dimensions))*snakeParts[p][0][1]+3*600/(float(dimensions)*5),600/(float(dimensions)*5),600/(float(dimensions)*5));
        break;
      case 2:
        rect(200+(600/float(dimensions))*snakeParts[p][0][0]+3*600/(float(dimensions)*5),(600/float(dimensions))*snakeParts[p][0][1]+3*600/(float(dimensions)*5),600/(float(dimensions)*5),600/(float(dimensions)*5));
        rect(200+(600/float(dimensions))*snakeParts[p][0][0]+600/(float(dimensions)*5),(600/float(dimensions))*snakeParts[p][0][1]+3*600/(float(dimensions)*5),600/(float(dimensions)*5),600/(float(dimensions)*5));
        break;
      case 3:
        rect(200+(600/float(dimensions))*snakeParts[p][0][0]+600/(float(dimensions)*5),(600/float(dimensions))*snakeParts[p][0][1]+600/(float(dimensions)*5),600/(float(dimensions)*5),600/(float(dimensions)*5));
        rect(200+(600/float(dimensions))*snakeParts[p][0][0]+600/(float(dimensions)*5),(600/float(dimensions))*snakeParts[p][0][1]+3*600/(float(dimensions)*5),600/(float(dimensions)*5),600/(float(dimensions)*5));
        break;
    }
  }
  if (startUpTimer>0){
    if (startUpTimer>120){
      fill(255,0,0);
      text("Ready?",400,200,200,200);
    }
    else if (startUpTimer>60){
      fill(255,0,0);
      text("Set...",400,200,200,200);
    }
    else{
      fill(255,0,0);
      text("Go!",400,200,200,200);
    }
  }
}