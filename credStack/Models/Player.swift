//
//  Player.swift
//  credStack
//
//  Created by Rushabh Singh on 23/03/21.
//  Copyright © 2021 Rushabh Singh. All rights reserved.
//

import Foundation
struct Player {
    let name : String
    let description : String
    let shortDescription : String
    
    init(name : String, description : String, shortDescription : String) {
        self.name = name
        self.description = description
        self.shortDescription = shortDescription
    }
    
}

struct PlayerInfo {
    let playerInfoArray = [Player(name: "Sourav Ganguly", description: "Ganguly holds a special place in Indian cricket history. For a specific time period in his playing days he was at once the most hated and most loved player in the team. His captaincy tenure has got to be one of the most chronicled ones in recent times. Ganguly retains his magnetic ability to attract attention much like his playing days when things like him waving his shirt on the Lord's balcony, his coming late for the toss etc grabbed headlines. He has also taken a new avatar as a TV analyst and commentator but he remained an active player in the domestic circuit even three years after his retirement and played both in the Ranji trophy and the IPL with sporadic success until 2012. The Government of West Bengal honoured Ganguly with the Banga Bibhushan Award on 20 May 2013. He was also awarded the Padma Shri, one of the highest civilian awards in India, in 2004." ,shortDescription: "Prince of Kolkata"),
                           Player(name: "MS Dhoni", description: "Mahendra Singh Dhoni is one of the most popular cricketers of India who captained the team from 2007 to 2016. Dhoni is considered as one the best wicket-keepers in world cricket and is also one of the finest captains India has ever had. During Dhoni's captaincy, the Indian cricket team won the highest rank in all formats, including the No.1 Test ranking for 18 months starting December 2009, 50-over World Cup (2011) and World Twenty20 on his captaincy debut in 2007.  Throughout his career, Dhoni has showed excellent leadership skills, which was recognised when Rahul Dravid gave up captaincy in 2007. Once a ticket-collector at the Kharagpur Railway Station, Dhoni went on to become the quintessential captain cool, arguably the world’s best finisher, and one of the all-time greats of limited-overs cricket, bringing about a revolution that put the onus on the batsmen to pull off unlikely chases.",shortDescription: "Last Man Standing"),
                           Player(name: "Virat Kohli", description: "A spunky, chubby teenager with gelled hair shot to fame after leading India to glory in the Under-19 World Cup at Kuala Lumpur in early 2008. In an Indian team filled with saint-like icons worthy of their own hagiographies, Virat Kohli, with his most un-Indian, 'bad-boy' intensity, would clearly be an outcast. King Kohli had arrived. The king of the run-chase, and a plethora of ODI records in the modern age. Arguably one of the finest ODI batsmen of all-time, and certainly the greatest of his generation, Virat Kohli has played two senior World Cups after leading the junior team to the title in 2008. His ODI average in the 2017/18 ODI season has been a Bradmanesque 97.5, and he has amassed an unreal 19 hundreds since the 2015 World Cup. After the low of the World Cup ouster in 2015, Kohli leads the Indian side this time, with perhaps the strongest ODI team in the world, and as this generation's greatest ODI batsman.",shortDescription: "King of Jungle"),]
    
}
