//
//  NetworkLayer.swift
//  MovieApp
//
//  Created by HYEONG SIK NAM on 2022/04/06.
//

import Foundation

enum RequestType {
    case justURL(urlString: String)
    case searchMovie(querys: [URLQueryItem])
}

enum MovieAPIError: Error {
    case badURL
}

class NetworkLayer {
    
    typealias NetworkCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
    
    func request(type: RequestType, completion: @escaping NetworkCompletion) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        do {
            let request = try buildRequest(type: type)
            session.dataTask(with: request) { data, response, error in
                print( (response as! HTTPURLResponse).statusCode )

                completion(data, response, error)
                
            }.resume()
            session.finishTasksAndInvalidate()
        } catch {
            print(error)
        }
    }

    private func buildRequest(type: RequestType) throws -> URLRequest {
        switch type {
        case .justURL(urlString: let urlString):
            
            guard let hasUrl = URL(string: urlString) else {
                throw MovieAPIError.badURL
            }
            
            var request = URLRequest(url: hasUrl)
            request.httpMethod = "GET"
            return request
            
        case .searchMovie(querys: let querys):
            
            var components = URLComponents(string: "https://itunes.apple.com/search")
            
            components?.queryItems = querys
            
            guard let hasUrl = components?.url else {
                throw MovieAPIError.badURL
            }
            
            var request = URLRequest(url: hasUrl)
            request.httpMethod = "GET"
            return request
        }
        
        
    }
    
    
}


