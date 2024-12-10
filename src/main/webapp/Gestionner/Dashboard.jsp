
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <title>Task flo </title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/brands.min.css"
          integrity="sha512-9YHSK59/rjvhtDcY/b+4rdnl0V4LPDWdkKceBl8ZLF5TB6745ml1AfluEU6dFWqwDw9lPvnauxFgpKvJqp7jiQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css"   href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css"  href="plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" type="text/css"  href="plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" type="text/css"  href="css/style1.css">
    <link rel="stylesheet" type="text/css" href="css/style_acceuil.css">
    <link rel="stylesheet" type="text/css"  href="css/select2.min.css" />
    <link rel="icon" type="image/png" href="images/logo1.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>




    <script>
        $(document).ready(function() {
            $('#example').DataTable({
                "language": {
                    "sEmptyTable":     "No data available in the table",
                    "sInfo":           "Showing _START_ to _END_ of _TOTAL_ entries",
                    "sInfoEmpty":      "Showing 0 to 0 of 0 entries",
                    "sInfoFiltered":   "(filtered from _MAX_ total entries)",
                    "sInfoPostFix":    "",
                    "sInfoThousands":  ",",
                    "sLengthMenu":     "Show _MENU_ entries",
                    "sLoadingRecords": "Loading...",
                    "sProcessing":     "Processing...",
                    "sSearch":         "Search:",
                    "sZeroRecords":    "No matching records found",
                    "oPaginate": {
                        "sFirst":    "First",
                        "sLast":     "Last",
                        "sNext":     "Next",
                        "sPrevious": "Previous"
                    },
                    "oAria": {
                        "sSortAscending":  ": activate to sort column ascending",
                        "sSortDescending": ": activate to sort column descending"
                    }
                }
            });
        });
    </script>

    <style>
        #example thead th {
            text-align: center;
        }
    </style>



    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <style>


        .v:hover{
            background-color: transparent;
        }
    </style>
</head>

<body>
<script>
    $(function () {
        $('.datepicker').datepicker({
            language: "es",
            autoclose: true,
            format: "dd/mm/yyyy"
        });
    });

</script>
<div class="header">

    <div class="header-left" >


        <a class="v" >
            <img src="images/logo1.png"  style="height: 100%;">
        </a>
<%--
        <a href="javascript:void(0);" id="toggle_btn">
                    <span class="bar-icon">
                        <span></span>
                        <span></span>
                        <span></span>
                    </span>
        </a>--%>
    </div>




    <%--   <div class="top-nav-search">
           <form>
               <input type="text" class="form-control" placeholder="">
               <button class="btn" type="submit"><i class="fas fa-search"></i></button>
           </form>
       </div>--%>


    <a class="mobile_btn" id="mobile_btn">
        <i class="fas fa-bars"></i>
    </a>


    <ul class="nav user-menu">

        <li class="nav-item dropdown">
            <a href="#" class="dropdown-toggle nav-link pr-0" data-toggle="dropdown">
                <i data-feather="bell"></i> <span class="badge badge-pill"></span>
            </a>
            <div class="dropdown-menu notifications">
                <div class="topnav-dropdown-header">
                    <span class="notification-title">Notifications</span>
                    <a href="javascript:void(0)" class="clear-noti"> Clear All</a>
                </div>
                <div class="noti-content">
                    <ul class="notification-list">
                        <li class="notification-message">
                            <a href="#">
                                <div class="media">
                                            <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt=""
                                                     src="img/avatar-02.jpg">
                                            </span>
                                    <div class="media-body">
                                        <p class="noti-details"><span class="noti-title">Brian Johnson</span>
                                            paid the invoice <span class="noti-title">#DF65485</span></p>
                                        <p class="noti-time"><span class="notification-time">4 mins ago</span>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="notification-message">
                            <a href="#">
                                <div class="media">
                                            <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt=""
                                                     src="img/avatar-03.jpg">
                                            </span>
                                    <div class="media-body">
                                        <p class="noti-details"><span class="noti-title">Marie Canales</span>
                                            has accepted your estimate <span
                                                    class="noti-title">#GTR458789</span></p>
                                        <p class="noti-time"><span class="notification-time">6 mins ago</span>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="notification-message">
                            <a href="#">
                                <div class="media">
                                    <div class="avatar avatar-sm">
                                                <span class="avatar-title rounded-circle bg-primary-light"><i
                                                        class="far fa-user"></i></span>
                                    </div>
                                    <div class="media-body">
                                        <p class="noti-details"><span class="noti-title">New user
                                                        registered</span></p>
                                        <p class="noti-time"><span class="notification-time">8 mins ago</span>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="notification-message">
                            <a href="#">
                                <div class="media">
                                            <span class="avatar avatar-sm">
                                                <img class="avatar-img rounded-circle" alt=""
                                                     src="img/avatar-04.jpg">
                                            </span>
                                    <div class="media-body">
                                        <p class="noti-details"><span class="noti-title">Barbara Moore</span>
                                            declined the invoice <span class="noti-title">#RDW026896</span></p>
                                        <p class="noti-time"><span class="notification-time">12 mins
                                                        ago</span></p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="notification-message">
                            <a href="#">
                                <div class="media">
                                    <div class="avatar avatar-sm">
                                                <span class="avatar-title rounded-circle bg-info-light"><i
                                                        class="far fa-comment"></i></span>
                                    </div>
                                    <div class="media-body">
                                        <p class="noti-details"><span class="noti-title">You have received a
                                                        new message</span></p>
                                        <p class="noti-time"><span class="notification-time">2 days ago</span>
                                        </p>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="topnav-dropdown-footer">
                    <a href="#">View all Notifications</a>
                </div>
            </div>
        </li>


        <li class="nav-item dropdown has-arrow main-drop">
            <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">



                          <span class="user-img">
                             <img src="https://ui-avatars.com/api/?name=${nomuserconnecter.lastname}"
                                  alt="" style="width: 40px;height: 40px;">
                             <span class="status online"></span>
                         </span>
                ${nomuserconnecter.lastname}
            </a>
            <div class="dropdown-menu">
                <button type="submit" class="btn btn-link" style="margin-left: 0px">
                    <a href="GestionnerHomeServlet?action=profileshow">
                        <i style="color: #E0BE81; margin-right: 5px;" class="fa-solid fa-id-badge"></i>
                        <span style="color: #052659; font-weight: bold">Profile</span>
                    </a>
                </button>


                <form   id="logout-form2" action="LogOutServlet">
                    <button type="submit" class="btn btn-link"   style="margin-left: 0px" >
                        <a href="#" >
                            <i class="fa-solid fa-link-slash" data-feather="log-out"  style="color: #E0BE81 ; " ></i>
                            <span style="color: #052659 ; font-weight: bold" >  Deconnecte</span>
                        </a>
                    </button>
                </form>
            </div>
        </li>

    </ul>
    <div class="dropdown mobile-user-menu show">
        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i
                class="fa fa-ellipsis-v"></i></a>
        <div class="dropdown-menu dropdown-menu-right ">
            <a class="dropdown-item" href="#">My Profile</a>
            <a class="dropdown-item" href="#">Settings</a>
            <a class="dropdown-item" href="#" href="#" href="#"
            >Logout</a>
            <form id="logout-form1" action="LogOutServlet" method="POST" class="d-none">

            </form>
        </div>
    </div>

