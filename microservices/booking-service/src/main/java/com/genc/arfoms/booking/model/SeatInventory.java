package com.genc.arfoms.booking.model;

import com.genc.arfoms.booking.model.SeatStatus;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "seat_inventory")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SeatInventory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "flight_id", nullable = false)
    private Integer flightId;

    @Transient
    private Flight flight;

    @Column(name = "seat_number", length = 10, nullable = false)
    private String seatNumber;

    @Column(name = "column_letter", length = 5, nullable = false)
    private String columnLetter;

    @Column(name = "seat_row", nullable = false)
    private Integer seatRow;

    @Enumerated(EnumType.STRING)
    @Column(name = "seat_status", length = 20, nullable = false)
    private SeatStatus seatStatus = SeatStatus.AVAILABLE;

    @Version
    @Column(name = "version", nullable = false)
    private Long version;

    public void setFlight(Flight flight) {
        this.flight = flight;
        if (flight != null && flight.getFlightId() != null) {
            this.flightId = flight.getFlightId().intValue();
        }
    }
}
