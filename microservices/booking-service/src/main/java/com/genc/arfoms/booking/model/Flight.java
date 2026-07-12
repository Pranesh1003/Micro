package com.genc.arfoms.booking.model;

import lombok.Data;

@Data
public class Flight {

    private Long flightId;
    private String flightNumber;
    private String flightName;
    private String origin;
    private String destination;
    private Double distanceMiles;
    private String departureTime;
    private String arrivalTime;
    private Double fare;
    private Double economyFare;
    private Double premiumFare;
    private Double firstFare;
    private FlightStatus flightStatus;
    private Integer seatCount;
    private Integer seatRows;
    private Integer seatColumns;
    private Integer seatAisleAfter;
    private Integer airlineId;
    private String airlineName;
    private Integer availableSeats;

    public Flight() {
        this.flightStatus = FlightStatus.SCHEDULED;
    }

    public Flight(String flightNumber, String origin, String destination,
                  String departureTime, String arrivalTime, Double fare, FlightStatus flightStatus) {
        this.flightNumber = flightNumber;
        this.origin = origin;
        this.destination = destination;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.fare = fare;
        this.flightStatus = (flightStatus != null) ? flightStatus : FlightStatus.SCHEDULED;
    }
}