</div>


<div class="sidebar" id="sidebar">
    <div class="sidebar-inner slimscroll">
        <div class="sidebar-contents">
            <div id="sidebar-menu" class="sidebar-menu">
                <div class="mobile-show">
                    <div class="offcanvas-menu">
                        <div class="user-info align-center bg-theme text-center">
                            <span class="lnr lnr-cross  text-white" id="mobile_btn_close">X</span>
                            <a href="javascript:void(0)" class="d-block menu-style text-white">
                                <div class="user-avatar d-inline-block mr-3">
                                    <img src="img/avatar-18jpg" alt="user avatar"
                                         class="rounded-circle" width="50">
                                </div>
                            </a>
                        </div>
                    </div>
                    <%--<div class="sidebar-input">
                        <div class="top-nav-search">
                            <form>
                                <input type="text" class="form-control" placeholder="Search here">
                                <button class="btn" type="submit"><i class="fas fa-search"></i></button>
                            </form>
                        </div>
                    </div>--%>
                </div>
                <ul>
                    <li class=""> <%-- active--%>
                        <a href="GestionnerHomeServlet?action=showDashboard"><i style="color: #E0BE81" class="fa-solid fa-diagram-project"></i>
                            <span style="color: #052659">Projet</span></a>
                    </li>

                    <li class="#">
                        <a href="GestionnerHomeServlet?action=listequipe"><i class="fa-solid fa-people-group" style="color: #E0BE81"></i>
                            <span style="color: #052659"> Equipe</span></a>
                    </li>
                    <li class="#">
                        <a href="GestionnerHomeServlet?action=listTache"><i class="fa-solid fa-list-check" style="color: #E0BE81"></i>
                            <span style="color: #052659"> Tache</span></a>
                    </li>

                    <li  class="#">
                        <a href="GestionnerHomeServlet?action=profileshow"><i  style="color: #E0BE81" class="fa-solid fa-id-badge"></i>
                            <span style="color: #052659">Profile</span></a>
                    </li>

                    <li>
                        <form   id="logout-form" action="LogOutServlet">
                            <button type="submit" class="btn btn-link"   style="margin-left: 0px" >
                                <a href="#" >
                                    <i class="fa-solid fa-link-slash" data-feather="log-out"  style="color: #E0BE81 ; " ></i>
                                    <span style="color: #052659 ; font-weight: bold" >  Deconnecte</span>
                                </a>
                            </button>
                        </form>
                    </li>


                </ul>

            </div>
        </div>
    </div>
</div>










<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script src="js/feather.min.js"></script>

<script src="plugins/slimscroll/jquery.slimscroll.min.js"></script>

<script src="plugins/apexchart/apexcharts.min.js"></script>

<script src="plugins/apexchart/chart-data.js"></script>

<script src="js/select2.js"></script>

<script src="js/script1.js"></script>


</body>

</html>
