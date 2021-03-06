//
//  ListBookTableViewCell.swift
//  ProjectLibrary
//
//  Created by Upegui on 29/10/21.
//

import UIKit
import Alamofire
import AlamofireImage

class ListBookTableViewCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var titleBookLabel: UILabel!
    @IBOutlet weak var authorBookLabel: UILabel!
    @IBOutlet weak var numberBookLabel: UILabel!
    @IBOutlet weak var containInfoView: GeneralView!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func config(book: Book) {
        
        let numberRandom = Int.random(in: 10000...99999)
        
        containInfoView.layer.cornerRadius = 20
        containInfoView.layer.shadowColor = UIColor.black.cgColor
        containInfoView.layer.shadowOpacity = 0.1
        containInfoView.layer.shadowOffset = .zero
        containInfoView.layer.shadowRadius = 5
        numberBookLabel.backgroundColor = Constants.Colors.blueColor
        numberBookLabel.layer.cornerRadius = 12
        numberBookLabel.layer.masksToBounds = true
        titleBookLabel.text = book.title
        authorBookLabel.text = book.author
        priceLabel.text = "$ \(numberRandom)"
        
        numberBookLabel.text = "\(book.id)"
        
        let downloader = ImageDownloader()
        guard let url = URL(string: book.image) else {
            coverImage.image = #imageLiteral(resourceName: "noImageAvalible")
            return
        }
        let urlRequest = URLRequest(url: url)

        downloader.download(urlRequest, completion: { response in
            if case .success(let image) = response.result {
                self.coverImage.image = image
            }
        })
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
