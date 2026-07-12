package com.genc.arfoms.flight.controller;

import com.genc.arfoms.flight.dto.FareUpdateRequest;
import com.genc.arfoms.flight.dto.FlightRequest;
import com.genc.arfoms.flight.dto.ScheduleUpdateRequest;
import com.genc.arfoms.flight.exception.FlightException;
import com.genc.arfoms.flight.model.Flight;
import com.genc.arfoms.flight.model.InternationalAirports;
import com.genc.arfoms.flight.model.FlightStatus;
import com.genc.arfoms.flight.model.IndianAirports;
import com.genc.arfoms.flight.service.FlightService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

@RestController
@RequestMapping("/api/flights")
public class FlightController {

    private final FlightService flightService;

    public FlightController(FlightService flightService) {
        this.flightService = flightService;
    }

    @GetMapping
    public List<Flight> getAllFlights() {
        return flightService.getAllFlights();
    }

    @GetMapping("/id/{flightId}")
    public Flight getFlightById(@PathVariable Long flightId) {
        Flight flight = flightService.getFlight(flightId);
        if (flight == null) {
            throw new FlightException(HttpStatus.NOT_FOUND, "Flight not found for ID " + flightId);
        }
        return flight;
    }

    @GetMapping("/{flightNumber}")
    public Flight getFlightByNumber(@PathVariable String flightNumber) {
        return flightService.getFlightDetails(flightNumber)
                .orElseThrow(() -> new FlightException(HttpStatus.NOT_FOUND, "Flight not found for number " + flightNumber));
    }

    @PostMapping
    public ResponseEntity<Flight> addFlight(@RequestBody FlightRequest request) {
        Flight flight = request.toEntity();
        flightService.addFlight(flight);
        return ResponseEntity.status(HttpStatus.CREATED).body(getFlightByNumber(flight.getFlightNumber()));
    }

    @RequestMapping(value = "/{flightIdentifier}/schedule", method = {RequestMethod.PUT, RequestMethod.PATCH})
    public Flight updateSchedule(@PathVariable String flightIdentifier,
                                 @RequestBody ScheduleUpdateRequest request) {
        Flight flight = flightService.findByFlightNumberOrId(flightIdentifier);
        flightService.updateSchedule(flight.getFlightNumber(), request.getDepartureTime(), request.getArrivalTime(), request.getFlightStatus());
        return getFlightByNumber(flight.getFlightNumber());
    }

    @RequestMapping(value = {"/{flightIdentifier}/fares", "/{flightIdentifier}/fare-class"}, method = {RequestMethod.PUT, RequestMethod.PATCH})
    public Flight setFares(@PathVariable String flightIdentifier,
                           @RequestBody FareUpdateRequest request) {
        Flight flight = flightService.findByFlightNumberOrId(flightIdentifier);
        flightService.setFares(flight.getFlightNumber(), request.getEconomyFare(), request.getPremiumFare(), request.getFirstFare());
        return getFlightByNumber(flight.getFlightNumber());
    }

    @DeleteMapping("/{flightIdentifier}")
    public ResponseEntity<Void> deleteFlight(@PathVariable String flightIdentifier) {
        Flight flight = flightService.findByFlightNumberOrId(flightIdentifier);
        flightService.deleteFlight(flight.getFlightNumber());
        return ResponseEntity.noContent().build();
    }
    @PostMapping("/search")
    public ResponseEntity<List<Flight>> searchFlights(@RequestBody Map<String, Object> criteria) {
        String fromLocation = (String) criteria.get("fromLocation");
        String toLocation = (String) criteria.get("toLocation");
        String departureDate = (String) criteria.get("departureDate");
        String flightType = (String) criteria.get("flightType");
        Integer passengers = (Integer) criteria.get("passengers");

        List<Flight> flights = flightService.searchAvailableFlights(fromLocation, toLocation, departureDate, flightType, passengers);
        return ResponseEntity.ok(flights);
    }
    @GetMapping("/metadata")
    public Map<String, Object> getMetadata() {
        List<IndianAirports.Airport> indianAirports = IndianAirports.AIRPORTS;
        List<IndianAirports.Airport> internationalAirports = InternationalAirports.AIRPORTS;
        List<IndianAirports.Airport> allAirports = Stream.concat(indianAirports.stream(), internationalAirports.stream())
                .toList();

        return Map.of(
                "statuses", FlightStatus.values(),
                "airports", allAirports,
                "indianAirports", indianAirports,
                "internationalAirports", internationalAirports
        );
    }
}