<%--
&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: Mohamed
  Date: 5/14/2024
  Time: 4:44 PM
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ include file="/User/Dashboard.jsp" %>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <br>
            <br>
            <c:forEach items="${commentaires}" var="commentaire">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"> <c:out value="${commentaire.user.firstname}" /> <c:out value="${commentaire.user.lastname}" /></h5>
                            <p class="card-text"> <c:out value="${commentaire.contenu_cm}" /></p>
                            <p class="card-text"> <c:out value="${commentaire.date_cm}" /></p>
                                &lt;%&ndash;                        <a href="#" class="btn btn-primary"></a>&ndash;%&gt;
                            <a type="button" class="btn btn-danger text-light" data-toggle="modal" data-target="#deleteModal${commentaire.id}">
                                <i class="fa-solid fa-trash"></i>
                            </a>

                        </div>
                    </div>
                </div>
                &lt;%&ndash;                            /// delete //&ndash;%&gt;
                <div class="modal fade" id="deleteModal${commentaire.id}" tabindex="-1" role="dialog" aria-labelledby="showModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="UserHomeServlet?action=deletecommentaire&id=<c:out value='${commentaire.id}' />" method="POST" enctype="multipart/form-data">

                                <div class="modal-header">
                                    <h4 class="modal-title">Supprimer commentaire</h4>
                                    <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                    </a>
                                </div>
                                <div class="modal-body">
                                    Voulez-vous supprimer cette commentaire   </b> ?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn gray btn-outline-secondary"
                                            data-dismiss="modal">Anuller</button>
                                    <button type="submit"
                                            class="btn gray btn-outline-danger">Supprimer</button>


                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                &lt;%&ndash;     ///  end delete //&ndash;%&gt;
            </c:forEach>
            <form action="UserHomeServlet?action=addcommentaire" method="POST">
                <div class="form-group mb-3">
                    <input type="hidden" name="id" value="${id}" class="form-control" placeholder="Commentaire" required/>
                    <input type="text" name="comment" class="form-control" placeholder="Commentaire" required/>
                </div>
                <div class="mb-3">
                    <button class="btn btn-success w-100 mt-4" type="submit" id="submit_button">Sauvegarder</button>
                </div>
            </form>
        </div>
    </div>
</div>
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"%>
<%@ include file="/User/Dashboard.jsp" %>
<style>
    .btn-trash {

        border: none;
        color: #FF002D;
        cursor: pointer;
        padding: 0;
        display: flex;
        font-size: 20px;
        justify-content: end;
    }

    .btn-trash:hover {
        background-color: transparent;
    }
    .comment-card {
        border: 1px solid #ddd;
        border-radius: 12px;
        padding: 10px;
        margin: 10px 0;
        background-color: #fff;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        max-width: 600px;
        height: 18%;
        position: relative;
        overflow-wrap: break-word;
    }

    .comment-author {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .comment-date {
        color: #999;
        font-size: 0.8em;
        margin-bottom: 10px;
    }

    .comment-text {
        margin-bottom: 10px;
    }
    .comment-card:first-child {
        margin-top: 5%; /* Ajustez la valeur selon vos besoins */
    }
    .comment-text:focus {
        margin-bottom: 10px;
        border-color: #344E6D;
    }

    .btn-danger .fa-trash {
        font-size: 14px;
    }

    .form-group {
        margin-bottom: 10px;
    }

    .form-control {
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }



</style>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <br>
            <br>
            <c:forEach items="${commentaires}" var="commentaire">
                <div class="comment-card" style="margin-top: 5%">

                    <h5 class="comment-author" style="color: #052659; margin-left: 2%">
                        <i class="fa-solid fa-user" style="color: #E0BE81"></i>
                        <c:out value="${commentaire.user.firstname}" />
                        <c:out value="${commentaire.user.lastname}" />
                    </h5>
                    <p class="comment-date" style=" margin-left: 2%;color: #adafc5;font-size:11px ">
                        <c:out value="${commentaire.date_cm}" />
                    </p>
                    <p class="comment-text" style=" margin-left: 2%;font-size: 18px ;color: #052659; margin-top: 3%">
                        <c:out value="${commentaire.contenu_cm}" />
                    </p>
                   <%-- <a   type="button" class="btn-trash " data-toggle="modal" data-target="#deleteModal${commentaire.id}">
                        <i class="fa-solid fa-trash-can"  style=" color: #FF002D;"></i>
                    </a>--%>

                  <%--  <a type="button" class="d-flex justify-content-end   " data-toggle="modal" data-target="#deleteModal${commentaire.id}">
                        <i class="fa-solid fa-trash"></i>
                    </a>--%>
                </div>
                <%-- Delete Modal --%>
               <%-- <div class="modal fade" id="deleteModal${commentaire.id}" tabindex="-1" role="dialog" aria-labelledby="showModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="UserHomeServlet?action=deletecommentaire&id=<c:out value='${commentaire.id}' />" method="POST" enctype="multipart/form-data">
                                <div class="modal-header">
                                    <h4 class="modal-title">Supprimer commentaire</h4>
                                    <a type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <img style="width: 25px; height: 25px; margin-top: 10px;" src="img/close.png" alt="sidebar_img">
                                    </a>
                                </div>
                                <div class="modal-body">
                                    Voulez-vous supprimer cette commentaire ?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn gray btn-outline-secondary" data-dismiss="modal">Annuler</button>
                                    <button type="submit" class="btn gray btn-outline-danger">Supprimer</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>--%>

                <div class="modal fade" id="deleteModal${commentaire.id}" tabindex="-1" role="dialog" aria-labelledby="showModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content" style="border-radius: 10px; height: 10%">
                            <div class="modal-header border-bottom-0">
                                <i class="fa-solid fa-trash-can" style="color: #548383; margin-right: 5px;"></i>
                                <h5 class="modal-title" id="exampleModalLabell2" style="color: #052659; font-weight: bold;">Supprimer commentaire</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="UserHomeServlet?action=deletecommentaire&id=<c:out value='${commentaire.id}' />" method="POST" enctype="multipart/form-data">
                                <div class="text-center" >
                                    <strong>Voulez-vous supprimer cette commentaire ? </strong>

                                </div>
                                <div class=" d-flex justify-content-end">
                                    <button type="submit" class=""
                                            style=" margin-right: 6px; margin-bottom: 5px;font-weight: bold; border-radius:12px;width: 110px;height: 40px; color:#E0BE81; background-color: #FF002D ; border-color: #FF002D">Supprimer</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
                <%-- End Delete Modal --%>
            </c:forEach>
            <form action="UserHomeServlet?action=addcommentaire" method="POST">
                <div class="form-group mb-3">
                    <input type="hidden" name="id" value="${id}" class="form-control" required/>
                    <input type="text" name="comment" class="form-control" placeholder="Commentaire" required/>
                </div>
                <div class="mb-3">
                    <button class="btn w-100 mt-4" style="color:#E0BE81; background-color: #052659" type="submit" id="submit_button">Sauvegarder</button>
                </div>
            </form>
        </div>
    </div>
</div>

