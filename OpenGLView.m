#import "OpenGLView.h"
#import "AppDelegate.h"

#import "helloar.h"

#import <easyar/engine.oc.h>

@interface OpenGLView ()
{
}

@end

@implementation OpenGLView {
    BOOL initialized;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self->initialized = false;
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    self.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    self.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    self.drawableStencilFormat = GLKViewDrawableStencilFormat8;
    [self bindDrawable];
    return self;
}

- (void)dealloc
{
}

- (void)start
{
    if (initialize()) {
        start();
        //setVideoUrl(_videoUrl);
    }
}

- (void)stop
{
    stop();
    finalize();
}

- (void)setUrl:(NSString *)url {
  setVideoUrl(url);
}

- (void)resize:(CGRect)frame orientation:(UIInterfaceOrientation)orientation
{
    float scale;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0f) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpartial-availability"
        scale = [[UIScreen mainScreen] nativeScale];
#pragma clang diagnostic pop
    } else {
        scale = [[UIScreen mainScreen] scale];
    }

    resizeGL(frame.size.width * scale, frame.size.height * scale);
}

- (void)drawRect:(CGRect)rect
{
    if (!initialized) {
        initGL();
        initialized = YES;
    }
    render();
}

- (void)setOrientation:(UIInterfaceOrientation)orientation
{
    switch (orientation)
    {
        case UIInterfaceOrientationPortrait:
            [easyar_Engine setRotation:270];
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            [easyar_Engine setRotation:90];
            break;
        case UIInterfaceOrientationLandscapeLeft:
            [easyar_Engine setRotation:180];
            break;
        case UIInterfaceOrientationLandscapeRight:
            [easyar_Engine setRotation:0];
            break;
        default:
            break;
    }
}

@end
