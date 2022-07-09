package com.example.lottemoviereservation.util;

public class CalendarUtil {
    public static boolean nvl(String msg) {
        return msg == null || msg.trim().equals("") ? true : false;
    }
    public static String two(String msg) {
        return msg.trim().length() < 2 ? "0"+msg.trim() : msg;
    }
    // 일 별 일정
    public static String callist(int year, int month, int day) {
        return String.format("&nbsp<a href='callist.jsp?year=%d&month=%d&day=%d'>%2d</a>", year, month, day, day);
    }
    public static String dot3(String msg) {
        String str = "";
        if(msg.length() >= 10) {
            str = msg.substring(0, 10)+"...";
        }
        else {
            str = msg;
        }
        return str;
    }
}

