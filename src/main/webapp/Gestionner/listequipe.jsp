 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <%@ include file="/Gestionner/Dashboard.jsp" %>
 <%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

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
                             <h3 style="color: #052659"><i class="fa-solid fa-users" style="color: #E0BE81"></i> Equipe</h3>
                         </li>

                     </ul>
                     <a  href="#" data-toggle="modal" data-target="#AddModal" >
                         <button type="submit" class=""
                                 style="font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D"><i  style=" color:#E0BE81" data-feather="plus" class="fa-solid fa-plus"></i>  Membre</button>
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
  ">${AllMember}</strong>
                             <span>Membre</span>
                         </label>
                     </div>
                 </div>
             </div>

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
                                     <th style="  font-size: 16px; font-weight: normal" >Prenom</th>
                                     <th style="  font-size: 16px;font-weight: normal" >Nom</th>
                                     <th style="  font-size: 16px;font-weight: normal" >Num telephone</th>
                                     <th style="  font-size: 16px;font-weight: normal" >Profession</th>
                                     <th style="  font-size: 16px;font-weight: normal" >Email</th>
                                     <th style="  font-size: 16px;font-weight: normal"  >Role</th>
                                     <th style="  font-size: 16px;font-weight: normal"  >Action</th>
                                 </tr>
                                 </thead>
                                 <tbody>
                                 <c:forEach items="${membresEquipe}" var="user">
                                     <tr>
                                         <td> <c:out value="${user.firstname}"/> </td>
                                         <td><c:out value="${user.lastname}"/></td>
                                         <td><c:out value="${user.phoneNumber}"/></td>
                                         <td><c:out value="${user.profession}"/></td>
                                         <td><c:out value="${user.email}"/></td>
                                         <td><c:out value="${user.role}"/>  </td>
                                         <td>
                                         <a type="button" class="  btn text-light" data-toggle="modal" data-target="#deleteModal${user.id}" style="background-color: #E0BE81">
                                             <i class="fa-solid fa-trash-can" style="background-color: #E0BE81 ; color: #FF002D"></i>
                                         </a>
                                         </td>
                                     </tr>
                                     <%--     /// delete //--%>


                                     <div class="modal fade" id="deleteModal${user.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabell" aria-hidden="true">
                                         <div class="modal-dialog modal-dialog-centered" role="document">
                                             <div class="modal-content" style="border-radius: 10px">
                                                 <div class="modal-header border-bottom-0">
                                                     <i class="fa-solid fa-trash-can" style="color: #548383; margin-right: 5px;"></i>
                                                     <h5 class="modal-title" id="exampleModalLabell" style="color: #052659; font-weight: bold;">Supprimer Utilisateur</h5>
                                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                         <span aria-hidden="true">&times;</span>
                                                     </button>
                                                 </div>
                                                 <form action="GestionnerHomeServlet?action=removeMemberFromTeam&id=<c:out value='${user.id}' />" method="POST">                                                     <div class="form-group mb-3" >
                                                         <div class="text-center" > <strong>Êtes-vous sûr de vouloir supprimer le membre</strong> <strong style="color: #b9d932" >  ${user.firstname}  </b> ?  </strong>
                                                         </div></div>


                                                     <div class=" d-flex justify-content-end">
                                                         <button type="submit" class=""
                                                                 style=" margin-right: 6px; margin-bottom: 5px;font-weight: bold; border-radius:12px;width: 110px;height: 40px; color:#E0BE81; background-color: #FF002D ; border-color: #FF002D">Supprimer</button>
                                                     </div>

                                                 </form>
                                             </div>
                                         </div>
                                     </div>


                                 </c:forEach>
                                 </tbody>
                             </table>

                             <!--		Start Pagination -->
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

 </div>



 <div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content" style="border-radius: 10px">
             <div class="modal-header border-bottom-0">
                 <i class="fa-solid fa-plus" style="color: #548383; margin-right: 5px;"></i>
                 <h5 class="modal-title" id="exampleModalLabel" style="color: #052659; font-weight: bold;">Ajouter un memebre</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <form action="GestionnerHomeServlet?action=addMemberToTeam" method="post" class="modal-body">
                 <div class="form-group mb-3" >
                     <select class="form-select" style="height: 45px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " name="user" id="user" aria-label="Default select example" >
                         <option value="" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " >Definir un utilisateur</option>
                         <c:forEach  items="${allUsers}" var="user">
                             <option style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  "    value="<c:out value='${user.id}' />"> <c:out value="${user.firstname} "/>   <c:out value="${user.lastname}"/></option>

                         </c:forEach>
                     </select>
                     <input type="hidden" name="equipe_en_charge_id" value="${equipe_en_charge_id}">

                         <% if(request.getAttribute("error")!=null){ String error = request.getAttribute("error").toString();%>
                     <div th:if="${errors}" class="error-message alert-danger" style="justify-content: center; width:70%; border-radius: 4px; border-left: 6px solid #FF002D; background-color: #fffbe2; color: #FF002D; margin-left: auto; margin-right: auto; text-align: center;">
                         <i class="fa-regular fa-bell" th:if="${errors}"></i>
                         <p th:text="${errors}"></p>

                         <%=error%></div>
                         <% }%>
                     <br>
                     <br>
                     <div class=" d-flex justify-content-end">
                         <button type="submit" class="" name="action"
                                 style="font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D">Ajouter memebre</button>
                     </div>

             </form>
         </div>
     </div>
 </div>


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
