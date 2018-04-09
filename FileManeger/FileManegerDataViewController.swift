//
//  FileManegerDataViewController.swift
//  FileManeger
//
//  Created by harshil on 22/03/18.
//  Copyright © 2018 harshil. All rights reserved.
//

import UIKit

class FileManegerDataViewController: UIViewController {

    var paths:String?
    @IBOutlet weak var FileImageData: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //listFilesFromDocumentsFolder()
        

        // Do any additional setup after loading the view.
    }

    
    
    
    
    @IBAction func btnGetImageDataPressed(_ sender: UIButton) {

        let documentsPath1 = NSURL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])
        var logsPath = documentsPath1.appendingPathComponent("data")
        
        
        let image = UIImage(named: "har.jpg")
        
        let fileName = "image.jpg"
        

       // done
        
        if !FileManager.default.fileExists(atPath: (logsPath?.path)!) {
            do {
                try FileManager.default.createDirectory(at: logsPath!, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print(error)
            }
        }
        logsPath?.appendPathComponent(fileName)
        
        print(logsPath?.path)
        
        if let data = UIImageJPEGRepresentation(image!, 1.0),
            !FileManager.default.fileExists(atPath: (logsPath?.path)!) {
            do {
                // writes the image data to disk
                try data.write(to: logsPath!)
                print("file saved")
            } catch {
                print("error saving file:", error)
            }
        }
        
         paths = logsPath?.path
        
        
        
    
    }
    
    
    @IBAction func btnSimpleImageDataPressed(_ sender: UIButton) {
//        let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
//        let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
//        let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
//        if let dirPath = paths.first
//        {
//            let imgUrl = URL(fileURLWithPath: dirPath).appendingPathComponent("ImageData.png")
            let fileManager = FileManager.default
        if fileManager.fileExists(atPath: paths!)
            {
                print("FILE IS AVAILABLE")
                let image = UIImage(contentsOfFile: paths!)
                FileImageData.image = image
                
            }
            else
            {
                print("FILE IS NOT AVAILABLE")
            }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
