//
//  Horoscope.swift
//  Horoscopo
//
//  Created by Turno Mananas on 18/11/2026.
//

import UIKit

struct Horoscope {
    let id : String
    let name : String
    let dates : String
    let element : String
    var sign : UIImage {
        return UIImage(named: "\(id)-icon")!
    }
    static let horoscopeList: [Horoscope] = [
        Horoscope(id: "aries", name: "Aries", dates: "March 21 to April 19",element: "Fuego"),
        Horoscope(id: "taurus", name: "Taurus", dates: "April 20 to May 20",element: "Tierra"),
        Horoscope(id: "gemini", name: "Gemini", dates: "May 21 to June 20",element: "Aire"),
        Horoscope(id: "cancer", name: "Cancer", dates: "June 21 to July 22",element: "Agua"),
        Horoscope(id: "leo", name: "Leo", dates: "July 23 to August 22",element: "Fuego"),
        Horoscope(id: "virgo", name: "Virgo", dates: "August 23 to September 22",element: "Tierra"),
        Horoscope(id: "libra", name: "Libra", dates: "September 23 to October 22",element: "Aire"),
        Horoscope(id: "scorpio", name: "Scorpio", dates: "October 23 to November 21",element: "Agua"),
        Horoscope(id: "sagittarius", name: "Sagittarius", dates: "November 22 to December 21",element: "Fuego"),
        Horoscope(id: "capricorn", name: "Capricorn", dates: "December 22 to January 19",element: "Tierra"),
        Horoscope(id: "aquarius", name: "Aquarius", dates: "January 20 to February 18",element: "Aire"),
        Horoscope(id: "pisces", name: "Pisces", dates: "February 19 to March 20",element: "Agua")
    ]
}
