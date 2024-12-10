
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Util.UserStatus" %>
<%@ page isELIgnored="false"%>
<%@ include file="/Gestionner/Dashboard.jsp" %>

<style>




    .container .ajouterprojet{
        position: relative;
        margin-top: 16px;
        bottom: 5%;
        top: 15%;
        min-height: 490px;
        background-color: #fff;
        overflow: hidden;
    }
    .container .ajouterprojet .form{
        position: relative;
        background-color: #fff;
        transition: 0.3s ease;
    }
    .container .ajouterprojet .form.second{
        opacity: 0;
        pointer-events: none;
        transform: translateX(100%);
    }
    .ajouterprojet.secActive .form.second{
        opacity: 1;
        pointer-events: auto;
        transform: translateX(0);
    }
    .ajouterprojet.secActive .form.first{
        opacity: 0;
        pointer-events: none;
        transform: translateX(-100%);
    }
    .container .ajouterprojet .title{
        display: block;
        margin-bottom: 8px;
        font-size: 16px;
        font-weight: 500;
        margin: 6px 0;
        color: #E0BE81;
    }
    .container  .title{
        display: block;
        margin-bottom: 8px;
        font-size: 16px;
        font-weight: 500;
        margin: 6px 0;
        color: #E0BE81;
    }
    .container form .fields{

        display: flex;
        align-items: flex-start;;
        justify-content: space-between;
        flex-wrap: wrap;
    }
    form .fields .input-field{
        display: flex;
        width: calc(100% / 1 - 15px);
        flex-direction: column;
        margin: 4px 0;
    }

    .input-field label{
        font-size: 17px;
        font-weight: 550;
        color: #052659;
        font-family: 'Poppins', sans-serif;
    }
    .input-field select{
        background-color: #f1ece6;
    }
    .input-field input, select{
        outline: none;
        font-size: 14px;
        font-weight: 400;
        color: #F1E4D7;
        border-radius: 5px;
        border: 1px solid #aaa;
        padding: 0 15px;
        height: 42px;
        margin: 8px 0;
    }
    select{
        outline: none;
        font-size: 14px;
        font-weight: 400;
        color: grey;
        border-radius: 5px;
        border: 1px solid #aaa;
        padding: 0 15px;
        height: 42px;
        margin: 8px 0;
        background-color: #ffffff;
    }
    select:focus{
        box-shadow: 0 3px 6px rgba(0,0,0,0.13);
        border-color: #E0BE81;/*jai changer ici*/
        border-radius: 5px;
    }


    .input-field input :focus,
    .input-field select:focus{
        box-shadow: 0 3px 6px rgba(0,0,0,0.13);
        border-color: #E0BE81;/*jai changer ici*/
        border-radius: 5px;
    }
    .input-field select,
    .input-field input,.input-field textarea {
        color: #052659;
        border-radius: 5px;
        border-width: 2px;
        border-color: #E0BE81;
        /*background-color: #F1E4D7;*/

    }
    .input-field input[type="date"]:valid{
        color: #333;
        border-radius: 3px;
        border-color: #E0BE81;
    }
    .input-field input::placeholder{
        font-family: 'Poppins', sans-serif;
    }
    .container form button, .backBtn{
        display: flex;
        align-items: center;
        justify-content: center;
        height: 45px;
        max-width: 200px;
        width: 100%;
        border: none;
        outline: none;
        color: lightgray;
        font-size: 18px;
        border-radius: 5px;
        margin: 25px 0;

        background-color: #E0BE81;
        transition: all 0.3s linear;
        cursor: pointer;
    }
    .container form .btnText{
        font-size: 18px;
        font-weight: 450;
    }


    headercol{
        color: #052659;
    }




    /*///////////////////////////////////////////////*/
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
                            <h3 style="color: #052659"><i class="fa-solid fa-diagram-project" style="color: #E0BE81"></i> Projet</h3>
                        </li>

                    </ul>
                    <a  href="#" data-toggle="modal" data-target="#AddModal" >
                        <button type="submit" class=""
                                style="font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D"><i  style=" color:#E0BE81" data-feather="plus" class="fa-solid fa-plus"></i>  Projet</button>
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
  ">${allprojectsCount}</strong>
                            <span>Projet</span>
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
                                    <th style="  font-size: 16px; font-weight: normal" >Titre projet</th>
                                    <th style="  font-size: 16px;font-weight: normal" >Date creation</th>
                                    <th style="  font-size: 16px;font-weight: normal" >Description</th>
                                    <th style="  font-size: 16px;font-weight: normal"  >Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${listProject}" var="project">
                                    <tr>
                                        <td> <c:out value="${project.name}"/> </td>
                                        <td><c:out value="${project.datep}"/></td>
                                        <td><c:out value="${project.description}"/></td>

                                        <td>
                                            <a type="button" class="  btn text-light" data-toggle="modal" data-target="#deleteModal${project.id}" style="background-color: #E0BE81">
                                                <i class="fa-solid fa-trash-can" style="background-color: #E0BE81 ; color: #FF002D"></i>
                                            </a>
                                        </td>
                                    </tr>
                                        <div class="modal fade" id="deleteModal${project.id}" style="height: 35%; margin-top: 15%" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabell2" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                <div class="modal-content" style="border-radius: 10px; height: 10%">
                                                    <div class="modal-header border-bottom-0">
                                                        <i class="fa-solid fa-trash-can" style="color: #548383; margin-right: 5px;"></i>
                                                        <h5 class="modal-title" id="exampleModalLabell2" style="color: #052659; font-weight: bold;">Supprimer Utilisateur</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <form action="GestionnerHomeServlet?action=delete&id=<c:out value='${project.id}' />" method="POST" enctype="multipart/form-data">
                                                        <div class="text-center" >
                                                            <strong>Êtes-vous sûr de vouloir supprimer le projet </strong>
                                                            <strong style="color: #b9d932" >  ${project.name}  </b> ?  </strong>
                                                        </div>
                                                        <br>
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


<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content" >
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel" style="color: #052659; font-weight: bold;"><i class="fa-solid fa-diagram-project" style="color: #E0BE81"></i> Ajouter Projet </h5>

                <a type="button" class="btn-close" data-dismiss="modal" aria-label="Close"> <img style="width: 20px; height: 20px; margin-top: 10px;" src="img/close.png" alt="sidebar_img"></a>
            </div>
            <div class="modal-body">
                <form action="GestionnerHomeServlet?action=addProject"  class="ajouterprojet" method="POST">

                    <div class="form first" >
                        <div class="details personal" >
                            <div class="fields">
                                <div class="input-field" >
                                    <label for="name">Titre projet: </label>
                                    <input type="text" id="name" name="name"   placeholder="Enter le titre projet">
                                </div>
                                <div class="input-field">
                                    <label for="datep" >Date affectation</label>
                                    <input type="text" id="datep" name="datep"    value="<%= request.getAttribute("dateaffectation") %>" readonly />
                                </div>
                                <div class="input-field">
                                    <label for="description" class="col-form-label" >Description:</label>
                                    <input type="text"  id="description" name="description"  class="form-control p-3 my-2" required  />
                                </div>

                                <div class="input-field">
                                </div>
                                <div class="input-field">
                                </div> <div class="input-field">
                            </div> <div class="input-field">
                            </div>
                                <div class=" d-flex justify-content-end">
                                    <button type="submit" class="" style="font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D">Sauvegarder</button>
                                </div>
                            </div> </div>
                    </div>
                </form>
            </div>
        </div>
    </div></div>






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
