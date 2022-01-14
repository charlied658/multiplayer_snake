// Key functions ================================================================================================

void keyPressed(){
  if (!startUpGame && startUpTimer==0){
    switch(keyCode){
    case 38:
      if(dir[0]!=2 && alive[0]){
        newDir[0]=0;
      }
      break;
    case 39:
    if(dir[0]!=3 && alive[0]){
        newDir[0]=1;
      }
      break;
    case 40:
    if(dir[0]!=0 && alive[0]){
        newDir[0]=2;
      }
      break;
    case 37:
    if(dir[0]!=1 && alive[0]){
        newDir[0]=3;
      }
      break;
    case 87:
      if(dir[1]!=2 && alive[1]){
        newDir[1]=0;
      }
      break;
    case 68:
    if(dir[1]!=3 && alive[1]){
        newDir[1]=1;
      }
      break;
    case 83:
    if(dir[1]!=0 && alive[1]){
        newDir[1]=2;
      }
      break;
    case 65:
    if(dir[1]!=1 && alive[1]){
        newDir[1]=3;
      }
      break;
    case 73:
      if(dir[2]!=2 && alive[2]){
        newDir[2]=0;
      }
      break;
    case 76:
      if(dir[2]!=3 && alive[2]){
        newDir[2]=1;
      }
      break;
    case 75:
      if(dir[2]!=0 && alive[2]){
        newDir[2]=2;
      }
      break;
    case 74:
      if(dir[2]!=1 && alive[2]){
        newDir[2]=3;
      }
      break;
    case 84:
      if(dir[3]!=2 && alive[3]){
        newDir[3]=0;
      }
      break;
    case 72:
      if(dir[3]!=3 && alive[3]){
        newDir[3]=1;
      }
      break;
    case 71:
      if(dir[3]!=0 && alive[3]){
        newDir[3]=2;
      }
      break;
    case 70:
      if(dir[3]!=1 && alive[3]){
        newDir[3]=3;
      }
      break;
    default:
      break;
    }
  }
}

// Mouse functions ================================================================================================


boolean mouseDown=false;
boolean justClicked=false;



void mousePressed(){
  mouseDown=true;
  justClicked=false;
}

void mouseReleased(){
  mouseDown=false;
  justClicked=false;
}