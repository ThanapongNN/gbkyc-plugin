// Welcome to the FaceTec Sample App
// This sample demonstrates Initialization, Liveness Check, Enrollment, Authentication, Photo ID Match, Customizing the UX, and Getting Audit Trail Images.
// Please use our technical support form to submit questions and issue reports:  https://dev.facetec.com/

import UIKit
import FaceTecSDK
import LocalAuthentication

class SampleAppViewController: UIViewController, URLSessionDelegate {
    var latestSessionResult: FaceTecSessionResult!
    var latestProcessor: Processor!

    // Initiate a 3D Liveness Check.
    @IBAction func onLivenessCheckPressed(_ sender: Any) {
        self.latestProcessor = SetSuccessFalse()

        // Get a Session Token from the FaceTec SDK, then start the 3D Liveness Check.
        getSessionToken() { sessionToken in
            self.latestProcessor = LivenessCheckProcessor(sessionToken: sessionToken, fromViewController: self)
        }
    }

    func onComplete() {
    }
    
    func setLatestSessionResult(sessionResult: FaceTecSessionResult) {
        latestSessionResult = sessionResult
    }
    
    func getSessionToken(sessionTokenCallback: @escaping (String) -> ()) {
        let endpoint = Config.BaseURL + "/session-token"
        let request = NSMutableURLRequest(url: NSURL(string: endpoint)! as URL)
        request.httpMethod = "GET"
        // Required parameters to interact with the FaceTec Managed Testing API.
        request.addValue(Config.DeviceKeyIdentifier, forHTTPHeaderField: "X-Device-Key")
        request.addValue(FaceTec.sdk.createFaceTecAPIUserAgentString(""), forHTTPHeaderField: "User-Agent")
        
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            // Ensure the data object is not nil otherwise callback with empty dictionary.
            guard let data = data else {
                print("Exception raised while attempting HTTPS call.")
                return
            }
            if let responseJSONObj = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                if((responseJSONObj["sessionToken"] as? String) != nil)
                {
                    sessionTokenCallback(responseJSONObj["sessionToken"] as! String)
                    return
                }
                else {
                    print("Exception raised while attempting HTTPS call.")
                }
            }
        })
        task.resume()
    }
    
    class SetSuccessFalse: Processor {
        var success = false
        func isSuccess() -> Bool {
            return success
        }
    }
    
}
