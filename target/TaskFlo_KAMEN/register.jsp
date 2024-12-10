<!doctype html>
<html lang="en">
  <head>
      <title>Task flo </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link rel="icon" type="image/png" href="images/logo1.png">
	<link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/menu.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- Datepicker -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
     <style>
         /* Modifier la largeur du calendrier */
         .datepicker {
             color: #272b41;
             border-radius: 10px; /
         }

     </style>
	</head>
  <body class="img js-fullheight" style="background-image: url(images/kkkkkk.jpg)">      <script>
              $(function () {
                  $('.datepicker').datepicker({
                      language: "es",
                      autoclose: true,
                      format: "dd/mm/yyyy"
                  });
              });

          </script>
		<div class="site-mobile-menu">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
			</div>

			<header class="site-navbar" role="banner">

			<div class="container">
				<div class="row align-items-center">


				<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-white"><span class="icon-menu h3"></span></a></div>

				</div>

				</div>
			</div>

			</header>
    <div class="body-text" >
      <section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section" style="font-weight: bold;">Inscription</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<form method="POST" action="RegisterServlet" class="signin-form">
                    <div class="form-group">

		      			<input type="text" name="firstname" class="form-control" placeholder="Prenom" required>
                    </div>
                      <div class="form-group">
                        <input type="text" name="lastname" class="form-control" placeholder="Nom" required>

                        <% if(request.getAttribute("errorfirstname")!=null){ String errorfirstname = request.getAttribute("errorfirstname").toString();%>
                        <div  style="color : red"><%=errorfirstname%></div>
                        <% }%>
                    </div>

                    <div class="form-group">
                    <div class="datepicker date input-group">
                        <input type="text" name="datebirth" placeholder="Date naissance" class="form-control" id="fecha1">
                        <div class="input-group-append" >
                       <span class="input-group-text" style="color: #f70018"><i class="fa fa-calendar"></i></span>
                      </div>
                 </div>
                        <% if(request.getAttribute("errordatebirth")!=null){ String errordatebirth = request.getAttribute("errordatebirth").toString();%>
                        <div  style="color : red"><%=errordatebirth%></div>
                        <% }%>
                    </div>
                    <div class="form-group">

                        <input type="tel" name="phonenumber" class="form-control" placeholder="Num telephone" required>

                        <% if(request.getAttribute("errorphonenumber")!=null){ String errorphonenumber = request.getAttribute("errorphonenumber").toString();%>
                        <div  style="color : red"><%=errorphonenumber%></div>
                        <% }%>
                    </div>
                    <div class="form-group">
                    <input type="tel" name="proffesion" class="form-control" placeholder="Profession" required>
                        <% if(request.getAttribute("errorprofession")!=null){ String errorprofession = request.getAttribute("errorprofession").toString();%>
                        <div  style="color : red"><%=errorprofession%></div>
                        <% }%>
                     </div>
                      <div class="form-group">

                        <input type="text" name="email" class="form-control" placeholder="E-mail" required>
                         <% if(request.getAttribute("error")!=null){ %>
                                     <div  style="color : red">Email Already exist</div>
                         <% }%>

                    </div>
	            <div class="form-group">
	              <input id="password-field" name="password" type="password" class="form-control" placeholder="Mot de passe" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                    <% if(request.getAttribute("errorpassword")!=null){ String errorpassword = request.getAttribute("errorpassword").toString();%>
                    <div  style="color : red"><%=errorpassword%></div>
                    <% }%>
                </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3" style="font-weight: bold;" >S'inscrire</button>
	            </div>
	            <div class="form-group">
                	<a href="LoginServlet"  style="margin-left: 38% ;font-weight: bold;"text-align="center">Se connecter</a>
                </div>
	          </form>
		</section>
    </div>
  </div>


	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

	</body>
</html>