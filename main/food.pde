class food{
  int size; // size of food
  int x,y; // Coordinates of food
  int r,g,b; // Color of food
  
  void init(){
    // set random size ( and cast it between 7 pixels and 1/15 of the window's width)
    size = round(random(1,100)); // set the size of the food in %
    size = (int)map(size,1,100,7,width/15); // scale the size ( % -> pixels)
    
    // set random coordinates
    x = round(random(1,100));
    x = (int)map(x,1,100,50,width-50);
    y = round(random(1,100));
    y = (int)map(y,1,100,50,height-50);
    
    // set random color
    r = round(random(1,255));
    g = round(random(1,255));
    b = round(random(1,255));
  }
  
  void show(){ // draw food as a circle
    fill(r,g,b);
    ellipse(x,y,size,size);
  }
  
}
