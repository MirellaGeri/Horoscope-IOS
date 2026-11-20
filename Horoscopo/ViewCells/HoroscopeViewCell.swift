//
//  HoroscopeViewCell.swift
//  Horoscopo
//
//  Created by Turno Mananas on 18/11/2026.
//

import UIKit

class HoroscopeViewCell: UITableViewCell {
//esto seria como el viewHolder que llena los campos de la celda
    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.cornerRadius = 15
        //cardView.clipsToBounds = true
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.8
        cardView.layer.shadowOffset = CGSize(width: 0, height: 8)
        cardView.layer.shadowRadius = 10
        cardView.layer.masksToBounds = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    //darle un apellido con with 
    func render(with horoscope: Horoscope){
        signImageView.image = horoscope.sign
        nameLabel.text = horoscope.name
        datesLabel.text = horoscope.dates
        favoriteImageView.isHidden = !SessionManager().isFavorite(id: horoscope.id)
    }

}
