 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

 <%@ include file="/Gestionner/Dashboard.jsp" %>
 <%@ page isELIgnored="false"%>

 <style>
     table td{
         text-align: center; /* Centrer horizontalement */
         vertical-align: middle; /* Centrer verticalement */
         height: 40px;
     }

     table tr:nth-child(even){
         background-color: #e4e3e3
     }

     th {
         background: #052659;
         color: #E0BE81;
         height: 35px;
         font-weight: normal;

         text-align: center; /* Centrer horizontalement */
         vertical-align: middle; /* Centrer verticalement */
     }



     .paginationn li:hover{
         cursor: pointer;
         background-color:#E0BE81;
         color: #052659;
         border-color: #052659;
         text-align: center;



     }
     .paginationn li:focus{
         cursor: pointer;
         background-color:#E0BE81  ;
         border-color: #fff3cd;
         color: #052659;
         text-align: center;


     }
     .paginationn li a:active {
         cursor: pointer;
         background-color: #E0BE81;
         color: #052659;
         border-color: #fff3cd;
         text-align: center;

     }

     .paginationn li{
         cursor: pointer;
         background-color:#052659 ;
         border:  1px solid #E0BE81;
         color: #E0BE81;
         text-align: center;
         display: inline-block;
         margin-right: 8px;
         width: 50%;
         height: 50%;
     }

     .paginationn {

         margin: 0px;
         /* Centrez les éléments de la pagination horizontalement */
     }


     .paginationn-container {
         width: 8%;
         height: 15%;
         float:left;

     }
     .num_rows {
         width: 20%;
         float:left;
     }
     .tb_search{
         width: 35%;
         float:right;
     }



     .rows_count {
         width: 25%;
         text-align:right;
         float: right;
         color: #999;
     }

     /*css  recherche*/

     *{
         box-sizing: border-box;
     }

     .search-box{
         width: fit-content;
         height: fit-content;
         position: relative;
         float:right;
     }
     .input-search{
         height: 50px;
         width: 50px;
         border-style: none;
         padding: 10px;
         font-size: 18px;
         letter-spacing: 2px;
         outline: none;
         border-radius: 25px;
         transition: all .5s ease-in-out;
         background-color: #052659;
         padding-right: 40px;
         color:#052659;
     }
     .input-search::placeholder{
         color:#052659;
         font-size: 16px;
         letter-spacing: 2px;
         font-weight: 100;
     }
     .btn-search{
         width: 50px;
         height: 50px;
         border-style: none;
         font-size: 20px;
         font-weight: bold;
         outline: none;
         cursor: pointer;
         border-radius: 50%;
         position: absolute;
         right: 0px;
         color:#E0BE81 ;
         background-color:transparent;
         pointer-events: painted;
     }


     .btn-search:focus ~ .input-search{
         width: 300px;
         border-radius: 0px;
         background-color: transparent;
         border-bottom:1px solid rgba(255,255,255,.5);
         transition: all 500ms cubic-bezier(0, 0.110, 0.35, 2);
     }
     .input-search:focus{
         width: 300px;
         border-radius: 0px;
         background-color: transparent;
         border-bottom:1px solid #E0BE81;
         transition: all 500ms cubic-bezier(0, 0.110, 0.35, 2);
     }
 </style>
 <div class="page-wrapper">
        <div class="content container-fluid">
            <div class="row">
                <div class="col-xl-12 col-sm-12 col-12">
                    <div class="breadcrumb-path mb-4">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item justify-content-center">
                                <h3 style="color: #052659"><i class="fa-solid fa-list-check" style="color: #E0BE81"></i> Taches</h3>
                            </li>

                        </ul>
                        <a   style="" data-toggle="modal" data-target="#AddTaskModal"  >
                            <button type="submit"
                                    style="font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D"><i style=" color:#E0BE81" data-feather="plus" class="fa-solid fa-plus"></i> Tache</button>
                        </a>
                        <%--<h3>Equipe</h3>--%>
                    </div>
                </div>


                <div class="col-xl-8 col-sm-6 col-12 mb-4">
                    <div class="row">
                        <div class="col-xl-10 col-sm-8 col-12">
                            <label class="employee_count" style="display: flex; align-items: center;">
                                <strong style="
    width: 50px;
    height: 50px;
    background-color: #b58328;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #272b41;
    font-size: 24px;
    margin-right: 10px;
  ">${allTachesCount}</strong>
                                <span>Taches</span>
                            </label>
                        </div>
                    </div>
                </div>





            <%--  <div class="head-link-set">
                  <a class="btn-add" href="#" data-toggle="modal" data-target="#AddTaskModal"
                        ><i data-feather="plus"></i> Tache</a
                      >
                    </div>--%>


                <%--  <div class="col-xl-12 col-sm-12 col-12 mb-4">
                    <div class="row">
                        <div class="col-xl-12 col-sm-12 col-12 mb-4">
                            <div class="head-link-set">
                                <div class="col-xl-12 col-sm-12 col-12">
                                    <div class="breadcrumb-path mb-4">
                                <ul>

                              <li><a class="active"  style="color: #052659 ;background-color: #f1f7cd">${allTachesCount}    Taches</a></li>
                          </ul>
