<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    let userNo = '${userDto.userNo}';
    let reviewListSize = 1;

    // 리뷰 목록 출력
    function listReview(userNo, page) {
        $.ajax({
            url: '<%=request.getContextPath()%>/review?param=userlist&userno=' + userNo + '&page=' + page,
            type: 'get',
            data: {},
            success: function (data) {

                let reviewList = data.reviewList;
                let movieTitleList = data.movieTitleList;
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
                $.each(reviewList, function (key, value) {


                    a += '<div class="reviewArea" style="background-color:#f8f8f8; padding:10px; margin-bottom: 15px; line-height: 2.2;">';
                    a += '<input type="hidden" name="review_no_' + value.reviewNo + '" value="' + value.reviewNo + '"/>'
                    a += '<input type="hidden" name="user_no_' + value.userNo + '" value="' + value.userNo + '"/>'

                    a += '<div class="reviewContentContainer">'
                    a += '<div style="display: flex;"> ';
                    a += '<img alt="" src="../image/profile.png" style="width:35px; height: auto; margin-right: 10px;"><div class="reviewInfo" style="margin-right:15px;">' + movieTitleList[i].movieTitle + '</div>';

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

                //총 count 수 넘으면 더보기 버튼 안보이게 처리 필요
                if (reivewCount > reviewList.length) {
                    a += '<div><a class="btn btnMore" href="#" onclick="listReview(' + userNo + ', ' + ++reviewListSize + '); return false;">더보기 ⌄ </a></div>';
                }

                $(".listReview").html(a);

            }
        });
    }

    // 리뷰 update 뷰 변경
    function updateReview(reviewNo, reviewContent) {
        console.log("updateReview");
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
                    listReview(userNo, 1); //리뷰 수정 후 목록 출력
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
                listReview(userNo, 1);
            }
        });
    }

    // 로딩 시 첫 리뷰 목록 출력부
    $(document).ready(function () {
        listReview(userNo, reviewListSize);
    });
</script>