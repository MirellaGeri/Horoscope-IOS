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
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
