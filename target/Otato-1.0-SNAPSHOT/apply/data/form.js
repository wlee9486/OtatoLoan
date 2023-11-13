function addToAmount(value) {
    var f = document.myForm;
    var currentAmount = parseInt(f.amount.value) || 0;
    var newAmount = currentAmount + value;

    if (value == -1) {
        f.amount.value = "";
        return;
    }
    f.amount.value = newAmount;
}

function addToDuration(value) {
    var f = document.myForm;
    var current = parseInt(f.duration.value) || 0;
    var newDuration = current + value;

    if (value == -1) {
        f.duration.value = "";
        return;
    }
    f.duration.value = newDuration;
}


function sendIt() {
    var f = document.myForm;
    var flag = false;

    for (var i = 0; i < f.repay.length; i++) {
        if (f.repay[i].checked) {
            flag = true;
            break;
        }
    }

    if (!flag) {
        alert('상환 방식 선택');
        return;
    }

    if (!f.amount.value) {
        alert("금액 입력 필요");
        f.amount.focus();
        return;
    }

    var minA = parseInt('${productDTO.minAmount}') * 10000;
    var maxA = parseInt('${productDTO.maxAmount}') * 10000;
    if (f.amount.value < minA || f.amount.value > maxA) {
        alert('금액 재입력');
        return;
    }


    if (!f.duration.value) {
        alert("기한 입력 필요");
        f.duration.focus();
        return;
    }


    var minP = parseInt('${productDTO.minPeriod}');
    var maxP = parseInt('${productDTO.maxPeriod}');

    if (f.duration.value < minP || f.duration.value > maxP) {
        alert('상황 기간 재입력');
        return;
    }


    f.action = "../contract/write.do";
    f.submit();

}