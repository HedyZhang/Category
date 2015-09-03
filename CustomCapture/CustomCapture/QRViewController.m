//
//  YSCaptureViewController.m
//  CustomCapture
//
//  Created by yanshu on 15/9/1.
//  Copyright (c) 2015年 haidi. All rights reserved.
//

#import "QRViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "QRView.h"
@interface QRViewController ()<AVCaptureMetadataOutputObjectsDelegate>
@property (nonatomic, strong) AVCaptureSession           * session;
@property (nonatomic, strong) AVCaptureDevice            *device;

@property (nonatomic, strong) AVCaptureDeviceInput       * videoInput;

@property (nonatomic, strong) AVCaptureMetadataOutput    *videoOutput;

@property (nonatomic, strong) AVCaptureStillImageOutput  * stillImageOutput;


@property (nonatomic, strong) AVCaptureVideoPreviewLayer * previewLayer;

@end

@implementation QRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupSession];
}
- (void)setupSession
{
    self.session = [[AVCaptureSession  alloc] init];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    self.videoInput = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    
    dispatch_queue_t dispatchQueue;
    dispatchQueue = dispatch_queue_create("myQueue", NULL);

    self.videoOutput = [[AVCaptureMetadataOutput alloc] init];
    [_videoOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    
    if ([_session canAddInput:self.videoInput]) {
        [_session addInput:self.videoInput];
    }
    
    if ([_session canAddOutput:self.videoOutput]) {
        [_session addOutput:self.videoOutput];
    }
    
    self.videoOutput.metadataObjectTypes = @[AVMetadataObjectTypeEAN13Code,
                                    AVMetadataObjectTypeEAN8Code,
                                    AVMetadataObjectTypeCode128Code,
                                    AVMetadataObjectTypeQRCode];
    
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    [_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [_previewLayer setFrame:self.view.layer.bounds];
    _previewLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.58].CGColor;
    [self.view.layer addSublayer:_previewLayer];
    
    
    [self.session startRunning];
    [self initQrView];
    
}
- (void)initQrView
{
    CGRect screenRect = [UIScreen mainScreen].bounds;
    QRView *qrRectView = [[QRView alloc] initWithFrame:screenRect];
    qrRectView.backgroundColor = [UIColor clearColor];
    qrRectView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    [self.view addSubview:qrRectView];
    
    //修正扫描区域
    //    CGFloat screenHeight = self.view.frame.size.height;
    //    CGFloat screenWidth = self.view.frame.size.width;
    //    CGRect cropRect = CGRectMake((screenWidth - qrRectView.transparentArea.width) / 2,
    //                                 (screenHeight - qrRectView.transparentArea.height) / 2,
    //                                 qrRectView.transparentArea.width,
    //                                 qrRectView.transparentArea.height);
    //
    //    [_output setRectOfInterest:CGRectMake(cropRect.origin.y / screenHeight,
    //                                          cropRect.origin.x / screenWidth,
    //                                          cropRect.size.height / screenHeight,
    //                                          cropRect.size.width / screenWidth)];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
