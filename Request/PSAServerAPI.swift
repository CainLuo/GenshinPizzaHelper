//
//  PSAServerAPI.swift
//  GenshinPizzaHelper
//
//  Created by Bill Haku on 2022/10/26.
//

import Foundation

extension API {
    struct PSAServer {
        /// 上传数据
        static func uploadUserData(
            path: String,
            ds: String,
            dseed: String,
            data: Data,
            _ completion: @escaping (PSAServerPostResultModelResult) -> ()
        ) {
            // 请求类别
            let urlStr = "/abyss/upload"

            var headers = [String: String]()
            headers.updateValue(ds, forKey: "ds")
            headers.updateValue(dseed, forKey: "dseed")

            // 请求
            HttpMethod<PSAServerPostResultModel>
                .homeServerRequest(
                    .post,
                    urlStr: urlStr,
                    body: data,
                    headersDict: headers
                ) { result in
                    switch result {

                    case .success(let requestResult):
                        print("request succeed")
                        let userData = requestResult.data
                        let retcode = requestResult.retCode
                        let message = requestResult.message

                        switch requestResult.retCode {
                        case 0:
                            print("get data succeed")
                            completion(.success(requestResult))
                        default:
                            print("fail")
                            completion(.failure(.uploadError(requestResult.message)))
                        }

                    case .failure(_):
                        break
                    }
                }
        }

        /// 深渊角色使用率
        static func fetchAbyssUtilizationData(
            season: Int = { () -> Int in
                let component = Calendar.current.dateComponents([.day, .month, .year], from: Date())
                if component.day! >= 16 {
                    return Int(String(component.year!)+String(component.month!)+"0")!
                } else {
                    return Int(String(component.year!)+String(component.month!)+"1")!
                }
            }(),
            server: Server? = nil,
            floor: Int = 12,
            _ completion: @escaping (UtilizationDataFetchModelResult) -> ()
        ) {
            // 请求类别
            let urlStr = "/abyss/utilization"

            var headers = [String: String]()

            // 请求
            HttpMethod<UtilizationDataFetchModel>
                .homeServerRequest(
                    .get,
                    urlStr: urlStr,
                    headersDict: paras
                ) { result in
                    switch result {

                    case .success(let requestResult):
                        print("request succeed")
                        let userData = requestResult.data
                        let retcode = requestResult.retCode
                        let message = requestResult.message

                        switch requestResult.retCode {
                        case 0:
                            print("get data succeed")
                            completion(.success(requestResult))
                        default:
                            print("fail")
                            completion(.failure(.uploadError(requestResult.message)))
                        }

                    case .failure(_):
                        break
                    }
                }
        }

        /// 满星玩家持有率
        static func fetchFullStarHoldingRateData(
            season: Int = { () -> Int in
                let component = Calendar.current.dateComponents([.day, .month, .year], from: Date())
                if component.day! >= 16 {
                    return Int(String(component.year!)+String(component.month!)+"0")!
                } else {
                    return Int(String(component.year!)+String(component.month!)+"1")!
                }
            }(),
            server: Server? = nil,
            _ completion: @escaping (AvatarHoldingReceiveDataFetchModelResult) -> ()
        ) {

        }

        /// 所有玩家持有率
        static func fetchHoldingRateData(
            queryStartDate: Date
            ,
            server: Server? = nil,
            _ completion: @escaping (AvatarHoldingReceiveDataFetchModelResult) -> ()
        ) {

        }

        /// 后台服务器版本
        static func fetchHomeServerVersion(
            _ completion: @escaping (HomeServerVersionFetchModelResult) -> ()
        ) {

        }

    }
}
