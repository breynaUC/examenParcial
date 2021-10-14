<%-- 
    Document   : index
    Created on : 15 set. 2021, 21:47:18
    Author     : BReyna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="recursos/faw/web-fonts-with-css/css/fontawesome-all.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="recursos/css/post.css"/>
    </head>
    <body>
        <div class="container media">
            <button class="btn btn-success" style="margin-bottom: 10px" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><i class="fa fa-plus" aria-hidden="true"></i></button>
            <table class="table" id="tablita">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">ID</th>
                        <th scope="col">TITULO</th>
                        <th scope="col">DESCRIPCION</th>
                        <th scope="col" colspan="2">ACCION</th>
                    </tr>
                </thead>
                <tbody>                    
                </tbody>
            </table>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">New Post</h5>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <label for="recipient-name" class="col-form-label">Título</label>
                                <input type="text" class="form-control" id="titulo">
                            </div>
                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Desacripción</label>
                                <textarea class="form-control" id="desc"></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="formsave()">Send Post</button>
                    </div>
                </div>
            </div>
        </div>
        <script src="recursos/js/jquery-3.3.1.min.js"></script>        
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
        <script>
                            $(document).ready(function () {
                                listar();
                               
                            });
                            function listar() {
                                $.get("pc", {"op": 1}, function (data) {
                                    var x = JSON.parse(data);
                                    $("#tablita tbody tr").remove();
                                    for (var i = 0; i < x.length; i++) {
                                        var fila = "<tr><td>" + (i + 1) + "</td><td>" + x[i].idpost + "</td><td>" + x[i].titulo + "</td><td>" + x[i].descripcion + "</td><td><a href='#' onclick='editar(" + x[i].idpost + ")' class='text-warning'><i class='far fa-edit'></i></a></td><td><a href='#' onclick='eliminar(" + x[i].idpost + ")' class='text-danger'><i class='fas fa-trash-alt'></i></a></td></tr>";
                                        $("#tablita").append(fila);
                                    }

                                });
                            }
                            $('#exampleModal').on('show.bs.modal', function (event) {
                                var button = $(event.relatedTarget); // Button that triggered the modal
                                var modal = $(this);
                                modal.find('.modal-title').text('New Post');
                            });
                            function formsave() {
                             
                                var titulo = $("#titulo").val();
                                var desc = $("#desc").val();
                                alert(titulo+" "+desc);
                                $.post("pc", {"op":2, "titulo": titulo, "desc": desc}, function (data) {
                                    listar();
                                });
                                $('#exampleModal').modal('hide');
                            }

        </script>
    </body>
</html>