&lt;%&ndash;
                          <label class="employee_count"></label>
&ndash;%&gt;
                                    </div></div>                        </div></div>
                    </div>
                  </div>--%>
                <div class="col-xl-12 col-sm-12 col-12 mb-4">
                    <div class="card">
                        <div  class="container table-responsive p-4" >
                            <div class="container">
                                <div class="header_wrap">
                                    <div class="num_rows">

                                        <div class="form-group">
                                            <select class  ="" name="state" id="maxRows" style="height: 45px">


                                                <option value="5">5</option>
                                                <option value="10">10</option>
                                                <option value="20">20</option>
                                                <option value="50">50</option>
                                                <option value="5000">Afficher tout</option>
                                            </select>

                                        </div>
                                    </div>
                                    <div class="search-box">
                                        <button class="btn-search"><i class="fas fa-search"></i></button>
                                        <input type="text" class="input-search" id="search_input_all" onkeyup="FilterkeyWord_all_table()"placeholder="Chercher...">
                                    </div>

                                </div>
                                <h2 id="Utilisateurs"></h2>
                                <table class="table table-striped table-class" id= "table-id" >

                                <thead>
                            <tr>
                              <th >Titre tache</th>
                              <th >date affectation </th>
                              <th >dernier delais </th>
                              <th >Priorite</th>
                              <th >Status</th>
                                <th >Membre</th>
                                <th >Projet</th>
                              <th >Action</th>
                            </tr>
                          </thead>
                            <tbody>
                            <c:forEach items="${alltache}" var="tache">
                                <tr>
                                    <td> <c:out value="${tache.titretache}"/> </td>
                                    <td><c:out value="${tache.dateaffectation}"/></td>
                                    <td><c:out value="${tache.deadline}"/></td>
                                    <td><c:out value="${tache.priority}"/></td>
                                    <td><c:out value="${tache.status}"/></td>
                                    <td><c:out value="${tache.membreEquipe.firstname}"/> <c:out value="${tache.membreEquipe.lastname}"/></td>
