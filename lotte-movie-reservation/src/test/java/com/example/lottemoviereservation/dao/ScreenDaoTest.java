package com.example.lottemoviereservation.dao;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class ScreenDaoTest {

    @Test
    void getTheaterDetailList() {

        ScreenDao dao = ScreenDao.getInstance();
        dao.getTheaterDetailList("20100529");
    }
}