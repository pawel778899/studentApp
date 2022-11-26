<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@include file="../dynamic/css.jspf" %>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <%@include file="../dynamic/navigationMain.jspf" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                             aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                           placeholder="Search for..." aria-label="Search"
                                           aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>


                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">Imię nazwisko</span>

                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>

                </ul>

            </nav>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">


                <div class="col-lg-12">
                    <a href='<c:url value="/addTask"/>' class="btn btn-warning btn-block"
                       style="margin-bottom: 25px;"><i
                            class="fas fa-exclamation-triangle"></i><strong> Dodaj
                        taska</strong></a>
                </div>


                <div class="col-lg-12">
                    <div class="row">

                        <div class="col-lg-2">
                            <div class="card bg-success text-white shadow">
                                <div class="card-body">
                                    <strong>Nowiciusz</strong>
                                    <div class="text-white-10 small">poziom junior</div>
                                </div>
                            </div>


                            <div class="card bg-info text-white shadow">
                                <div class="card-body">
                                    <strong>Dojrzewajacy</strong>
                                    <div class="text-white-10 small">poziom junior+</div>
                                </div>
                            </div>


                            <div class="card bg-secondary text-white shadow">
                                <div class="card-body">
                                    <strong>Wie co robi</strong>
                                    <div class="text-white-10 small">poziom mid</div>
                                </div>
                            </div>


                            <div class="card bg-primary text-white shadow">
                                <div class="card-body">
                                    <strong>Doświadczony</strong>
                                    <div class="text-white-10 small">poziom mid+</div>
                                </div>
                            </div>


                            <div class="card bg-danger text-white shadow">
                                <div class="card-body">
                                    <strong>Wyjadacz</strong>
                                    <div class="text-white-10 small">poziom senior</div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-10">
                            <c:forEach items="${items}" var="item">
                                <div class="card mb-4 py-3 border-left-${item.color}">
                                    <div class="card-body">
                                        <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">${item.student.firstName} ${item.student.lastName}
                                            | <strong>Dodano:</strong> <fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.creationDate}"/> | <strong>Deadline:</strong>
                                            <fmt:formatDate pattern = "yyyy-MM-dd" value = "${item.deadline}"/>
                                        </div>
                                       ${item.description}
                                    </div>
                                </div>
                            </c:forEach>


                        </div>


                    </div>


                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <%@include file="../dynamic/footer.jspf" %>
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <%@include file="../dynamic/board.jspf" %>
    <%@include file="../dynamic/javaScript.jspf" %>


</body>

</html>
