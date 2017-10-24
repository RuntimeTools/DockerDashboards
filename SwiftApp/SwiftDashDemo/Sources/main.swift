import SwiftMetricsDash
import SwiftMetrics
import Foundation
import Kitura
import SwiftyJSON

do {
  let sm = try SwiftMetrics()

  _ = sm.monitor()

  let router = Router()

  let smd=try SwiftMetricsDash(swiftMetricsInstance : sm, endpoint: router)

  router.get("/json") {
    request, response, next in

    let result = JSON(["message":"Hello, World!"])
    response.headers["Content-Type"] = "application/json"
	  response.statusCode = .OK
	  do {
        let jsonData = try result.rawData(options:.prettyPrinted)
	      response.headers["Content-Length"] = String(jsonData.count)
	      response.send(data: jsonData)
		    try response.end()
	    } catch {
		      print("Failed to write the response. Error=\(error)")
      }
    }

  Kitura.addHTTPServer(onPort: 8080, with: router)
  Kitura.run()

} catch {
  print("Error: \(error)/:\n")
}
