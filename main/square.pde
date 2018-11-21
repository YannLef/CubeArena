class square {
  int size; // size of the square
  int x, y; // Coordinates of the square
  int sx, sy; // Speed of the square
  String name;

  void init(int team) {
    size=10; // initialize square's size ( in % of the window)
    size = (int) map(size, 1, 100, 1, width); // scale the size (% -> pixels)
    
    if(team==1){ // set start position for blue square (upper left corner)
      x=0;
      y=0;
    }
    
    if(team==2){ // set start position for red square ( lower right corner)
      x=width-size;
      y=height-size;
    }
    
    if(team==1){
      name="Blue Square";
    }
   
     if(team==2){
      name="Red Square";
    }

    sx=0; // initialize both speeds to 0 ( squares not movings at the beginning)
    sy=0;
  }

  void show(int team) {
    if(team==1) // team 1 = blue team
      fill(0,0,255);
    else fill(255,0,0); // team 1 = red team
    rect(x, y, size, size); // draw the rectangle
  }

  void move(int team, square sq1, square sq2) {
    // Basic move
    if (sx!=0) // check the speed on the x
      x=x+sx; // if there is the speed then the square should be moving
    if (sy!=0) // check the speed on the y
      y=y+sy; // if there is the speed then the square should be moving

    // Borders ( disabled here so cubes can go out of the window
   /**
    // Left
    if(x<0){
       x=0;
       sx=0;
    }
    
    // Right
    if(x+size>width){
       x=width-size;
       sx=0;
    }
    
    // Bottom
    if(y+size>height){
       y=height-size;
       sy=0;
    }
    
    // Top
    if(y<0){
       y=0;
       sy=0;
    }
    */
    
  }
  
  void eat(food fd, int team){
    if(x < fd.x && fd.x < x+size){ // if the food is between left and right edges of the square
      if(y < fd.y && fd.y < y+size){ // if the food is between upper and lower edges of the square
      // Then the square is on the center of the food and is able to eat it
        
        for(int i=0;i<10;i++){ // using a loop and not just "size=size+10" in order to check if there is a collision with the other cube while growing
          if(size<width){
            size++; // feed the cube which ate the food
            collision(sq1,sq2); // check the collision ( this way squares won't overlap
            }
        }
        
        fd.init(); // create a new food somewhere in the map according to init function of food object
      }
    }
  }
  
}
