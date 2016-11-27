<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0040)http://getbootstrap.com/examples/cover/# -->
<!-- 
 * parallax_login.html
 * @Author original @msurguy (tw) -> http://bootsnipp.com/snippets/featured/parallax-login-form
 * @Tested on FF && CH
 * @Reworked by @kaptenn_com (tw)
 * @package PARALLAX LOGIN.
-->
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/assets/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/views/assets/css/cover.css" />
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="wrap">
					<p class="form-title">Área administrativa</p>
					<form class="login" action="menu" method="post">
						<input type="text" placeholder="Usuário" /> <input
							type="password" placeholder="Senha" /> <input type="submit"
							value="Entrar" class="btn btn-success btn-sm" />
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>