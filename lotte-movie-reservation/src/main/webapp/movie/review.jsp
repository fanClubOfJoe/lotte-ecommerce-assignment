<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    let movieNo = '${movieDto.movieNo}';

    let isLogin = '${isLogin}';

    let userNo = '';

    if (isLogin) {
        userNo = '${userNo}';
    }

    let reviewListSize = 1;

    $('[name=insertReviewBtn]').click(function () {
        var insertData = $('[name=insertReviewForm]').serialize();
        if (isLogin == 'false') {
            console.log(isLogin);
            alert("로그인 후 작성가능합니다!");
        } else {
            insertReview(insertData);
        }
    });


    function listReview(movieNo, page) {
        $.ajax({
            url: '<%=request.getContextPath()%>/review?param=movielist&movieno=' + movieNo + '&page=' + page,
            type: 'get',
            data: {},
            success: function (data) {

                let reviewList = data.reviewList;
                console.log(reviewList);
                let userNameList = data.userNameList;
                let reivewCount = data.reviewCount;
                let a = '';

                console.log(data);
                var i = 0;
                $.each(reviewList, function (key, value) {


                    a += '<div class="reviewArea" style="background-color:#f8f8f8; padding:10px; margin-bottom: 15px; line-height: 2.2;">';
                    a += '<input type="hidden" name="review_no_' + value.reviewNo + '" value="' + value.reviewNo + '"/>'
                    a += '<input type="hidden" name="user_no_' + value.userNo + '" value="' + value.userNo + '"/>'
                    // a += '<div style="display: flex;"> ';
                    // a += '<img alt="" src="../image/profile.png" style="width:35px; height: auto;">'
                    a += '<div class="reviewContentContainer">'
                    a += '<div style="display: flex;"> ';
                    a += '<img alt="" src="../image/profile.png" style="width:35px; height: auto; margin-right: 10px;"><div class="reviewInfo" style="margin-right:15px;">' + userNameList[i].userName + '</div>';

                    a += '<div class="reviewStarContainer">';
                    a += '<div class="star">';
                    for (var k = 0; k < value.reviewRate; k++) {
                        a += '&#9733;';
                    }
                    a += '</div>';
                    a += '<div class="nonStar">';
                    for (var k = 0; k < 5 - value.reviewRate; k++) {
                        a += '&#9733;';
                    }
                    a += '</div>';
                    a += '<div>&nbsp;' + value.reviewRate + '</div></div></div>';
                    a += '<div>';
                    if (userNo == value.userNo) {
                        a += '<btn class="btn btnDefault" onclick="updateReview(' + value.reviewNo + ',\'' + value.reviewContent + '\');"> 수정</btn>|';
                        a += '<btn class="btn btnDefault"  onclick="deleteReview(' + value.reviewNo + ');"> 삭제 </btn>';
                    }
                    a += '</div></div>';
                    // a += '<div class="reviewRate">' + value.reviewRate + '</div>';

                    a += '<div class="reviewContent' + value.reviewNo + '" style="margin-top:10px; margin-left: 45px;">' + value.reviewContent + '</div>';

                    a += '</div>';
                    i++;
                    // a += '</div>';
                });

                //총 count 수 넘으면 더보기 버튼 안보이게 처리 필요
                if (reivewCount > reviewList.length) {
                    a += '<div><a class="btn btnMore" href="#" onclick="listReview(' + movieNo + ', ' + ++reviewListSize + '); return false;">더보기 ⌄ </a></div>';
                }

                $(".listReview").html(a);

            }
        });
    }

    function insertReview(insertData) {
        if (!$('[name=reviewContent]').val()) {
            alert("내용을 입력하세요!");
        } else {
            console.log("insertData : ", insertData);
            $.ajax({
                url: '<%=request.getContextPath()%>/review?param=insert&movieno=' + movieNo,
                type: 'post',
                data: insertData,
                success: function (data) {
                    alert("리뷰 등록 완료");
                    console.log(insertData);
                    console.log(data);
                    $('[name=reviewContent]').val('');
                    listReview(movieNo, 1);
                    location.reload();
                }
            });
        }
    }


    function updateReview(reviewNo, reviewContent) {
        console.log("updateReview");
        let a = '';

        a += '<div class="input-group">';
        a += '<input type="text" class="form-control" name="content_' + reviewNo + '" value="' + reviewContent + '"/>';
        a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="updateReviewProc(' + reviewNo + ');">수정</button> </span>';
        a += '</div>';

        $('.reviewContent' + reviewNo).html(a);

    }

    //리뷰 수정
    function updateReviewProc(reviewNo) {
        let updateContent = $('[name=content_' + reviewNo + ']').val();

        console.log("updateReviewProc");
        console.log(updateContent);

        if (!updateContent) {
            alert("내용을 입력하세요!");
        } else {
            $.ajax({
                url: '<%=request.getContextPath()%>/review?param=update&reviewno=' + reviewNo,
                type: 'post',
                data: {'updateContent': updateContent},
                success: function (data) {
                    console.log(updateContent);
                    alert('리뷰 수정 완료');
                    listReview(movieNo, 1); //리뷰 수정 후 목록 출력
                }
            });
        }
    }

    //리뷰 삭제
    function deleteReview(reviewNo) {
        $.ajax({
            url: '<%=request.getContextPath()%>/review?param=delete&reviewno=' + reviewNo,
            type: 'get',
            data: {},
            success: function (data) {
                alert('리뷰 삭제');
                location.reload();
                listReview(movieNo, 1);
            }
        });
    }

    $(document).ready(function () {
        listReview(movieNo, reviewListSize);
    });
</script>