<%--                                   --%>
                                    <td><c:out value="${tache.project.name}"/></td>

                                    <td>

                                        <a  style="background-color: #E0BE81" type="button" class="btn  text-light" data-toggle="modal" data-target="#deleteModal${tache.id}">
                                            <i class="fa-solid fa-trash-can"  style="; color: #FF002D;"></i>
                                        </a>
                                        <a  style="background-color: #E0BE81" href="GestionnerHomeServlet?action=commentlist&id=<c:out value='${tache.id}' />" type="button" class="  btn text-light" >
                                            <i class="fa-solid fa-comment" style="; color: #FF002D;font-size: 18px"></i>
                                        </a>
                                    </td>
                                </tr>

                                <%--                            /// delete //--%>

                                <div class="modal fade" id="deleteModal${tache.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabell" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content" style="border-radius: 10px">
                                            <div class="modal-header border-bottom-0">
                                                <i class="fa-solid fa-list-check" style="color: #548383; margin-right: 5px;"></i>
                                                <h5 class="modal-title" id="exampleModalLabell" style="color: #052659; font-weight: bold;">Supprimer une taches</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="GestionnerHomeServlet?action=deletetache&id=<c:out value='${tache.id}' />"  method="POST" enctype="multipart/form-data" class="modal-body">
                                                    <div class="text-center" > <strong>Êtes-vous sûr de vouloir supprimer la tache </strong> <strong style="color: #b9d932" >  ${tache.titretache}  ?  </strong>
                                                    </div>
                                                <div class=" d-flex justify-content-end" >
                                                    <button type="submit" class=""
                                                            style=" margin-right: 6px; margin-bottom: 5px;font-weight: bold; border-radius:12px;width: 110px;height: 40px; color:#E0BE81; background-color: #FF002D ; border-color: #FF002D">Supprimer</button>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <%--     ///  end delete //--%>
                            </c:forEach>
                          </tbody>
                        </table>
                                <br>
                                <div class='paginationn-container'>
                                    <nav>
                                        <ul class="paginationn">
                                            <!--	Here the JS Function Will Add the Rows -->
                                        </ul>
                                    </nav>
                                </div>
                                <br>
                                <div class="rows_count"></div>

                            </div>
                    </div>
                  </div>
            </div>
        </div>

    </div>

 </div>

     <div class="modal fade" id="AddTaskModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel12" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered" role="document">
             <div class="modal-content" style="border-radius: 10px">
                 <div class="modal-header border-bottom-0">
                     <i class="fa-solid fa-plus" style="color: #548383; margin-right: 5px;"></i>
                     <h5 class="modal-title" id="exampleModalLabel12" style="color: #052659; font-weight: bold;">Ajouter une tache</h5>
                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                         <span aria-hidden="true">&times;</span>
                     </button>
                 </div>
                 <form action="GestionnerHomeServlet?action=addTask"  method="POST"  class="modal-body">
                     <div class="form-group mb-3" >
                         <div class="form-group">
                             <label for="titretache" class="col-form-label" style="color: #052659; font-weight: bold">Titre tache:</label>
                             <input style="border-color: #E0BE81" id="titretache" name="titretache" class="form-control p-3 my-2" required />
                         </div>
                         <label for="projectId" style="color: #052659; font-weight: bold">Projet </label>
                         <select class="form-select" style="height: 45px; border-radius: 6px; background: #f1f7cd;color: #052659  ;border-color: #E0BE81" name="projectId" id="projectId" aria-label="Default select example" requiered >
                             <option value="" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659;   " >Selectionnez le projet </option>
                             <c:forEach items="${projects}" var="project">
                                 <option style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold " value="${project.id}">${project.name}</option>
                             </c:forEach>
                         </select>

                             <% if(request.getAttribute("error")!=null){ String error = request.getAttribute("error").toString();%>
                         <div th:if="${errors}" class="error-message alert-danger" style="justify-content: center; width:70%; border-radius: 4px; border-left: 6px solid #FF002D; background-color: #fffbe2; color: #FF002D; margin-left: auto; margin-right: auto; text-align: center;">
                             <i class="fa-regular fa-bell" th:if="${errors}"></i>
                             <p th:text="${errors}"></p>

                             <%=error%></div>
                             <% }%>
                         <br>
                         <label for="membreEquipeId" style=" margin-top: 4%;color: #052659; font-weight: bold">Membre d equipe :</label>
                         <select class="form-select" style="order-color: #E0BE81;height: 45px; border-radius: 6px; background: #f1f7cd;color: #052659 " name="membreEquipeId" id="membreEquipeId" aria-label="Default select example" required>

                             <c:forEach items="${membresEquipe}" var="membre">
                                 <option style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold "  value="${membre.id}">${membre.firstname} ${membre.lastname}</option>
                             </c:forEach>
                         </select>
                         <br>
                         <div class="form-group">
                             <label style="color: #052659 ;margin-top: 4%; font-weight: bold;margin-top: 4%" for="dateaffectation" class="col-form-label">Date affectation :</label>
                             <input  style="border-color: #E0BE81" id="dateaffectation" name="dateaffectation" class="form-control" value="<%= request.getAttribute("dateaffectation") %>" readonly />
                         </div>
                         <%--  Deadline--%>
                         <br>
                         <div class="form-group">
                             <label for="deadline" style="color: #052659 ; font-weight: bold;">Dernier delais</label>
                             <div class="datepicker date input-group">
                                 <input  style="border-color: #E0BE81;padding-right: 60px; height: 45px" type="text" name="deadline" placeholder="dernier delais" class="form-control" id="deadline" required> <!-- Augmenter le padding-right pour l'icône -->
                                 <span class="input-group-append" style="position: absolute; right: 5px; top: 0; bottom: 0; margin: auto; margin-right: 5px;"> <!-- Ajuster la position de l'icône -->
            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
        </span>
                             </div>
                         </div>
                         <br>
                         <div class="form-group">
                             <label style="font-size: 15px; font-weight: bold; margin-top: 0%;color: #052659">Priorite</label>
                             <div class="custom-control custom-radio custom-control-inline">
                                 <input  style="border-color: #E0BE81" type="radio" id="customRadioInline11" value="LOW" name="priority" class="custom-control-input" checked="">
                                 <label style="color: #052659" class="custom-control-label" for="customRadioInline11">bas</label>
                             </div>
                             <div class="custom-control custom-radio custom-control-inline">
                                 <input style="border-color: #E0BE81" type="radio" id="customRadioInline2" value="HEIGH" name="priority" class="custom-control-input">
                                 <label style="color: #052659" class="custom-control-label" for="customRadioInline2">haut</label>
                             </div>
                             <div class="custom-control custom-radio custom-control-inline">
                                 <input style="border-color: #E0BE81" type="radio" id="customRadioInline3" value="MEDIUM" name="priority" class="custom-control-input">
                                 <label style="color: #052659"class="custom-control-label" for="customRadioInline3">moyen</label>
                             </div>

                             <div class="custom-control custom-radio custom-control-inline">
                                 <input style="border-color: #E0BE81" type="radio" id="customRadioInline4" value="CRITICAL" name="priority" class="custom-control-input">
                                 <label  style="color: #052659" class="custom-control-label" for="customRadioInline4">critique</label>
                             </div>
                         </div>


                         <div class=" d-flex justify-content-end">
                             <button type="submit" class=""
                                     style="font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #052659 ; border-color: #052659">Sauvegarder</button>
                         </div>

                 </form>
             </div>
         </div>
     </div>









 <!-- Ajout du formulaire pour ajouter des tâches -->

 <script>
     getPagination('#table-id');
     $('#maxRows').trigger('change');

     function getPagination(table) {
         $('#maxRows').on('change', function() {
             $('.paginationn').html('');
             var trnum = 0;
             var maxRows = parseInt($(this).val());
             var totalRows = $(table + ' tbody tr').length;

             $(table + ' tr:gt(0)').each(function() {
                 trnum++;
                 if (trnum > maxRows) {
                     $(this).hide();
                 }
                 if (trnum <= maxRows) {
                     $(this).show();
                 }
             });

             if (totalRows > maxRows) {
                 var pageNum = Math.ceil(totalRows / maxRows);
                 for (var i = 1; i <= pageNum; i++) {
                     $('.paginationn').append('<li data-page="' + i + '">\
                        <span>' + i + '<span class="sr-only">(current)</span></span>\
                    </li>').show();
                 }
             }

             $('.paginationn li:first-child').addClass('active');

             showig_rows_count(maxRows, 1, totalRows);

             $('.paginationn li').on('click', function(e) {
                 e.preventDefault();
                 var pageNum = $(this).attr('data-page');
                 var trIndex = 0;
                 $('.paginationn li').removeClass('active');
                 $(this).addClass('active');

                 showig_rows_count(maxRows, pageNum, totalRows);

                 $(table + ' tr:gt(0)').each(function() {
                     trIndex++;
                     if (trIndex > (maxRows * pageNum) || trIndex <= ((maxRows * pageNum) - maxRows)) {
                         $(this).hide();
                     } else {
                         $(this).show();
                     }
                 });
             });
         }).change();
     }

     $(function() {
         default_index('#table-id');
     });

     function showig_rows_count(maxRows, pageNum, totalRows) {
         var end_index = maxRows * pageNum;
         var start_index = ((maxRows * pageNum) - maxRows) + parseFloat(1);
         var string = 'Affichage de ' + start_index + ' sur ' + totalRows + ' entrées';
         $('.rows_count').html(string);
     }

     function default_index(table) {
         $(table + ' tr:eq(0)').prepend('<th>Index</th>');
         var id = 0;
         $(table + ' tr:gt(0)').each(function() {
             id++;
             $(this).prepend('<td>' + id + '</td>');
         });
     }

     function FilterkeyWord_all_table() {
         var count = $('.table').children('tbody').children('tr:first-child').children('td').length;
         var input = document.getElementById("search_input_all");
         var input_value = input.value.toLowerCase();

         if (input_value != '') {
             var table = document.getElementById("table-id");
             var tr = table.getElementsByTagName("tr");

             for (var i = 1; i < tr.length; i++) {
                 var flag = 0;
                 for (var j = 0; j < count; j++) {
                     var td = tr[i].getElementsByTagName("td")[j];
                     if (td) {
                         var td_text = td.innerHTML;
                         if (td.innerHTML.toLowerCase().indexOf(input_value) > -1) {
                             flag = 1;
                         }
                     }
                 }
                 if (flag == 1) {
                     tr[i].style.display = "";
                 } else {
                     tr[i].style.display = "none";
                 }
             }
         } else {
             $('#maxRows').trigger('change');
         }
     }
 </script>
