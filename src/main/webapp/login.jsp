<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="false" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	  integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	  crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/brands.min.css"
	  integrity="sha512-9YHSK59/rjvhtDcY/b+4rdnl0V4LPDWdkKceBl8ZLF5TB6745ml1AfluEU6dFWqwDw9lPvnauxFgpKvJqp7jiQ=="
	  crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css"   href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"  href="plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" type="text/css"  href="plugins/fontawesome/css/all.min.css">

<link rel="icon" type="image/png" href="images/logo1.png">
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

	</head>
  <body class="img js-fullheight" style="background-image: url(images/kkkkkk.jpg)">


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
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section" style="font-weight: bold;">Connexion</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">

		      	<form action="LoginServlet" method="POST" class="signin-form">
		      	  <%--  <% if(request.getAttribute("errMessage")!=null){ String error = request.getAttribute("errMessage").toString();%>
                    <div  style="color : red"><%=error%></div>
                    <% }%>--%>

					<% if(request.getAttribute("errMessage")!=null){ String error = request.getAttribute("errMessage").toString();%>
					<div th:if="${error}" class="error-message alert-danger" style="justify-content: center; width:70%; border-radius: 4px; border-left: 6px solid #FF002D; background-color: #fffbe2; color: #FF002D; margin-left: auto; margin-right: auto; text-align: center;">
						<i class="fa-regular fa-bell" th:if="${error}"></i>
						<p th:text="${error}"></p>
						<%=error%></div>
					<% }%>
                    <div class="form-group">
		      			<input type="text" name="email"  class="form-control" placeholder="E-mail" required>
                    </div>
	            <div class="form-group">
	              <input id="password-field" name="password" type="password" class="form-control" placeholder="Mot de passe" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password" ></span>
                </div>
	            <div class="form-group">
	            	<button type="submit" class="  form-control btn btn-primary submit px-3" style="font-weight: bold;">Se connecter</button>
	            </div>

	            <div class="form-group">
	            	<a href="RegisterServlet"  style="font-weight: bold;margin-left: 10% ;">Pas encore de compte ? inscrivez vous</a>
	            </div>
	          </form>
		</div>
	</section>


<script src="js/jquery.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/popper.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>

	</body>
</html>


<%--

<!doctype html>
<html lang="en">
<head>
	<title>Connexion</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/menu.css">
	<style>
		#password-field::placeholder {
			color: black; /* Remplacez cette valeur par la couleur que vous souhaitez utiliser pour l'attribut placeholder */
		}
	</style>
</head>
<body>
<section class="" style="background-color: #14303C;height: 100%; ">
	<div class="container py-5 h-100" style="background-color: #14303C">
		<div class="row d-flex  align-items-center " style="margin-top: 1%; background-color: #14303C">
			<div class="col col-xl-10">
				<div class="card" style="border-radius: 1rem; width: 100%;border-right: #fcf8e3 ;background-color: #14303C">
					<div class="row g-0">

						<div class="col-md-6 col-lg-6 d-none d-md-block" style="background-color: #14303C;">
							<img src="images/photo.jpg" alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; height: 100%; width: 100%" />
						</div>

						<div class="col-md-6 col-lg-6  d-flex align-items-center align-items-start" style="background-color: #14303C; width: 50% ;">
							<div class="card-body p-4 p-lg-5 text-black" style="margin-top: 0.2px;" >

								<form action="LoginServlet" method="POST" class="signin-form">

									<div class="d-flex align-items-center mb-3 pb-1" style="margin-top: 1%">
										<img src="images/ff.jpg" alt="login form" class="img-fluid" style=" width:40%;height: 40%;border-radius: 1rem 0 0 1rem; " />

									</div>
									<h2 class="heading-section" style="color: #E2834C; margin-top: 1%;">Connexion</h2>




									<div data-mdb-input-init class=" mb-4">
										<input type="text" name="email" style="border-color: #E2834C;" class="form-control form-control-lg  " placeholder="E-mail" required>

									</div>

									<div data-mdb-input-init class="form-outline mb-4">
										<input id="password-field" name="password" type="password" style="border-color: #E2834C;" class="form-control form-control-lg" placeholder="Mot de passe" required>
										<span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password" style="color: transparent"></span>
									</div>

									<div class="pt-1 mb-4">
										<button data-mdb-button-init data-mdb-ripple-init type="submit"  style="background-color: #E2834C; color: white" class="form-control btn btn-dark btn-lg btn-block submit ">Se connecter</button>

									</div>

									<p >
										<a href="RegisterServlet"  style="color: #E2834C;" text-align="center">Pas encore de compte ? inscrivez vous</a>
										</p>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</body>
</html>--%>
