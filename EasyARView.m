//
//  EasyARView.m

#import "EasyARView.h"

@implementation EasyARView


- (instancetype)init
{
  self = [super init];
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame{

  if(self = [super initWithFrame:frame]){
    self.glView = [[OpenGLView alloc] initWithFrame: frame];
    
    [self.glView setOrientation:UIInterfaceOrientationPortrait];
    
    [self addSubview:_glView];
    //[self setNeedsDisplay];
    dispatch_async(dispatch_get_main_queue(), ^{[self.glView setNeedsDisplay];});
  }
  
  return self;
}

- (void)startGLView {
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.glView.frame = self.bounds;
  //[self.glView resize:self.bounds orientation:UIInterfaceOrientationPortrait];
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.glView resize:self.bounds orientation:UIInterfaceOrientationPortrait];
  });
}

- (void)removeFromSuperview {
  [self.glView stop];
}


- (void)didMoveToWindow{
  if (self.window) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [self.glView start];
    });
  }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
