
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/stylelogin.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <div class="loginBox"> <img class="user" src="https://i.ibb.co/yVGxFPR/2.png" height="100px" width="100px">
            <h3>Ingresar</h3>
            <form action="svUsuario" method="POST">
                <div class="inputBox"> <input id="uname" type="text" name="usuario" placeholder="Usuario"> <input id="pass" type="password" name="contrasenia" placeholder="Contraseña"> </div> 

                <input type="submit" name="" value="Login">
            </form>
        </div>
    </body>
 </html>
