//
//  FeedCell.swift
//  instagram_clone
//
//  Created by Muraino Yakubu on 15/11/2021.
//

import UIKit

class FeedCell: UICollectionViewCell {
    //#imageLiteral(resourceName: "venom-7")
   private let profileImaage : UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "venom-7")
        return iv
    }()
    //why use lazy is- add target never exist  until it is initialized
    private lazy var  userNameButton : UIButton = {
        let bt = UIButton(type: .system)
        bt.setTitleColor(.black,for: .normal)
        bt.setTitle("beaola", for: .normal)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        bt.addTarget(self, action: #selector(openProfilePage), for: .touchUpInside)
        return bt
    }()
    
    private let feedImaage : UIImageView = {
         let iv = UIImageView()
         iv.clipsToBounds = true
         iv.contentMode = .scaleAspectFill
         iv.isUserInteractionEnabled = true
         iv.image = #imageLiteral(resourceName: "venom-7")
         return iv
     }()
    
    private lazy var likeButton : UIButton = {
        let bt = UIButton(type: .system)
        bt.tintColor = .black
        bt.setImage( #imageLiteral(resourceName: "like_unselected"), for: .normal)
        return bt
    }()
    
    private lazy var commentButton : UIButton = {
        let bt = UIButton(type: .system)
        bt.tintColor = .black
        bt.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        return bt
    }()
    
    
    private lazy var sendButton : UIButton = {
        let bt = UIButton(type: .system)
        bt.tintColor = .black
        bt.setImage( #imageLiteral(resourceName: "send2"), for: .normal)
        return bt
    }()
    
    private let likesLabel : UILabel = {
        let il = UILabel()
        il.text = "1 Like"
        il.textColor = .black
        il.font = UIFont.boldSystemFont(ofSize: 12)
        return il
    }()
    
    private let commentsLabel : UILabel = {
        let il = UILabel()
        il.text = "Na me first comment"
        il.textColor = .black
        il.font = UIFont.boldSystemFont(ofSize: 12)
        return il
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGray6
        
        addSubview(profileImaage)
        profileImaage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 10, paddingLeft: 10, width: 40, height: 40)
        profileImaage.layer.cornerRadius = 20
        
        
        addSubview(userNameButton)
        userNameButton.anchor(top: profileImaage.topAnchor, left: profileImaage.rightAnchor,bottom: profileImaage.bottomAnchor,paddingLeft: 10 )
        
        addSubview(feedImaage)
        feedImaage.anchor(top: profileImaage.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 5,   paddingBottom: 10, height: 400)
    
        addSubview(likeButton)
        likeButton.anchor(top: feedImaage.bottomAnchor, left: leftAnchor, paddingTop:10,   paddingLeft: 10, width: 25, height: 25)

        addSubview(commentButton)
        commentButton.anchor(top: feedImaage.bottomAnchor, left: likeButton.rightAnchor, paddingTop:10,   paddingLeft: 10, width: 25, height: 25)

        addSubview(sendButton)
        sendButton.anchor(top: feedImaage.bottomAnchor, left: commentButton.rightAnchor, paddingTop:10,   paddingLeft: 10, width: 25, height: 25)

        
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop:10,   paddingLeft: 10)
        
        
        addSubview(commentsLabel)
        commentsLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop:10,   paddingLeft: 10)

    }
    
    //MARK: - action to opemn another screen
    @objc func openProfilePage(){
        print ("sse me oga")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
