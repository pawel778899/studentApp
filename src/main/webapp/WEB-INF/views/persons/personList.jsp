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


                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Kursanci</h1>
                <p class="mb-4">Wszyscy kursanci biorący udział w szkoleniu - SDA | <a
                        target="_blank" href="https://datatables.net">official DataTables documentation</a>.</p>


                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">Tabela Kursantów</h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table action-panel table-bordered" id="dataTable" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>URL Git</th>
                                    <th>Od czego się zaczęło</th>
                                    <th>Umiejętności</th>
                                    <th>Akcja</th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Imię</th>
                                    <th>Nazwisko</th>
                                    <th>URL Git</th>
                                    <th>Od czego się zaczęło</th>
                                    <th>Umiejętności</th>
                                    <th>Akcja</th>
                                </tr>
                                </tfoot>
                                <tbody>
<c:forEach items="${student}" var="title">
                                <tr>
                                    <td>${title.firstName}</td>
                                    <td>${title.lastName}</td>
                                    <td><a href='<c:url value ="${title.gitHub}"/>' class="btn btn-info btn-circle">
                                        <i class="fas fa-info-circle"></i>
                                    </a></td>
                                    <td>${title.start}</td>
                                    <td><a href="#" role="button" class="btn btn-success btn-circle" data-toggle="modal"
                                           data-target="#umiejetnosci"><i class="fas
                                        fa-check"></i></a></td>

                                    <td><a href='<c:url value="/editStudent/${title.id}"/>'
                                           class="btn-right btn btn-primary" role="button">Edytuj</a>
                                    </td>
                                </tr>
</c:forEach>

                                <!-- The Modal -->
                                <div class="modal" id="umiejetnosci">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Imię Nazwisko</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;
                                                </button>
                                            </div>

                                            <!-- Modal body -->
                                            <div class="modal-body">


                                                <!-- Project Card Example -->
                                                <div class="card shadow mb-4">
                                                    <div class="card-header py-3">
                                                        <h6 class="m-0 font-weight-bold
              text-primary">Umiejętności</h6>
                                                    </div>
                                                    <div class="card-body">
                                                        <h4 class="small
              font-weight-bold">Java <span
                                                                class="float-right">50%</span></h4>
                                                        <div class="progress mb-4">
                                                            <div class="progress-bar bg-danger" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="20" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                        <h4 class="small
              font-weight-bold">Wzorce
                                                            projektowe
                                                            <span
                                                                    class="float-right">50%</span></h4>
                                                        <div class="progress mb-4">
                                                            <div class="progress-bar bg-warning" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="40" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                        <h4 class="small
              font-weight-bold">TDD <span
                                                                class="float-right">50%</span></h4>
                                                        <div class="progress mb-4">
                                                            <div class="progress-bar" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="60" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                        <h4 class="small
              font-weight-bold">Bazy danych SQL
                                                            <span class="float-right">50%</span></h4>
                                                        <div class="progress mb-4">
                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="80" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>

                                                        <h4 class="small
              font-weight-bold">Hibernate JPA
                                                            <span class="float-right">50%</span></h4>
                                                        <div class="progress">
                                                            <div class="progress-bar bg-success" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="100"
                                                                 aria-valuemin="0" aria-valuemax="100"></div>
                                                        </div>
                                                        <br>

                                                        <h4 class="small
              font-weight-bold">HTML, CSS
                                                            <span class="float-right">50%</span></h4>
                                                        <div class="progress mb-4">
                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="80" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                        <h4 class="small
              font-weight-bold">JSP
                                                            <span class="float-right">50%</span></h4>
                                                        <div class="progress mb-4">
                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="80" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                        <h4 class="small
              font-weight-bold">Thymeleaf
                                                            <span class="float-right">50%</span></h4>
                                                        <div class="progress mb-4">
                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="80" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>
                                                        <h4 class="small
              font-weight-bold">GIT
                                                            <span class="float-right">50%</span></h4>
                                                        <div class="progress mb-4">
                                                            <div class="progress-bar bg-info" role="progressbar"
                                                                 style="width: 50%" aria-valuenow="80" aria-valuemin="0"
                                                                 aria-valuemax="100"></div>
                                                        </div>

                                                    </div>
                                                </div>


                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <a href="#">
                                                    <input type="submit" class="btn
           btn-danger pull-left"
                                                           value="Poprawiam"/></a>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                </tbody>
                            </table>


                        </div>
                    </div>
                </div>


            </div>
            <!-- /.container-fluid -->

            <!-- /.container-fluid -->
            <div class="card-header py-3">


                <a href='<c:url value="/addStudent"/>' class="btn btn-info btn-icon-split">
                    <span class="icon text-white-50">
                      <i class="fas fa-info-circle"></i>
                    </span>
                    <span class="text">Dodaj nowego</span>
                </a>


            </div>


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
