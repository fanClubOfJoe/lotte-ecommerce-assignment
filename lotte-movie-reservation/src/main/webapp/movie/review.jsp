<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">

    let movieNo = '${movieDto.movieNo}';
    let reviewListSize = 1;

    $('[name=insertReviewBtn]').click(function () {
        var insertData = $('[name=insertReviewForm]').serialize();
        insertReview(insertData);
    });


    function listReview(movieNo, page) {
        $.ajax({
            url: '<%=request.getContextPath()%>/review?param=list&movieno='+movieNo +'&page='+page,
            type: 'get',
            data: {},
            success: function (data) {

                let reviewList = data.list;
                let a = '';

                console.log(data);
                $.each(reviewList, function (key, value) {

                    a += '<div class="reviewArea" style="border:0.5px dashed darkgray; padding:10px; margin-bottom: 15px; background-color: white; line-height: 2.2;">';
                    a += '<input type="hidden" name="review_no_' + value.reviewNo + '" value="' + value.reviewNo + '"/>'
                    a += '<input type="hidden" name="user_no_' + value.userNo + '" value="' + value.userNo + '"/>'
                    a += '<div class="reviewInfo>"' + '작성자 :  ' + value.userName;
                    a += '<div class="reviewContent">' + value.reviewContent;
                    a += '<div class="reviewRate">' + value.reviewRate;
                    // if (data.now_userName == value.userName) {
                    //     a += '<br><a class="btn-default" onclick="updateReview(' + value.reviewNo + ',\'' + value.reviewContent + '\');"> 수정 </a>';
                    //     a += '<a class="btn-default"  onclick="deleteReview(' + value.reviewNo + ');"> 삭제 </a>';
                    // }
                    a += '</div></div></div>';
                });

                //if() 총 count 수 넘으면 더보기 버튼 안보이게 처리 필요
                a += '<a class="button" href="#" onclick="listReview(' + movieNo + ', ' + ++reviewListSize + '); return false;">더보기</a>';

                $(".listReview").html(a);

            }
        });
    }

    /*
    function insertReview(insertData) {
        if (!$('[name=reviewContent]').val()) {
            alert("내용을 입력하세요!");
        } else {
            console.log("insertData : ", insertData);
            $.ajax({
                url: '/review/insert',
                type: 'post',
                data: insertData,
                success: function (data) {
                    alert("리뷰 등록 완료");
                    console.log(insertData);
                    $('[name=reviewContent]').val('');
                    listReview();
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

        if (!updateContent) {
            alert("내용을 입력하세요!");
        } else {
            $.ajax({
                url: '/review/update',
                type: 'post',
                data: {'reviewContent': updateContent, 'reviewNo': reviewNo},
                success: function (data) {
                    alert('리뷰 수정 완료');
                    listReview(movieNo); //리뷰 수정 후 목록 출력
                }
            });
        }
    }

    //리뷰 삭제
    function deleteReview(reviewNo) {
        $.ajax({
            url: '/review/delete/',
            type: 'post',
            data: {'reviewNo': reviewNo},
            success: function (data) {
                alert('리뷰 삭제');
                location.reload();
                listReview(movieNo);
            }
        });
    }*/

    $(document).ready(function () {
        listReview(movieNo, reviewListSize);
    });
</script>