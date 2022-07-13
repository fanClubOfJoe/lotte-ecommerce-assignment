/**
 *
 */

var id = document.getElementById('id');
var rememberID = document.getElementById('rememberID');

var key = getCookie("key");
id.value = key;

if(id.value != ""){
    rememberID.setAttribute("checked", true);
}

console.log(id.value);
console.log(rememberID.checked);

rememberID.onchange = function(){
    console.log("checkBox");
    console.log(id.value);
    console.log(rememberID.checked);
    if(rememberID.checked){
        setCookie("key", id.value, 7);
    }
    else{
        deleteCookie("key");
    }
}

id.onkeyup = function(){
    console.log("inputBox");
    console.log(id.value);
    console.log(rememberID.checked);
    if(rememberID.checked){
        setCookie("key", id.value, 7);
    }
}

function setCookie(cookieName, value, exdays) {
    console.log("setCookie");
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value)
        + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}

function deleteCookie(cookieName) {
    console.log("deleteCookie");
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires="
        + expireDate.toGMTString();
}

function getCookie(cookieName) {
    console.log("getCookie");
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if (start != -1) {
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if (end == -1)
            end = cookieData.length;
        console.log("end위치  : " + end);
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

function gotoAccount(){
    location.href = "account.html";
}
