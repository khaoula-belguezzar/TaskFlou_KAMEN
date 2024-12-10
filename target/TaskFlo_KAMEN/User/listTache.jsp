
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Util.Status" %>
<%@ page isELIgnored="false"%>
<%@ include file="/User/Dashboard.jsp" %>
<style>
    .kanban-board {
        display: flex;
        justify-content: space-between;
    }
    .kanban-column {
        width: 30%;
        background-color: #f8f9fa;
        border-radius: 5px;
        padding: 10px;
    }
    .kanban-card {
        background-color: #ffffff;
        border-radius: 5px;
        margin-bottom: 10px;
        padding: 10px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }
    .kanban-card h5 {
        margin: 0;
        font-size: 16px;
        color: #052659;
    }
    .com:hover{
        background-color: transparent;
    }
    .kanban-card p {
        margin: 5px 0;
        font-size: 14px;
        color: #6c757d;
    }
    .kanban-card a {
        margin-right: 5px;
    }
    .top-space {
        height: 20px;
    }

</style>

<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="row">
            <div class="col-xl-12 col-sm-12 col-12">
                <div class="breadcrumb-path mb-4">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item justify-content-center">
                            <h3 style="color: #052659"><i class="fa-solid fa-gauge-high" style="color: #E0BE81"></i> Dashboard</h3>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="col-xl-12 col-sm-12 col-12 mb-4">
                <div class="top-space"></div> <!-- Espace supplémentaire ajouté ici -->
                <div class="card">
                    <div class="kanban-board p-4">
                        <div class="kanban-column">
                            <h4>A faire</h4>
                            <c:forEach items="${todoList}" var="todo">
                                <div class="kanban-card" style="margin-top: 4%">
                                    <h5 class="card-title"><c:out value="${todo.titretache}" /></h5>
                                    <p class="card-text"><c:out value="${todo.deadline}" /></p>
                                    <a type="button" class="btn  " data-toggle="modal" data-target="#updateModal${todo.id}" style="color: #909528">
                                        <i class="fa-solid fa-pen"></i>
                                    </a>
                                    <a href="UserHomeServlet?action=commentlist&id=<c:out value='${todo.id}' />">
                                        <i class=" com fa-solid fa-comments" style="color: #5bc0de"></i>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="kanban-column">
                            <h4>En cours</h4>
                            <c:forEach items="${inProgressList}" var="inProgress">
                                <div class="kanban-card" style="margin-top: 4%">
                                    <h5 class="card-title"><c:out value="${inProgress.titretache}" /></h5>
                                    <p class="card-text"><c:out value="${inProgress.deadline}" /></p>
                                    <a type="button" class="btn" data-toggle="modal" data-target="#updateModal${inProgress.id}" style="color: #909528">
                                        <i class="fa-solid fa-pen"></i>
                                    </a>
                                    <a href="UserHomeServlet?action=commentlist&id=<c:out value='${inProgress.id}' />">
                                        <i class=" com fa-solid fa-comments" style="color: #5bc0de"></i>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="kanban-column">
                            <h4>COMPLETE</h4>
                            <c:forEach items="${completedList}" var="completed">
                                <div class="kanban-card" style="margin-top: 4%">
                                    <h5 class="card-title"><c:out value="${completed.titretache}" /></h5>
                                    <p class="card-text"><c:out value="${completed.deadline}" /></p>
                                    <a type="button" class="btn  " data-toggle="modal" data-target="#updateModal${completed.id}"  style="color: #909528">
                                        <i class="fa-solid fa-pen"></i>
                                    </a>
                                    <a href="UserHomeServlet?action=commentlist&id=<c:out value='${completed.id}' />">
                                        <i class=" com fa-solid fa-comments" style="color: #5bc0de"></i>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modals for updating task status -->
<c:forEach items="${todoList}" var="todo">
    <div class="modal fade" id="updateModal${todo.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content" style="border-radius: 10px">
                <div class="modal-header border-bottom-0">
                    <i class="fa-solid fa-plus" style="color: #548383; margin-right: 5px;"></i>
                    <h5 class="modal-title" id="exampleModalLabel" style="color: #052659; font-weight: bold;">Changer le statut</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="UserHomeServlet?action=updateStatusTache&id=<c:out value='${todo.id}' />" method="POST">
                    <div class="form-group mb-3" >
                        <div class="modal-body">
                            Voulez-vous modifier le statut de ${todo.titretache} ?</div>
                        <select class="form-select" name="status" aria-label="Default select example"style="height: 45px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  ">
                            <option value="" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " >Changer le status</option>
                            <option value="<c:out value='${Status.IN_PROGRESS}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  ">En cours</option>
                            <option value="<c:out value='${Status.COMPLETED}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  ">Complété</option>
                        </select>
                        <% if(request.getAttribute("error")!=null){ String error = request.getAttribute("error").toString();%>
                        <div class="error-message alert-danger" style="justify-content: center; width:70%; border-radius: 4px; border-left: 6px solid #FF002D; background-color: #fffbe2; color: #FF002D; margin-left: auto; margin-right: auto; text-align: center;">
                            <i class="fa-regular fa-bell"></i>
                            <p><%=error%></p>
                        </div>
                        <% }%>
                    </div>

                    <div class=" d-flex justify-content-end">
                        <button type="submit" class="" name="action"
                                style="margin-right:5% ; font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D">changer</button>
                    </div> <br>

                </form>
            </div>
        </div>
    </div>
