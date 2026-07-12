package com.genc.arfoms.booking.client;

import com.genc.arfoms.booking.model.Flight;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;
import java.util.Map;

@FeignClient(name = "flight-service")
public interface FlightClient {

    @GetMapping("/api/flights/id/{flightId}")
    Flight getFlightById(@PathVariable("flightId") Long flightId);

    @PostMapping("/api/flights/search")
    List<Flight> searchFlights(@RequestBody Map<String, Object> criteria);

    @GetMapping("/api/flights")
    List<Flight> getAllFlights();
}
