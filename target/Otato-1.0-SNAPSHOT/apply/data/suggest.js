function fOpen(n) {
    window.name = "mainWin";
    var width = 850;
    var height = 600;

    var left = (window.innerWidth - width) / 2;
    var top = (window.innerHeight - height) / 2;

    window.open("../product/details.do?pNum=" + n, "subWin", "width=" + width + ", height=" + height + ", left=" + left + ", top=" + top +
        ", menubar=no, toolbar=no, scrollbars=no, resizable=no");

}

function showDiv() {
    var listsDiv = document.getElementById('lists');
    var allBtn = document.getElementById('allBtn');
    var moreBtn = document.getElementById('moreBtn');

    listsDiv.style.display = "block";
    allBtn.style.display = 'none';
    moreBtn.style.display = 'inline';

    var totList = document.getElementsByName('totListItem');
    var count = 0;
    var displayCount = 5;


    function showMore() {
        for (var i = count; i < count + displayCount && i < totList.length; i++) {
            totList[i].style.display = 'block';
        }
        count += displayCount;

        if (count >= totList.length) {
            moreBtn.style.display = 'none';
        }
    }

    showMore();

    moreBtn.addEventListener('click', showMore);
}

function send() {

    var f = document.myForm;
    var suggestionSelected = false;
    var listSelected = false;

    var suggestionRadios = document.getElementsByName('suggestionProduct');

    for (var i = 0; i < suggestionRadios.length; i++) {
        if (suggestionRadios[i].checked) {
            suggestionSelected = true;
            break;
        }
    }

    var listRadios = document.getElementsByName('listProduct');
    for (var i = 0; i < listRadios.length; i++) {
        if (listRadios[i].checked) {
            listSelected = true;
            break;
        }
    }

    if (!suggestionSelected && !listSelected) {
        alert('상품을 선택해주세요');
        return;
    }

    if (suggestionSelected && listSelected) {
        alert('하나의 상품만 선택해주세요');
        for (var i = 0; i < suggestionRadios.length; i++) {
            suggestionRadios[i].checked = false;
        }
        for (var i = 0; i < listRadios.length; i++) {
            listRadios[i].checked = false;
        }
        return;
    }

    f.action = "../application/form.do";
    f.submit();
}

// function openCalculatorModal() {
//     $('#calculatorModal').modal('show');
// }


