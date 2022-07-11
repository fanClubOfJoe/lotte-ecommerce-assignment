<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <style>
        .footer {
            background-color: #000000;
            padding: 50px 0 0 0;
            color: #ffffff;
            margin-top: 100px;
        }
        .footer .grid2 {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 20px;
        }
        .footer p {
            color: #fff;
            margin: 20px 0;
        }
        .footer .socialIcon i {
            background: transparent;
            margin-right: 20px;
            font-size: 20px;
        }
        .footer h2 {
            margin-bottom: 30px;
            font-size: 20px;
        }
        .footer .box p {
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .footer .boxLeft {
            grid-column: 1/2;
            padding-left: 70px;
        }
        .footer .boxRight {
            grid-column: 2/3;
        }
        .footer span {
            color: #386ad1;
            opacity: 1;
        }
        .footer .icon {
            margin-top: 20px;
            display: flex;
        }
        .footer .icon i {
            color: #386ad1;
            margin-right: 20px;
            width: 20px;
            height: 20px;
        }
        .legalBox {
            border-top: 1px solid rgba(255, 255, 255, 0.5);
            margin: 50px;
            height: 60px;
        }
        .legal{
            width: 250px;
            margin: 20px auto;
        }
    </style>

</head>
<body>

<div class="footer">
    <div class="container grid2">
        <div class="boxLeft">
            <div class="companyInfo">
                <p>
                    <h2>Company Information</h2>
                    회사명 : Lotte cgv<br>
                    대표 : 신은총<br>
                    개인정보관리 책임자 : 김은진 (info@lotte.com)<br>
                    사업자 등록번호 : 123-04-56789<br>
                </p>
            </div>
            <div class="socialIcon">
                <i class="fab fa-facebook-f "></i>
                <i class="fab fa-instagram "></i>
                <i class="fab fa-twitter "></i>
                <i class="fab fa-youtube "></i>
            </div>
        </div>

        <div class="boxRight">
            <h2>Contact Us</h2>

            <div class="icon">
                <i class="fa fa-map-marker"></i>
                <label htmlFor="">Location: 서울 송파구 올림픽로 300</label>
            </div>
            <div class="icon">
                <i class="fa fa-phone"></i>
                <label htmlFor="">Phone: +82 2 1111 1111</label>
            </div>
            <div class="icon">
                <i class="fa fa-envelope"></i>
                <label htmlFor="">Email: support@lotte.com</label>
            </div>
        </div>
    </div>
    <div class="legalBox">
        <div class="legal">
           @ 2022 Copyright: fanClubOfJoe
        </div>
    </div>
</div>

</body>
</html>
