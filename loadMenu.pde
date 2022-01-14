boolean locked[]={false,false,false,false};
boolean hover[]={false,false,false,false};
int sliderwidth=400;

void loadMenu(int stage){
  if (stage==0){
    clear();
    background(0);
    fill(255);
    textAlign(CENTER);
    text("<Initializing shitty menu sequence>",400,300,200,100);
  }
  
  if (stage==1){
    // Setup & Draw Lines ===================================================================================
    clear();
    background(0);
    stroke(255);
    fill(255);
    line(50,100,50+sliderwidth,100);
    line(50,250,50+sliderwidth,250);
    for (int i=0;i<=10;i++){
      textSize(10);
      line(50+((sliderwidth/10)*i),90,50+((sliderwidth/10)*i),110);
      line(50+((sliderwidth/10)*i),240,50+((sliderwidth/10)*i),260);
      text(Integer.toString(i),50+((sliderwidth/10)*i),130);
      text(Integer.toString(i),50+((sliderwidth/10)*i),280);
    }
    
    line(50,400,320,400);
    for (int i=0;i<=3;i++){
      textSize(10);
      line(50+(90*i),390,50+(90*i),410);
      text(Integer.toString(i+1),50+(90*i),430);
    }
    
    textAlign(CENTER);
    textSize(20);
    text("Speed",50,50,50+sliderwidth,50);
    text("Obstacles",50,200,50+sliderwidth,200);
    text("Players",50,350,320,350);
    
    rect(45+(sliderwidth/10)*speed,90,10,20);
    rect(45+(sliderwidth/10)*obstacles,240,10,20);
    rect(45+90*(players-1),390,10,20);
    
    // Debug ========================================================================================================
    /*
    if (mouseDown){
      fill(0,255,0);
      rect(5,5,30,30);
    }
    else{
      fill(255);
    }
    */
    
    // Buttons ====================================================================================================
    
    // Sliders - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    if(mouseDown && mouseX>50 && mouseX<50+sliderwidth && mouseY>50 && mouseY<150){
      if((mouseX-50)%(sliderwidth/10)<=(sliderwidth/10)/2){
        speed=Math.round((mouseX-50)/(sliderwidth/10));
      }
      else{
        speed=Math.round((mouseX-50)/(sliderwidth/10))+1;
      }
    }
    if(mouseDown && mouseX>50 && mouseX<50+sliderwidth && mouseY>200 && mouseY<300){
      if((mouseX-50)%(sliderwidth/10)<=(sliderwidth/10)/2){
        obstacles=Math.round((mouseX-50)/(sliderwidth/10));
      }
      else{
        obstacles=Math.round((mouseX-50)/(sliderwidth/10))+1;
      }
    }
    
    if(mouseDown && mouseX>50 && mouseX<320 && mouseY>350 && mouseY<450){
      if((mouseX-50)%90<=45){
        players=Math.round((mouseX-50)/90)+1;
      }
      else{
        players=Math.round((mouseX-50)/90)+2;
      }
    }
    
    // Game Mode Toggle - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
    //Gamemode | Value
    // 0       |  FFA
    // 1       |  Deathmatch
    // 2       |  First to c
    
    fill(0);
    stroke(255);
    
    
    
    if(mouseX>500 && mouseX<900 && mouseY>350 && mouseY<400){
      if(!mouseDown){
        hover[1]=true; 
      }
      fill(100);
      if (mouseDown && hover[1]){
        locked[1]=true;
        hover[1]=false;
      }
      if (!mouseDown && locked[1]){
        ;
        locked[1]=false;
        gameMode=0;
      }
      if (locked[1]){
        fill(50);
      }
    }
    else{
      fill(0);
      hover[1]=false;
      if (!mouseDown){
        locked[1]=false;
      }
    }  
    rect(500,350,400,50);
    if (gameMode==0){
      fill (255);  
    }
    rect(515,365,20,20);
    
    
    if(mouseX>500 && mouseX<900 && mouseY>420 && mouseY<470){
      if(!mouseDown){
        hover[2]=true; 
      }
      fill(100);
      if (mouseDown && hover[2]){
        locked[2]=true;
        hover[2]=false;
      }
      if (!mouseDown && locked[2]){
        ;
        locked[2]=false;
        gameMode=1;
      }
      if (locked[2]){
        fill(50);
      }
    }
    else{
      fill(0);
      hover[2]=false;
      if (!mouseDown){
        locked[2]=false;
      }
    }  
    rect(500,420,400,50);
    if (gameMode==1){
      fill (255);  
    }
    rect(515,435,20,20);
    
    
    if(mouseX>500 && mouseX<900 && mouseY>490 && mouseY<540){
      if(!mouseDown){
        hover[3]=true; 
      }
      fill(100);
      if (mouseDown && hover[3]){
        locked[3]=true;
        hover[3]=false;
      }
      if (!mouseDown && locked[3]){
        ;
        locked[3]=false;
        gameMode=2;
      }
      if (locked[3]){
        fill(50);
      }
    }
    else{
      fill(0);
      hover[3]=false;
      if (!mouseDown){
        locked[3]=false;
      }
    }  
    rect(500,490,400,50);
    if (gameMode==2){
      fill (255);  
    }
    rect(515,505,20,20);
    
    
    fill(255);
    
    text("Free For All",520,360,400,50);
    text("Deathmatch",520,430,400,50);
    text("First to 100",520,500,400,50);
    
    text("Game Mode",520,300,400,50);
    
    // Start Button - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
    if(mouseX>50 && mouseX<200 && mouseY>500 && mouseY<550){
      if(!mouseDown){
        hover[0]=true; 
      }
      fill(100);
      if (mouseDown && hover[0]){
        locked[0]=true;
        hover[0]=false;
      }
      if (!mouseDown && locked[0]){
        locked[0]=false;
        menuStage=1;
        startUpGame=true;
      }
      if (locked[0]){
        fill(50);
      }
    }
    else{
      fill(0);
      hover[0]=false;
      if (!mouseDown){
        locked[0]=false;
      }
    }  
    rect(50,500,150,50);
    
    fill(255);
    
    text("Start",50,510,150,50);
   
    /*
    text("locked={"+locked[0]+","+locked[1]+","+locked[2]+","+locked[3]+"}",5,5,500,50);
    text("hover={"+hover[0]+","+hover[1]+","+hover[2]+","+hover[3]+"}",5,25,500,50);
    */
  }
}