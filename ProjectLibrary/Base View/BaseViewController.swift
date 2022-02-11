//
//  BaseViewController.swift
//  Wbooks
//
//  Created by Upegui on 23/11/21.
//
//  principal library
import UIKit
 
//  name of class          tipe class
class BaseViewController: UIViewController {

//  variable       tipe variable
    let imgHeader = UIImageView()
    let titleLabel = UILabel()
    
//  principal funcion make in this see en view
    override func viewDidLoad() {
        super.viewDidLoad()
//          this is a custom color make whit RGB , rank for RED,BLUE, GREEN from 0 to 255 , rank for alpha 0 to 1 this is the        opacity the color more transparency between more nearby to ZERO (0)
        view.backgroundColor = UIColor(red: 234/255, green: 242/255, blue: 248/255, alpha: 1)
        
        configImgHeader()
        configTitleLabel()
        
    }
    
    func configImgHeader() {
        // add variable to view
        view.addSubview(imgHeader)
        // join an extension to fit this image and save code in this view
        imgHeader.image = UIImage(named: "bc_nav bar")
        // this serves to avoid other different constrains that is to evade automatic frames
        imgHeader.translatesAutoresizingMaskIntoConstraints = false
        // persinalizing constrains must be pasted with something or itself and add a constant numerical value
        NSLayoutConstraint.activate([
            // the constrains begin of up - above of (view or other object)
            imgHeader.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            // left
            imgHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            // right
            imgHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            // heigh but this define value determinate and constant
            imgHeader.heightAnchor.constraint(equalToConstant: 130)
            // down
            //imgHeader.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: o)
        ])
    }
    
    func configTitleLabel() {
        imgHeader.addSubview(titleLabel)
        titleLabel.text = " "
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            //titleLabel.topAnchor.constraint(equalTo: imgHeader.topAnchor, constant: 60),
            titleLabel.centerXAnchor.constraint(equalTo: imgHeader.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: imgHeader.centerYAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 44)
            ])
        }
}