</c:forEach>
<c:forEach items="${inProgressList}" var="inProgress">
<div class="modal fade" id="updateModal${inProgress.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" style="border-radius: 10px">
            <div class="modal-header border-bottom-0">
                <i class="fa-solid fa-plus" style="color: #548383; margin-right: 5px;"></i>
                <h5 class="modal-title" id="exampleModalLabel2" style="color: #052659; font-weight: bold;">changer le status</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="UserHomeServlet?action=updateStatusTache&id=<c:out value='${inProgress.id}' />" method="POST">
                <div class="form-group mb-3" >
                    <div class="modal-body">
                        Voulez-vous modifier  le status de   ${inProgress.titretache}  </b> ?
                    </div>
                    <select class="form-select" style="height: 45px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " name="status" id="user" aria-label="Default select example" >
                        <option value="" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " >Changer le status</option>
                        <option value="<c:out value='${Status.TODO}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  ">A faire</option>
                        <option value="<c:out value='${Status.COMPLETED}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  "> Complete</option>
                    </select>
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
                                style="margin-right:5% ; font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D">changer</button>
                    </div>

            </form>
        </div>
    </div>
</div>
</c:forEach>
<c:forEach items="${completedList}" var="completed">
    <div class="modal fade" id="updateModal${completed.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content" style="border-radius: 10px">
                <div class="modal-header border-bottom-0">
                    <i class="fa-solid fa-plus" style="color: #548383; margin-right: 5px;"></i>
                    <h5 class="modal-title" id="exampleModalLabel" style="color: #052659; font-weight: bold;">changer le status</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="UserHomeServlet?action=updateStatusTache&id=<c:out value='${completed.id}' />"  method="post" class="modal-body">
                    <div class="form-group mb-3" >
                        <div class="modal-body">
                            Voulez-vous modifier  le status de  ${completed.titretache}  </b> ?
                        </div>
                        <select class="form-select" style="height: 45px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " name="status" id="user" aria-label="Default select example" >
                            <option value="" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " >Changer le status</option>
                            <option value="<c:out value='${Status.TODO}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  ">A faire</option>
                            <option value="<c:out value='${Status.IN_PROGRESS}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  "> En cour</option>
                        </select>
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
                                    style="margin-right:5% ;font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D">changer</button>
                        </div>

                </form>
            </div>
        </div>
    </div>


</c:forEach>
<!-- Add similar modal structure for inProgressList and completedList -->


<!-- Add similar modal structure for inProgressList and completedList -->



<%--

<div class="page-wrapper">
    <div class="content container-fluid">
        <div class="row">
            <div class="col-xl-12 col-sm-12 col-12">
                    <div class="breadcrumb-path mb-4">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item justify-content-center">
                                <h3 style="color: #052659"><i class="fa-solid fa-gauge-high" style="color: #E0BE81"></i> Dashboard</h3>
                            </li>

                        </ul>

                    </div>
                </div>

            <div class="col-xl-12 col-sm-12 col-12 mb-4">
                <div class="card">
                    <div class="table-responsive p-4" >
                        <table  id="example" class="table  spacethtd custom-table no-footer" >
                            <thead>
                            <tr>
                                <th >A faire</th>
                                <th >En cour</th>
                                <th >COMPLETED</th>
                            </tr>
                            </thead>
                            <tbody>
                                <tr>
