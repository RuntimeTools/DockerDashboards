/*******************************************************************************
 * Copyright 2017 IBM Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *******************************************************************************/

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
