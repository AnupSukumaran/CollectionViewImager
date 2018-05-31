//
//  NetworkingService.swift
//  CollectionViewImager
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import Foundation
import UIKit

typealias JSON = [String: Any] // this also implies as NSDictionary type 

class NetworkingService {
    
    static let shared = NetworkingService()
    private init() {} // this is stop initializing in other class file by make it private which limits to this file only.
    
    let session = URLSession.shared
    
    func getImagers(success successBlock: @escaping (GetImageResponse) -> ()) {
        
        guard let url = URL(string: "https://api.imgur.com/3/gallery/r/cats") else {return}
        var request = URLRequest(url: url)
        request.addValue("Client-ID feb9030c81092ac", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {return}
            guard let data = data else {return}
            
            do{
                guard let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? JSON else {return}
                 print("JSON = \(json)")
                //  the json data is recevied by the GetImageResponse struct with a reciever of type JSON or [String: Any] ie the typealias
                let getImageReponse = try GetImageResponse(json: json)
                
                DispatchQueue.main.async {
                     successBlock(getImageReponse)
                }
               
                
            }catch let error{
                
                print("Error = \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    
    // this func downloads the images with the links receving from model struct file from a func in that file.
    func downloadImage(fromLink url: String, success successBlock: @escaping (UIImage) -> Void){
        guard  let url = URL(string: url) else {
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {return}
            guard let data = data, let image = UIImage(data: data)
                else {return}
            DispatchQueue.main.async {
                successBlock(image)
            }
        }.resume()
    }
    
}
