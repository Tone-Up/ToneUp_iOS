//
//  CameraCaptureView.swift
//  ToneUp
//
//  Created by 전준영 on 6/27/25.
//

import SwiftUI
import AVFoundation
import Vision

struct CameraCaptureView: View {
    @Environment(\.presentationMode) var presentation
    
    let onDismiss: () -> Void
    let onFaceFound: (UIImage) -> Void
    
    var body: some View {
        ZStack {
            CameraPreview(onPixelBuffer: { buffer in
                let request = VNDetectFaceRectanglesRequest { req, _ in
                    if let _ = req.results?.first {
                        capturePhoto { image in
                            onFaceFound(image)
                            onDismiss()
                        }
                    }
                }
                try? VNImageRequestHandler(cvPixelBuffer: buffer).perform([request])
            })
            
            Text("얼굴을 자동감지 합니다")
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(8)
                .padding(.top, 50)
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func capturePhoto(completion: @escaping (UIImage) -> Void) {
    }
}


import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    
    let onPixelBuffer: (CVPixelBuffer) -> Void

    func makeUIView(context: Context) -> PreviewView {
        let previewView = PreviewView()
        let session = AVCaptureSession()
        session.sessionPreset = .photo
        
        guard
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front),
            let input = try? AVCaptureDeviceInput(device: device)
        else {
            return previewView
        }
        session.addInput(input)
        
        let videoOutput = AVCaptureVideoDataOutput()
        videoOutput.setSampleBufferDelegate(context.coordinator,
                                            queue: DispatchQueue(label: "VideoBufferQueue"))
        videoOutput.alwaysDiscardsLateVideoFrames = true
        session.addOutput(videoOutput)
        
        if let connection = videoOutput.connection(with: .video), connection.isVideoOrientationSupported {
            connection.videoOrientation = .portrait
        }
        
        previewView.videoPreviewLayer.session = session
        previewView.videoPreviewLayer.videoGravity = .resizeAspectFill
        
        let photoOutput = AVCapturePhotoOutput()
        session.addOutput(photoOutput)
        context.coordinator.photoOutput = photoOutput
        
        context.coordinator.session = session
        session.startRunning()
        return previewView
    }

    func updateUIView(_ uiView: PreviewView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class PreviewView: UIView {
        override class var layerClass: AnyClass { AVCaptureVideoPreviewLayer.self }
        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            layer as! AVCaptureVideoPreviewLayer
        }
    }

    class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
        let parent: CameraPreview
        var session: AVCaptureSession?
        var photoOutput: AVCapturePhotoOutput?

        init(parent: CameraPreview) {
            self.parent = parent
        }

        func captureOutput(_ output: AVCaptureOutput,
                           didOutput sampleBuffer: CMSampleBuffer,
                           from connection: AVCaptureConnection) {
            guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
            parent.onPixelBuffer(pixelBuffer)
        }
    }
}
