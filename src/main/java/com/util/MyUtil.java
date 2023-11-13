package com.util;

public class MyUtil {

    //전체 페이지 수 구하기
    public int getPageCount(int numPerPage, int dataCount) {

        int pageCount = 0;
        pageCount = dataCount / numPerPage;

        if(dataCount % numPerPage != 0)
            pageCount++;

        return pageCount;
    }



    //페이지 처리 메소드
    public String pageIndexList(int currentPage, int totalPage, String listUrl) {

        int numPerBlock = 5;
        int currentPageSetup; //이전페이지(=표시할 첫 페이지 -1)
        int page;//for문의 i역할

        StringBuffer sb = new StringBuffer();

        if(currentPage==0 || totalPage==0) {
            return "";
        }

        //
        if(listUrl.indexOf("?")!=-1) {
            listUrl += "&";
        }else {
            listUrl += "?";
        }

        // 6 7 8 9 10
        currentPageSetup = (currentPage/numPerBlock)*numPerBlock;

        if(currentPage % numPerBlock ==0) {
            currentPageSetup = currentPageSetup-numPerBlock;
        }

        // <이전
        if(totalPage > numPerBlock && currentPageSetup > 0) {

            //<a href="list.jsp?pageNum=5">◀이전</a>&nbsp;
            sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">◀이전</a>&nbsp;");

        }

        //바로가기 페이지
        page = currentPageSetup + 1;

        while(page <= totalPage && page <= (currentPageSetup+numPerBlock)) {
            if(page==currentPage) {
                sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
            }else {
                sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
            }

            page++;
        }

        // 다음>
        if(totalPage - currentPageSetup > numPerBlock) {

            sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">다음▶</a>&nbsp;");

        }
        return sb.toString();
    }




}
