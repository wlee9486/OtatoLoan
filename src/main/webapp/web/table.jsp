<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" type="text/css" href="<%=cp %>/web/css/table.css"/>
    <link rel="stylesheet" type="text/css" href="css/grid.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


    <title>테이블</title>
</head>
<body>


<body>

<jsp:include page="./header.jsp"/>

<div class="wrapper">
    <div class="container">
        <div class="item1">
            <div class="ctitle">타이틀</div>
            <div class="root"><a class="aline" href="<%=cp%>/web/main2.jsp"> HOME </a> > 타이틀 > 세부속성</div>
        </div>
        <hr class="hr-1">
        <div class="item2">
            <div class="csubtitle">
                <div class="content">
                    <section class="main-header grid">
                        <button class="button">
                            <i class="fa-solid fa-plus"></i>
                            <span>Add new user</span>
                        </button>
                    </section>
                </div>
            </div>


            <!-- 테이블 시작 -->

            <div class="item3">

                <main>


                    <section class="table-header grid">
                        <div>
                            <div class="select">
                                <select>
                                    <option>Choose action</option>
                                </select>
                            </div>
                            <span>Selected 4 of 123 items</span>
                        </div>

                        <a class="button link">
                            <span>Filters</span>
                            <i class="fa-solid fa-angle-down"></i>
                        </a>
                    </section>

                    <div class="card">
                        <table>
                            <thead>
                            <tr>
                                <th>
                                    <div class="test"></div>
                                    <div class="checkbox">
                                        <input type="checkbox" checked/>
                                        <span class="checkmark minus"></span>
                                    </div>
                                </th>
                                <th>ID</th>
                                <th>User</th>
                                <th>First name</th>
                                <th>Last name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Location</th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr class="selected">
                                <td>
                                    <div class="checkbox">
                                        <input type="checkbox" checked/>
                                        <span class="checkmark"></span>
                                    </div>
                                </td>
                                <td>1</td>
                                <td>sbardwell0</td>
                                <td>Sarajane</td>
                                <td>Bardwell</td>
                                <td>sbardwell0@freewebs.com</td>
                                <td>+62 347 385 6227</td>
                                <td>Pagedangan</td>
                            </tr>

                            <tr class="selected">
                                <td>
                                    <div class="checkbox">
                                        <input type="checkbox" checked/>
                                        <span class="checkmark"></span>
                                    </div>
                                </td>
                                <td>2</td>
                                <td>ptroctor1</td>
                                <td>Pearl</td>
                                <td>Troctor</td>
                                <td>ptroctor1@weebly.com</td>
                                <td>+62 731 635 4272</td>
                                <td>Labuhan Deli</td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="checkbox">
                                        <input type="checkbox"/>
                                        <span class="checkmark"></span>
                                    </div>
                                </td>
                                <td>3</td>
                                <td>rjone2</td>
                                <td>Rustie</td>
                                <td>Jone</td>
                                <td>rjone2@dailymail.co.uk</td>
                                <td>+7 722 827 4622</td>
                                <td>Safakulevo</td>
                            </tr>

                            <tr class="selected">
                                <td>
                                    <div class="checkbox">
                                        <input type="checkbox" checked/>
                                        <span class="checkmark"></span>
                                    </div>
                                </td>
                                <td>4</td>
                                <td>etunder3</td>
                                <td>Ebenezer</td>
                                <td>Tunder</td>
                                <td>etunder3@pinterest.com</td>
                                <td>+27 764 777 3195</td>
                                <td>Lebowakgomo</td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="checkbox">
                                        <input type="checkbox"/>
                                        <span class="checkmark"></span>
                                    </div>
                                </td>
                                <td>5</td>
                                <td>mgabbott4</td>
                                <td>Marwin</td>
                                <td>Gabbott</td>
                                <td>mgabbott4@webeden.co.uk</td>
                                <td>+504 759 679 5928</td>
                                <td>Corpus</td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="checkbox">
                                        <input type="checkbox"/>
                                        <span class="checkmark"></span>
                                    </div>
                                </td>
                                <td>6</td>
                                <td>nmyrtle5</td>
                                <td>Nissie</td>
                                <td>Myrtle</td>
                                <td>nmyrtle5@google.co.uk</td>
                                <td>+63 526 915 9064</td>
                                <td>Datagon</td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="checkbox">
                                        <input type="checkbox"/>
                                        <span class="checkmark"></span>
                                    </div>
                                </td>
                                <td>7</td>
                                <td>kcecchetelli6</td>
                                <td>Kyla</td>
                                <td>Cecchetelli</td>
                                <td>kcecchetelli6@issuu.com</td>
                                <td>+880 272 781 1696</td>
                                <td>Nabīnagar</td>
                            </tr>

                            <tr class="selected">
                                <td>
                                    <div class="checkbox">
                                        <input type="checkbox" checked/>
                                        <span class="checkmark"></span>
                                    </div>
                                </td>
                                <td>8</td>
                                <td>schevolleau7</td>
                                <td>Susanne</td>
                                <td>Chevolleau</td>
                                <td>schevolleau7@yahoo.co.jp</td>
                                <td>+62 100 130 4767</td>
                                <td>Dukuhbadag</td>
                            </tr>

                            <tr class="hover">
                                <td>
                                    <div class="checkbox">
                                        <input type="checkbox"/>
                                        <span class="checkmark"></span>
                                    </div>
                                </td>
                                <td>9</td>
                                <td>llomond8</td>
                                <td>Locke</td>
                                <td>Lomond</td>
                                <td>llomond8@addtoany.com</td>
                                <td>+358 827 247 5884</td>
                                <td>Orimattila</td>
                            </tr>

                            <tr>
                                <td>
                                    <div class="checkbox">
                                        <input type="checkbox"/>
                                        <span class="checkmark"></span>
                                    </div>
                                </td>
                                <td>10</td>
                                <td>lgronaller9</td>
                                <td>Lemmie</td>
                                <td>Gronaller</td>
                                <td>lgronaller9@prnewswire.com</td>
                                <td>+63 924 190 7074</td>
                                <td>Looc</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <section class="table-footer grid">
                        <span>Displaying 1-10 of 123 items</span>
                        <div class="paging grid">
        <span>
          Page
          <input type="number" value="1">
          of 13
        </span>
                            <div class="button icon">
                                <i class="fa-solid fa-angle-left"></i>
                            </div>
                            <div class="button icon">
                                <i class="fa-solid fa-angle-right"></i>
                            </div>
                        </div>
                    </section>


            </div>
            </main>

        </div>
    </div>
</div>

<!-- 테이블 끝 -->


<jsp:include page="./footer3.jsp"/>

</footer>
</body>
</html>