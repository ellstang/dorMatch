//s  SingleHouseViewController.swift
//  UploadPhotoAPP
//
//  Created by 唐嘉伶 on 11/04/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.

import UIKit
import Firebase

class SingleHouseViewController: UIViewController {
    var post = Post_ForTableView()
  
  @IBOutlet weak var mainImage: UIImageView!
  @IBOutlet weak var postTitleLabel: UILabel!
  @IBOutlet weak var postDate: UILabel!
  @IBOutlet weak var longDescription: UILabel!
  @IBOutlet weak var goToChatVCBtn: UIButton!
  let userdefaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //adjuest font size of post title:
    postTitleLabel.adjustsFontSizeToFitWidth = true
    let imageURL = URL(string: post.imageURL!)
    postTitleLabel.text = post.postTitle!
    longDescription.text = post.imageLongDescription
    if let postUserName = post.postUserName , postUserName != "" {
    print("postUserName is \(postUserName)")
    goToChatVCBtn.setTitle("\(postUserName)", for: .normal)
    }
    
    URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
      if error != nil {
        print("download image task error \(error)")
      } else {
        DispatchQueue.main.async {
          self.mainImage.image = UIImage(data: data!)
        }
      }
    }.resume()
    
//    longDescription.textRect(forBounds: CGRect(x: 10, y: 10, width: 350, height: 180), limitedToNumberOfLines: 1)

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  @IBAction func goChatWithPostUser(_ sender: UIButton) {
    self.performSegue(withIdentifier: "goSendMsgVC", sender: nil)
  }
  
}