<tr>
    <td>
        <c:forEach items="${todoList}" var="todo">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"> <c:out value="${todo.titretache}" /></h5>
                        <p class="card-text"> <c:out value="${todo.deadline}" /></p>
                         <a type="button" class="btn btn-success text-light" data-toggle="modal" data-target="#updateModal${todo.id}">
                             <i class="fa-solid fa-pen"></i></a>
                        <a href="UserHomeServlet?action=commentlist&id=<c:out value='${todo.id}' />" >
                            <i class="fa-solid fa-pen"></i></a>

                    </div>
                </div>
            </div>
            <div class="modal fade" id="updateModal${todo.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel21" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content" style="border-radius: 10px">
                        <div class="modal-header border-bottom-0">
                            <i class="fa-solid fa-plus" style="color: #548383; margin-right: 5px;"></i>
                            <h5 class="modal-title" id="exampleModalLabel21" style="color: #052659; font-weight: bold;">changer le status</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="UserHomeServlet?action=updateStatusTache&id=<c:out value='${todo.id}' />" method="POST">
                            <div class="form-group mb-3" >
                                <div class="modal-body">
                                    Voulez-vous modifier  le status de   ${todo.titretache}  </b> ?
                                </div>
                                <select class="form-select" style="height: 45px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " name="status" id="user" aria-label="Default select example" >
                                    <option value="" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " >Changer le status</option>
                                    <option value="<c:out value='${Status.IN_PROGRESS}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  ">A faire</option>
                                    <option value="<c:out value='${Status.COMPLETED}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  "> Complete</option>
                                </select>
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
                                            style="margin-right:5%  ;font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D">changer</button>
                                </div>

                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </td>
    <td>
        <c:forEach items="${inProgressList}" var="inProgress">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"> <c:out value="${inProgress.titretache}" /></h5>
                        <p class="card-text"> <c:out value="${inProgress.deadline}" /></p>
                        <a type="button" class="btn btn-success text-light" data-toggle="modal" data-target="#updateModal${inProgress.id}">
                            <i class="fa-solid fa-pen"></i></a>
                        <a href="UserHomeServlet?action=commentlist&id=<c:out value='${inProgress.id}' />" >
                            <i class="fa-solid fa-pen"></i></a>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="updateModal${inProgress.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content" style="border-radius: 10px">
                        <div class="modal-header border-bottom-0">
                            <i class="fa-solid fa-plus" style="color: #548383; margin-right: 5px;"></i>
                            <h5 class="modal-title" id="exampleModalLabel2" style="color: #052659; font-weight: bold;">changer le status</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="UserHomeServlet?action=updateStatusTache&id=<c:out value='${inProgress.id}' />" method="POST">
                            <div class="form-group mb-3" >
                                <div class="modal-body">
                                    Voulez-vous modifier  le status de   ${inProgress.titretache}  </b> ?
                                </div>
                                <select class="form-select" style="height: 45px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " name="status" id="user" aria-label="Default select example" >
                                    <option value="" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " >Changer le status</option>
                                    <option value="<c:out value='${Status.TODO}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  ">A faire</option>
                                    <option value="<c:out value='${Status.COMPLETED}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  "> Complete</option>
                                </select>
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
                                            style="margin-right:5% ; font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D">changer</button>
                                </div>

                        </form>
                    </div>
                </div>
            </div>
        </c:forEach>
    </td>
    <td>
        <c:forEach items="${completedList}" var="completed">
            <div class="col-sm-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"> <c:out value="${completed.titretache}" /></h5>
                        <p class="card-text"> <c:out value="${completed.deadline}" /></p>
                        <a type="button" class="btn btn-success text-light" data-toggle="modal" data-target="#updateModal${completed.id}">
                            <i class="fa-solid fa-pen"></i></a>
                        <a href="UserHomeServlet?action=commentlist&id=<c:out value='${completed.id}' />" >
                            <i class="fa-solid fa-pen"></i></a>
                    </div>
                </div>
            </div>



            <div class="modal fade" id="updateModal${completed.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content" style="border-radius: 10px">
                        <div class="modal-header border-bottom-0">
                            <i class="fa-solid fa-plus" style="color: #548383; margin-right: 5px;"></i>
                            <h5 class="modal-title" id="exampleModalLabel" style="color: #052659; font-weight: bold;">changer le status</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="UserHomeServlet?action=updateStatusTache&id=<c:out value='${completed.id}' />"  method="post" class="modal-body">
                            <div class="form-group mb-3" >
                                <div class="modal-body">
                                    Voulez-vous modifier  le status de  ${completed.titretache}  </b> ?
                                </div>
                                <select class="form-select" style="height: 45px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " name="status" id="user" aria-label="Default select example" >
                                    <option value="" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  " >Changer le status</option>
                                    <option value="<c:out value='${Status.TODO}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  ">A faire</option>
                                    <option value="<c:out value='${Status.IN_PROGRESS}' />" style="height: 45px;width: 260px; border-radius: 6px; background: #f1f7cd;color: #052659; font-weight: bold  "> En cour</option>
                                </select>
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
                                            style="margin-right:5% ;font-weight: bold; border-radius:12px;width: 140px;height: 50px; color:#E0BE81; background-color: #344E6D ; border-color: #344E6D">changer</button>
                                </div>

                        </form>
                    </div>
                </div>
            </div>


        </c:forEach>
    </td>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div></div>
</div>

--%>


<%--li lfou9 houwa le code dyalk okaaaaaaaaaaaaaaaaaaay--%>









<%--

<div class="modal fade" id="AddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title fs-5" id="exampleModalLabel"> Ajouter Gestionner  </h2>
                <a type="button" class="btn-close" data-dismiss="modal" aria-label="Close"> <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img"></a>
            </div>
            <div class="modal-body">
                <form action="AdminServlet?action=addGestionner" method="POST" >
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group mb-3">
                                <label for="user_id" class="form-label">Name</label>
                                <select class="form-select" style="height: 50px;" name="user_id" id="user_id" aria-label="Default select example" required>
                                    <option value="">Choose</option>
                                    <c:forEach items="${users}" var="u">
                                        <option value="<c:out value='${u.id}' />"> <c:out value="${u.firstname}"/>  <c:out value="${u.lastname}"/></option>
                                    </c:forEach>
                                </select>
                                <% if(request.getAttribute("error")!=null){ String error = request.getAttribute("error").toString();%>
                                <div  style="color : red"><%=error%></div>
                                <% }%>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="mb-3">
                                <button class="btn btn-success w-100 mt-4" type="submit" id="submit_button">Sauvegarder</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
--%>
