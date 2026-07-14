package com.genc.arfoms.checkin.service;

import com.genc.arfoms.checkin.dto.BoardingPassView;
import com.genc.arfoms.checkin.dto.BookingLookupResult;
import com.genc.arfoms.checkin.dto.CheckInDetailsView;
import com.genc.arfoms.checkin.model.CheckIn;

import java.util.List;

public interface CheckInService {

    BookingLookupResult lookupBooking(Long bookingId);

    CheckIn checkInPassenger(CheckIn checkIn);

    CheckIn boardPassenger(Long checkInId);

    BoardingPassView issueBoardingPass(Long checkInId);

    CheckIn tagBaggage(Long checkInId, int bagCount);

    CheckIn getCheckIn(Long checkInId);

    List<CheckIn> getAll();

    List<CheckInDetailsView> getAllDetails();
}
