//
// PublicationAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



open class PublicationAPI: APIBase {
    /**
     Create a publication for a device for a user
     
     - parameter userId: (path) The id (UUID) of the user to create a device for 
     - parameter deviceId: (path) The id (UUID) of the user device 
     - parameter publication: (body) Publication to create on a device.  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func createPublication(userId: String, deviceId: String, publication: Publication, completion: @escaping ((_ data: Publication?,_ error: Error?) -> Void)) {
        createPublicationWithRequestBuilder(userId: userId, deviceId: deviceId, publication: publication).execute { (response, error) -> Void in
            completion(response?.body, error);
        }
    }


    /**
     Create a publication for a device for a user
     - POST /users/{userId}/devices/{deviceId}/publications
     - API Key:
       - type: apiKey dev-key 
       - name: dev-key
     - examples: [{contentType=application/json, example={
  "duration" : 1.3579000000000001069366817318950779736042022705078125,
  "op" : "aeiou",
  "payload" : { },
  "topic" : "aeiou",
  "range" : 1.3579000000000001069366817318950779736042022705078125,
  "location" : {
    "altitude" : 1.3579000000000001069366817318950779736042022705078125,
    "verticalAccuracy" : 1.3579000000000001069366817318950779736042022705078125,
    "latitude" : 1.3579000000000001069366817318950779736042022705078125,
    "horizontalAccuracy" : 1.3579000000000001069366817318950779736042022705078125,
    "deviceId" : "aeiou",
    "timestamp" : 123456789,
    "longitude" : 1.3579000000000001069366817318950779736042022705078125
  },
  "publicationId" : "aeiou",
  "deviceId" : "aeiou",
  "timestamp" : 123456789
}}]
     
     - parameter userId: (path) The id (UUID) of the user to create a device for 
     - parameter deviceId: (path) The id (UUID) of the user device 
     - parameter publication: (body) Publication to create on a device.  

     - returns: RequestBuilder<Publication> 
     */
    open class func createPublicationWithRequestBuilder(userId: String, deviceId: String, publication: Publication) -> RequestBuilder<Publication> {
        var path = "/users/{userId}/devices/{deviceId}/publications"
        path = path.replacingOccurrences(of: "{userId}", with: "\(userId)", options: .literal, range: nil)
        path = path.replacingOccurrences(of: "{deviceId}", with: "\(deviceId)", options: .literal, range: nil)
        let URLString = ScalpsAPI.basePath + path
        let parameters = publication.encodeToJSON() as? [String:AnyObject]
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<Publication>.Type = ScalpsAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: URLString, parameters: convertedParameters, isBody: true)
    }

}