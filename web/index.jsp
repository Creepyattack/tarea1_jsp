<%-- 
    Document   : index
    Created on : 7 oct. 2022, 09:56:29
    Author     : ppbet
--%>
<%@page import="model.Estudiante" %>
<%@page import="model.Tipos" %>
<%@page import="javax.swing.table.DefaultTableModel" %>
<%@page import="java.util.HashMap" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Estudiante</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    </head>
    <body>     
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand/logo -->
  <a class="navbar-brand" href="#">Jose Alberto Najera Mendez</a>
  
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">Inicio</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Nosotros</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Contacto</a>
    </li>
    
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        Sub Menu
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="#">Nada aqui</a>
        <a class="dropdown-item" href="#">Nada aqui</a>
        <a class="dropdown-item" href="#">Nada aqui</a>
    
     <li class="nav-item">
      <a class="nav-link" href="#">Ubicacion</a>
    </li>
  </ul>
</nav>
        
        
       <h1>Formulario Estudiantes</h1>
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal_estudiante" onclick="limpiar()">Nuevo</button>
        
    <div class="container">
            <div class="modal" id="modal_estudiante">
    <div class="modal-dialog">
      <div class="modal-content">
      

        
        
        <!-- Modal body -->
        <div class="modal-body">
           <form action="sr_estudiante" method="puts" class="form-group" >
                <label for="lbl_id"><b>ID:</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value = "0" readonly>
                <br>
                <label for="lbl_carnet"><b>Carnet:</b></label>
                <input type="text" name="txt_carnet" id="txt_carnet" class="form-control" placeholder="Ejemplo: E001" required >
                <br>
                <label for="lbl_nombres"><b>Nombres:</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2" required >
                <br>
                <label for="lbl_apellidos"><b>Apellidos:</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Apellido1 Apellido2" required >
                <br>
                <label for="lbl_direccion"><b>Direccion:</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: No. Casa Calle Zona Ciudad" required >
                <br>
                <label for="lbl_telefono"><b>Telefono:</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555555555" required >
                <br>
                <label for="lbl_correo"><b>Correo:</b></label>
                <input type="text" name="txt_correo" id="txt_correo" class="form-control" placeholder="juanito@gmail.com" required >
                <br>
                <label for="lbl_sangre"><b>Sangre:</b></label>
                <select name="drop_sangre" id="drop_sangre" class="form-control">
                    <%
                        Tipos tipos = new Tipos();
                        HashMap<String,String> drop = tipos.drop_sangre();
                        for(String i: drop.keySet()){
                            out.println("<option value='"+ i +"' >"+ drop.get(i) +"</option>");
                        }
                    %>
                </select>
                <br>
                <label for="lbl_fn"><b>Fecha de Nacimiento:</b></label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" required >
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                 <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                 <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('Desea Eliminar?'))return false">Eliminar</button>
                 <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
            </form>
        </div>
      </div>
    </div>
  </div>
 </div>
        
 <table class="table table-striped">
    <thead>
      <tr>
        <th>Carnet</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Correo</th>
        <th>Sangre</th>
        <th>Nacimiento</th>
      </tr>
    </thead>
    <tbody id="tbl_estudiantes">
        <% 
        Estudiante estudiante = new Estudiante();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = estudiante.leer();
        for(int t=0; t<tabla.getRowCount();t++){
            out.println("<tr data-id=" + tabla.getValueAt(t,0) + " data-id_s=" + tabla.getValueAt(t,7) + " >");
            out.println("<td>" + tabla.getValueAt(t,1) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,2) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,3) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,4) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,5) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,6) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,8) + "</td>");
            out.println("<td>" + tabla.getValueAt(t,9) + "</td>");
            out.println("</tr>");
        
            }
        %>
    
    </tbody>
  </table>         
        
        
        
                <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
                     <!-- Brand/logo -->
                       <a class="navbar-brand" href="#">Desarrollo web: Jose Alberto Najera Mendez</a>
                </nav>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
         <script type="text/javascript">
            function limpiar(){
               $("#txt_id").val(0);
               $("#txt_carnet").val('');
               $("#txt_nombres").val('');
               $("#txt_apellidos").val('');
               $("#txt_direccion").val();
               $("#txt_telefono").val('');
               $("#txt_correo").val('');
               $("#drop_sangre").val('');
               $("#txt_fn").val(''); 
            }
            $('#tbl_estudiantes').on('click','tr td',function(evt){
               var target,id,id_s,carnet,nombres,apellidos,direccion,telefono,correo,nacimiento;
               target = $(event.target);
               id = target.parent().data('id');
               id_s = target.parent().data('id_s');
               carnet = target.parent("tr").find("td").eq(0).html(); 
               nombres = target.parent("tr").find("td").eq(1).html();
               apellidos = target.parent("tr").find("td").eq(2).html(); 
               direccion = target.parent("tr").find("td").eq(3).html();
               telefono = target.parent("tr").find("td").eq(4).html();
               correo = target.parent("tr").find("td").eq(5).html();
               nacimiento = target.parent("tr").find("td").eq(7).html();
               
               $("#txt_id").val(id);
               $("#txt_carnet").val(carnet);
               $("#txt_nombres").val(nombres);
               $("#txt_apellidos").val(apellidos);
               $("#txt_direccion").val(direccion);
               $("#txt_telefono").val(telefono);
               $("#txt_correo").val(correo);
               $("#drop_sangre").val(id_s);
               $("#txt_fn").val(nacimiento);
               $("#modal_estudiante").modal('show');
            });
            </script>
    </body>
</html>
