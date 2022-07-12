package com.example.lottemoviereservation.dao;

import com.example.lottemoviereservation.dto.ReserveDto;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class ReserveDaoTest {

    @Test
    void getRemainSeats() {
        ReserveDao dao = ReserveDao.getInstance();
        boolean result = dao.getRemainSeats(new ReserveDto(1, 1, "09:00", 6));
        assertEquals(result, false);
    }

    @Test
    void setReserve() {
        ReserveDao dao = ReserveDao.getInstance();
        boolean result = dao.setReserve(new ReserveDto(1, 1, "0900", 6));
        assertEquals(result, false);
        result = dao.setReserve(new ReserveDto(1, 1, "0900", 5));
        assertEquals(result, true);
    }

//    @Test
//    void deleteReserveDtoByReserveNo() {
//        ReserveDao dao = ReserveDao.getInstance();
//        boolean result = dao.deleteReserveDtoByReserveNo(new ReserveDto(1, 1, 1, "09:00", 1));
//        assertEquals(result, false);
//    }

    @Test
    void getReserveDtoByUserNo() {
        ReserveDao dao = ReserveDao.getInstance();
        List<ReserveDto> list = dao.getReserveDtoByUserNo(1);
        for(ReserveDto dto : list)
            System.out.println(dto);
    }
}