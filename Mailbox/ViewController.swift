//
//  ViewController.swift
//  Mailbox
//
//  Created by Teus on 10/21/15.
//  Copyright © 2015 Teus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var messagePan: UIPanGestureRecognizer!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    @IBOutlet weak var list: UIImageView!
    @IBOutlet weak var messageImage: UIImageView!
    @IBOutlet weak var reschedule: UIImageView!
    @IBOutlet weak var feedView: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    
    
    var originalMessageView: CGPoint!
    var originalIconView: CGPoint!
    var originalListIconView: CGPoint!
    var originalFeedView: CGPoint!
    var originalArchiveIconView: CGPoint!
    var originalDeleteIconView: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 1432)
        originalMessageView = messageImage.center
        originalIconView = laterIcon.center
        originalListIconView = listIcon.center
        originalFeedView = feedView.center
        originalArchiveIconView = archiveIcon.center
        originalDeleteIconView = deleteIcon.center
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapView(sender: UITapGestureRecognizer) {
        
        messageView.alpha = 1
        messageImage.center = originalMessageView
        feedView.center = originalFeedView
        
        
    }
    
    
    @IBAction func didTapList(sender: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
            self.reschedule.alpha = 0
            self.list.alpha = 0
            }) { (Bool) -> Void in
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.feedView.center = CGPoint(x:self.feedView.center.x, y:self.feedView.center.y - 86)
                })
                
                self.scrollView.contentSize = CGSize(width: 320, height: 1432)
                
        }
    }
    @IBAction func didTapReschedule(sender: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
            self.reschedule.alpha = 0
            self.list.alpha = 0
            }) { (Bool) -> Void in
                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.feedView.center = CGPoint(x:self.feedView.center.x, y:self.feedView.center.y - 86)
                })
                
                self.scrollView.contentSize = CGSize(width: 320, height: 1432)
                
        }
    }
    
    @IBAction func didPanMessage(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        
        if sender.state == UIGestureRecognizerState.Began {
            archiveIcon.alpha = 0.5
            deleteIcon.alpha = 0
            laterIcon.alpha = 0.5
            listIcon.alpha = 0
            self.messageView.backgroundColor = UIColor(white: 0.667, alpha: 1)
            
        }
        else if sender.state == UIGestureRecognizerState.Changed {
            messageImage.center = CGPoint(x: originalMessageView.x + translation.x, y: originalMessageView.y)
            if translation.x > 260 {
                archiveIcon.center = CGPoint(x: originalArchiveIconView.x + translation.x - 60, y: originalArchiveIconView.y)
                deleteIcon.center = CGPoint(x: originalDeleteIconView.x + translation.x - 60, y: originalDeleteIconView.y)
                listIcon.alpha = 0
                laterIcon.alpha = 0
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.messageView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
                    self.deleteIcon.alpha = 1
                    self.archiveIcon.alpha = 0
                    
                })
            }
                
            else if translation.x > 60   {
                archiveIcon.center = CGPoint(x: originalArchiveIconView.x + translation.x - 60, y: originalArchiveIconView.y)
                deleteIcon.center = CGPoint(x: originalDeleteIconView.x + translation.x - 60, y: originalDeleteIconView.y)
                listIcon.alpha = 0
                laterIcon.alpha = 0
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.messageView.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)
                    self.archiveIcon.alpha = 1
                    self.deleteIcon.alpha = 0
                })
            }
            else if translation.x < -260 {
                listIcon.center = CGPoint(x: originalListIconView.x + translation.x + 60, y: originalListIconView.y)
                laterIcon.center = CGPoint(x: originalIconView.x + translation.x + 60, y: originalIconView.y)
                archiveIcon.alpha = 0
                deleteIcon.alpha = 0
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.messageView.backgroundColor = UIColor(red: 0.6, green: 0.4, blue: 0.2, alpha: 1)
                    self.laterIcon.alpha = 0
                    self.listIcon.alpha = 1
                })
            }
            else if translation.x < -60 {
                laterIcon.center = CGPoint(x: originalIconView.x + translation.x + 60, y: originalIconView.y)
                listIcon.center = CGPoint(x: originalListIconView.x + translation.x + 60, y: originalListIconView.y)
                archiveIcon.alpha = 0
                deleteIcon.alpha = 0
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.messageView.backgroundColor = UIColor(red: 1, green: 0.9, blue: 0, alpha: 1)
                    self.laterIcon.alpha = 1
                    self.listIcon.alpha = 0
                })
            }
            else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.laterIcon.alpha = 0.5
                    self.listIcon.alpha = 0
                    self.archiveIcon.alpha = 0.5
                    self.deleteIcon.alpha = 0
                    self.messageView.backgroundColor = UIColor(white: 0.667, alpha: 1)
                    self.laterIcon.center =  self.originalIconView
                    self.listIcon.center = self.originalListIconView
                    self.archiveIcon.center = self.originalArchiveIconView
                    self.deleteIcon.center = self.originalDeleteIconView
                })
            }
            
        }
        else if sender.state == UIGestureRecognizerState.Ended {
            
            if translation.x < -260 {
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    self.messageImage.center = CGPoint(x: self.originalMessageView.x - 320, y: self.originalMessageView.y)
                    self.laterIcon.center = CGPoint(x: self.originalIconView.x - 320, y: self.originalIconView.y)
                    self.listIcon.center = CGPoint(x: self.originalListIconView.x - 320, y: self.originalListIconView.y)
                    self.laterIcon.alpha = 0
                    self.listIcon.alpha = 0
                    self.archiveIcon.alpha = 0
                    self.deleteIcon.alpha = 0
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(1, animations: { () -> Void in
                            self.list.alpha = 0.9
                        })
                        
                })
            }
            else if translation.x < -60 {
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    self.messageImage.center = CGPoint(x: self.originalMessageView.x - 320, y: self.originalMessageView.y)
                    self.laterIcon.center = CGPoint(x: self.originalIconView.x - 320, y: self.originalIconView.y)
                    self.listIcon.center = CGPoint(x: self.originalListIconView.x - 320, y: self.originalListIconView.y)
                    self.laterIcon.alpha = 0
                    self.listIcon.alpha = 0
                    self.archiveIcon.alpha = 0
                    self.deleteIcon.alpha = 0
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(1, animations: { () -> Void in
                            self.reschedule.alpha = 0.9
                        })
                })
            }
                
            else if translation.x > 60 {
                UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                    self.messageImage.center = CGPoint(x: self.originalMessageView.x + 320, y: self.originalMessageView.y)
                    self.archiveIcon.center = CGPoint(x: self.originalIconView.x + 320, y: self.originalIconView.y)
                    self.deleteIcon.center = CGPoint(x: self.originalListIconView.x + 320, y: self.originalListIconView.y)
                    self.laterIcon.alpha = 0
                    self.listIcon.alpha = 0
                    self.archiveIcon.alpha = 0
                    self.deleteIcon.alpha = 0
                    }, completion: { (Bool) -> Void in
                        UIView.animateWithDuration(0.5, animations: { () -> Void in
                            self.feedView.center = CGPoint(x:self.feedView.center.x, y:self.feedView.center.y - 86)
                        })
                        self.scrollView.contentSize = CGSize(width: 320, height: 1432)
                    }
                )
            }
                
            else {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.messageImage.center = self.originalMessageView
                })
            }
        }
        
    }
    
}
