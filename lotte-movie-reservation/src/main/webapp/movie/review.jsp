<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    let movieNo = '${movieDto.movieNo}';
    let isLogin = '${isLogin}';
    let reviewListSize = 1;

    let userNo = '';
    if (isLogin) {
        userNo = '${userNo}';

    }

    // 리뷰 작성 버튼 클릭시, validation 후 리뷰 insertReview로 이동
    $('[name=insertReviewBtn]').click(function () {
        var insertData = $('[name=insertReviewForm]').serialize();
        if (isLogin == 'false') {
            alert("로그인 후 작성 가능합니다!");
        } else {
            let validation = validateReservation(movieNo, userNo);
            if (!validation) {
                alert("영화 관람 후 작성 가능합니다!");
                return;
            }

            let isAlreadyReviewed = isAlreadyReview(movieNo, userNo);
            if (isAlreadyReviewed) {
                alert("이미 리뷰를 작성한 영화입니다!");
                return;
            }
            insertReview(insertData);
        }
    });

    // 리뷰 목록 출력
    function listReview(movieNo, page) {
        $.ajax({
            url: '<%=request.getContextPath()%>/review?param=movielist&movieno=' + movieNo + '&page=' + page,
            type: 'get',
            data: {},
            success: function (data) {

                let reviewList = data.reviewList;
                let userNameList = data.userNameList;
                let reivewCount = data.reviewCount;
                let a = '';

                // Object가 빈 Object인지 확인
                function isEmptyObject(obj) {
                    return !obj || obj == null || obj == 'undefined' || !Object.keys(obj).length;
                }

                if (isEmptyObject(reviewList)) {
                    // reviewList empty
                    return;
                }

                var i = 0;
                // 리뷰 목록 동적 생성
                $.each(reviewList, function (key, value) {

                    a += '<div class="reviewArea" style="background-color:#f8f8f8; padding:10px; margin-bottom: 15px; line-height: 2.2;">';
                    a += '<input type="hidden" name="review_no_' + value.reviewNo + '" value="' + value.reviewNo + '"/>'
                    a += '<input type="hidden" name="user_no_' + value.userNo + '" value="' + value.userNo + '"/>'
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

                    a += '<div class="reviewContent' + value.reviewNo + '" style="margin-top:10px; margin-left: 45px;">' + value.reviewContent + '</div>';

                    a += '</div>';

                    i++;
                });

                //총 count 수 넘으면 더보기 버튼 안보이게 처리
                if (reivewCount > Object.keys(reviewList).length) {
                    a += '<div><a class="btn btnMore" href="#" onclick="listReview(' + movieNo + ', ' + ++reviewListSize + '); return false;">더보기 ⌄ </a></div>';
                }

                $(".listReview").html(a);

            }
        });
    }

    // 리뷰 insert (ajax)
    function insertReview(insertData) {
        if (!$('[name=reviewContent]').val()) {
            alert("내용을 입력하세요!");
        } else {
            $.ajax({
                url: '<%=request.getContextPath()%>/review?param=insert&movieno=' + movieNo,
                type: 'post',
                data: insertData,
                success: function (data) {
                    alert("리뷰 등록 완료");
                    $('[name=reviewContent]').val('');
                    listReview(movieNo, 1);
                    location.reload();
                }
            });
        }
    }

    // 예매한 영화만 리뷰 작성 가능-validate 함수
    function validateReservation(movieNo, userNo) {
        let validation;
        $.ajax({
            url: '<%=request.getContextPath()%>/review?param=validreview',
            type: 'post',
            async: false,
            data: {'movieno': movieNo, 'userno': userNo},
            success: function (data) {
                validation = data.validation;
            }
        });
        return validation;
    }

    // 이미 작성한 적 있는 영화 리뷰인지 조회
    function isAlreadyReview(movieNo, userNo) {
        let isAlreadyReviewed;
        $.ajax({
            url: '<%=request.getContextPath()%>/review?param=isalreadyreview',
            type: 'post',
            async: false,
            data: {'movieno': movieNo, 'userno': userNo},
            success: function (data) {
                isAlreadyReviewed = data.isAlreadyReviewed;
            }
        });
        return isAlreadyReviewed;
    }

    // 리뷰 update 뷰 변경
    function updateReview(reviewNo, reviewContent) {
        let a = '';

        a += '<div class="input-group">';
        a += '<input type="text" class="form-control" name="content_' + reviewNo + '" value="' + reviewContent + '"/>';
        a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="updateReviewProc(' + reviewNo + ');">수정</button> </span>';
        a += '</div>';

        $('.reviewContent' + reviewNo).html(a);

    }

    // 리뷰 update (ajax)
    function updateReviewProc(reviewNo) {
        let updateContent = $('[name=content_' + reviewNo + ']').val();

        if (!updateContent) {
            alert("내용을 입력하세요!");
        } else {
            $.ajax({
                url: '<%=request.getContextPath()%>/review?param=update&reviewno=' + reviewNo,
                type: 'post',
                data: {'updateContent': updateContent},
                success: function (data) {
                    alert('리뷰 수정 완료');
                    listReview(movieNo, 1); //리뷰 수정 후 목록 출력
                }
            });
        }
    }

    // 리뷰 delete (ajax)
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

    // 로딩 시 첫 리뷰 목록 출력부
    $(document).ready(function () {
        listReview(movieNo, reviewListSize);
    });
</script>