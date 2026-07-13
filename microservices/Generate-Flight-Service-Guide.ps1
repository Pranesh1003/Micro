$ErrorActionPreference='Stop'
$root=$PSScriptRoot
$serviceRoot=Join-Path $root 'flight-service'
$out=Join-Path $root 'FLIGHT_SERVICE_PROJECT_EXPLANATION.txt'

function FilePurpose([string]$rel){
 switch -Regex ($rel) {
  'FlightServiceApplication.java' {'Starts Flight Service as an independently running Spring Boot microservice.';break}
  'FlightController.java' {'Defines Flight Service HTTP endpoints. API Gateway forwards `/api/flights/**` requests here.';break}
  'FlightServiceImpl.java' {'Contains the main airline rules: validate flights, create seats, update schedules/fares, and search available flights.';break}
  'FlightService.java' {'Defines the service-layer contract used by the controller and implementation.';break}
  'AirportDistanceService.java' {'Owns airport coordinate lookup and route-distance calculation.';break}
  'FlightRepository.java' {'Lets the service load and save Flight entities through Spring Data JPA.';break}
  'SeatInventoryRepository.java' {'Lets the service load and save seat rows and availability counts.';break}
  'model/Flight.java' {'Defines the Flight database/domain record: route, time, status, capacity and fares.';break}
  'model/SeatInventory.java' {'Defines one seat/inventory row associated with a flight.';break}
  'model/IndianAirports.java|model/InternationalAirports.java' {'Provides the airport lists used to validate routes and populate flight metadata.';break}
  'model/FlightStatus.java|model/SeatStatus.java' {'Defines allowed state values, avoiding inconsistent free-text statuses.';break}
  'dto/' {'Defines request/response data transferred between the frontend, Gateway, and Flight Service.';break}
  'config/SecurityConfig.java' {'Configures JWT security and browser CORS rules before requests reach Flight endpoints.';break}
  'config/JwtRequestFilter.java' {'Reads the JWT from every request and sets the authenticated ARFOMS user/role.';break}
  'config/JwtUtils.java' {'Creates, reads, and validates the JWT format shared with Auth Service.';break}
  'exception/' {'Turns business/validation errors into stable HTTP responses for the frontend.';break}
  'application.properties' {'Identifies Flight Service and imports its central settings from Config Server.';break}
  'log4j2.properties' {'Controls how Flight Service writes diagnostic logs.';break}
  'pom.xml' {'Declares the libraries Maven needs to build Flight Service.';break}
  default {'Supports the Flight Service part of the ARFOMS airline workflow.'}
 }
}
function MethodWhy([string]$sig){
 $s=$sig.ToLower()
 if($s -match 'main\('){'Starts the Flight Service process. Spring then loads Config Server settings, connects the service to Eureka/MySQL, creates beans, and opens port 8181.'}
 elseif($s -match 'dofilterinternal'){'Runs before protected controller methods. It reads the Bearer token issued at login, validates it, records the caller identity/role, then passes the request onward.'}
 elseif($s -match 'securityfilterchain|corsconfigurationsource'){'Defines who can use Flight endpoints and which frontend origins/methods are allowed. This protects staff write actions while allowing the browser application to call the API.'}
 elseif($s -match 'generatetoken|getusernamefromtoken|getrolefromtoken|validatetoken|getallclaims'){'Implements the shared JWT contract. Auth Service issues compatible tokens; Flight Service uses these methods to trust a logged-in user before returning/changing flight data.'}
 elseif($s -match 'getallflights|listflights'){'Supplies the list shown by flight-management or search screens. It obtains saved Flight records from the service layer.'}
 elseif($s -match 'getflightbyid|getflightbynumber|getflight\('){'Loads one flight for a detail screen or for another service workflow such as booking validation.'}
 elseif($s -match 'addflight'){'Staff workflow: receives a new schedule, validates it, saves it, and ensures its seats are created so customers can later book it.'}
 elseif($s -match 'updateschedule'){'Staff workflow: changes flight departure/arrival/status after validating the schedule. Booking/search screens read the updated result.'}
 elseif($s -match 'setfares|setfareclass'){'Staff fare-management workflow: updates ticket prices that the booking search/selection experience displays.'}
 elseif($s -match 'deleteflight'){'Staff workflow: removes a flight by its identifier when it must no longer be offered.'}
 elseif($s -match 'searchavailableflights|searchflights'){'Customer booking workflow: filters routes by origin, destination, date, flight type and passenger capacity, returning only suitable flights.'}
 elseif($s -match 'createseatinventory|seedseatinventory|attachavailableseats'){'Maintains seat availability. This makes each flight bookable and lets Booking Service/the frontend avoid offering occupied seats.'}
 elseif($s -match 'distance|coordinatesfor|haversine|calculateroutedistance'){'Computes route distance from airport coordinates. ARFOMS exposes/uses it as useful flight information and it supports services such as Loyalty.'}
 elseif($s -match 'validate|normalize|parsedatetime|parsestored|extractdate|parseDate|canonical|matcheslocation|isinternational|declaredcapacity'){'Validation/helper step. It keeps invalid routes, bad dates, negative fares, invalid capacity, or inconsistent locations from entering the flight database.'}
 elseif($s -match 'findbyflightnumberorid|findbyflightnumberorthrow'){'Central lookup helper. Other Flight Service operations call it so missing-flight handling is consistent.'}
 elseif($s -match 'getmetadata'){'Returns airport/status metadata used by the frontend to build dropdowns and forms without hard-coding the values in the UI.'}
 elseif($s -match 'toentity'){'Converts the inbound request DTO into a Flight entity before it is validated and persisted.'}
 elseif($s -match 'handle'){'Catches a known failure and converts it into the ResponseData/HTTP status expected by the frontend.'}
 else{'Supports the surrounding Flight Service workflow described by this class: request -> controller -> service rules -> database/response.'}
}
function Explain([string]$line,[string]$ext,[string]$rel){
 $t=$line.Trim()
 if($t -match '^package '){'Places this type in Flight Service''s Java namespace; Spring component scanning begins from the application package.'}
 elseif($t -match '^import '){'Imports a Java, Spring, JPA, security, date/time, or collection type needed by the Flight Service code below.'}
 elseif($t -match '^@'){'Spring/JPA annotation: supplies metadata that maps an HTTP endpoint, managed component, database field, validation rule, or security configuration to this code.'}
 elseif($ext -in '.properties','.yml','.yaml'){'Runtime setting: controls how Flight Service starts, obtains central config, or writes logs in the ARFOMS environment.'}
 elseif($ext -eq '.xml'){'Maven build setting: supplies a parent version, library, plugin, or packaging instruction needed for Flight Service.'}
 elseif($t -match '^public (class|interface|enum|record)'){'Declares a public Flight Service type. Its kind determines whether it is executable code, a contract, a finite status list, or an immutable data carrier.'}
 elseif($t -match '^private |^public |^protected ' -and $t -match ';$'){'Declares state, a constant, or an injected dependency used by Flight Service methods.'}
 elseif($t -match '^return '){'Returns this computed/persisted result to the caller. Controllers may serialize it to JSON for Gateway/frontend consumers.'}
 elseif($t -match '^throw '){'Stops an invalid airline workflow and raises a domain/validation failure. The global exception handler later returns a safe HTTP error.'}
 elseif($t -match '^(if|else if)\s*\('){'Conditional decision: Flight Service follows this path only when the given business condition is true.'}
 elseif($t -match '^else\b'){'Alternative business path used when the preceding condition is false.'}
 elseif($t -match '^(for|while)\s*\('){'Iteration step: repeats work for the matching flights, seats, airports, or input values.'}
 elseif($t -match '^try\b'){'Starts work that may fail while parsing/processing; the later catch block handles the known failure.'}
 elseif($t -match '^catch\s*\('){'Handles a failure so invalid external input can become a meaningful Flight Service error.'}
 elseif($t -match '='){'Creates, calculates, or assigns data used by the current Flight Service operation.'}
 elseif($t -match '\('){'Calls a method/constructor in the current Flight Service workflow, passing the shown inputs.'}
 elseif($t -match '^//|^/\*|^\*|^\*/'){'Developer comment explaining intent; it does not execute.'}
 else{'Meaningful Java statement that supports the current Flight Service operation.'}
}
function Show([string]$s){$s.Replace('`','''')}

$L=[Collections.Generic.List[string]]::new()
$L.Add('ARFOMS FLIGHT SERVICE - EASY PROJECT EXPLANATION');$L.Add('==================================================');$L.Add('')
$L.Add('This guide explains every meaningful source/configuration/build line in Flight Service. Empty lines and standalone structural braces are intentionally omitted. Before each method, the guide explains why that method exists in the ARFOMS airline workflow.');$L.Add('')
$L.Add('1. WHAT FLIGHT SERVICE OWNS');$L.Add('-----------------------------');$L.Add('')
$L.Add('Flight Service is the airline schedule and inventory owner. It stores flights, validates routes/times/fares, creates seat inventory, searches available flights, and provides flight information to Booking, Check-in, Crew, and Loyalty services.');$L.Add('')
$L.Add('Main customer/staff flow:');$L.Add('  Staff creates/updates a flight -> Flight Service validates and saves it -> seats are created -> customer searches flights -> Booking Service validates/uses the selected flight -> customer chooses an available seat.');$L.Add('')
$L.Add('Project connections:');$L.Add('  API Gateway forwards /api/flights/** to Flight Service on port 8181.');$L.Add('  Config Server supplies port, MySQL and Eureka settings.');$L.Add('  Eureka registers the service as flight-service.');$L.Add('  Booking uses the flight-service name to obtain/validate flight data.');$L.Add('  Auth issues JWTs; Flight Service validates them before protected actions.');$L.Add('')
$files=@(Get-Item (Join-Path $serviceRoot 'pom.xml'));$files+=Get-ChildItem (Join-Path $serviceRoot 'src/main') -File -Recurse|?{$_.Extension -in '.java','.properties','.yml','.yaml'}|Sort FullName
foreach($f in $files){
 $rel=$f.FullName.Substring($root.Length+1).Replace('\','/');$L.Add(('================================================================'));$L.Add(('FILE: '+$rel));$L.Add(('ROLE: '+(FilePurpose $rel)));$L.Add('================================================================');$L.Add('')
 $src=Get-Content -LiteralPath $f.FullName
 for($i=0;$i -lt $src.Count;$i++){
  $raw=$src[$i];$t=$raw.Trim();if(!$t -or $t -match '^[{}]+;?$'){continue}
  if($f.Extension -eq '.java' -and $t -match '^(public|private|protected)\s+.*\('){$L.Add(('METHOD: '+$t));$L.Add(('WHY/HOW IN ARFOMS: '+(MethodWhy $t)));$L.Add('')}
  $L.Add(('Line '+($i+1)+': '+(Show $t)));$L.Add(('Explanation: '+(Explain $raw $f.Extension $rel)));$L.Add('')
 }
}
$L.Add('KEY TAKEAWAY');$L.Add('------------');$L.Add('Flight Service is the source of truth for flights and availability. Other ARFOMS services should ask it for flight facts rather than independently inventing schedules, fares, routes, or seats. This keeps the customer booking journey consistent.');
[IO.File]::WriteAllLines($out,$L,[Text.UTF8Encoding]::new($false));Write-Output "Created $out with $($L.Count) lines."
