package com.example.lottemoviereservation.dao;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MovieDaoTest {

    @Test
    void getMovieByMovieNo() {
        MovieDao dao = MovieDao.getInstance();
        dao.getMovieByMovieNo(1);
    }
}