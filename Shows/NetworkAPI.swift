//
//  Network.swift
//  Shows
//
//  Created by Alon Haiut on 27/11/2018.
//  Copyright © 2018 Alon Haiut. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol NetworkAPIProtocol {
    func request(for endpoint: Endpoint) -> URLRequestConfiguration
}

struct ResponseType<T> {
    var progress: PublishSubject<Progress>
    var response: Observable<T>
}

private let defaultMiddlewares: [Middleware] = [RequestLogger(),
                                                ResponseLogger(),
                                                ContentTypeRequestMiddleware()]

class NetworkAPI: NetworkAPIProtocol {
    let environment: EnvironmentProtocol
    let requestMiddlewares: [RequestMiddleware]
    let responseMiddlewares: [ResponseMiddleware]

    init(environment: EnvironmentProtocol,
         middlewares: [Middleware] = defaultMiddlewares) {

        self.environment = environment

        self.requestMiddlewares = middlewares
            .map { $0 as? RequestMiddleware }
            .unwrap()

        self.responseMiddlewares = middlewares
            .map { $0 as? ResponseMiddleware }
            .unwrap()
    }

    private func requestAfterPerformingMiddlewares(with request: URLRequest) -> URLRequest {
        var newRequest = request
        for middleware in requestMiddlewares {
            newRequest = middleware.process(request: newRequest)
        }
        return newRequest
    }

    private func responseAfterPerformingMiddlewares<T: Decodable>(with response: DataResponse<T>) -> DataResponse<T> {
        var newResponse = response
        for middleware in responseMiddlewares {
            newResponse = middleware.process(response: newResponse)
        }
        return newResponse
    }

    func request(for endpoint: Endpoint) -> URLRequestConfiguration {
        return URLRequestConfigure(environment: environment,
                                   endpoint: endpoint)
    }

    @discardableResult
    func performRequest<T: Decodable>(route: URLRequestConfiguration, decoder: JSONDecoder = JSONDecoder()) -> ResponseType<T> {
        let progress = PublishSubject<Progress>()

        let request = requestAfterPerformingMiddlewares(with: route.urlRequest!)

        let response = Observable<T>.create { observer in
            let task = AF.request(request)
                .downloadProgress(closure: { prog in
                    progress.onNext(prog)
                })
                .responseJSONDecodable(decoder: decoder, completionHandler: { [weak self] (response: DataResponse<T>) in
                    guard let `self` = self else { return }

                    let newResponse = self.responseAfterPerformingMiddlewares(with: response)

                    switch newResponse.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                    }
                })
            return Disposables.create {
                task.cancel()
            }
        }

        return ResponseType<T>(progress: progress, response: response)
    }
}
