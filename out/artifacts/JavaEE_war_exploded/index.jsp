<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.firstProject.db.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    + Добавить задание
                </button>

                <!-- Modal -->
                <form action="/add-task" method="post">
                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Новое Задание</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <label>Наименование : </label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <input placeholder="Наименование" type="text" class="form-control" name="task_name">
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <label>Описание : </label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <textarea placeholder="Описание" type="text" class="form-control" name="task_description" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <label>Крайний срок :</label>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-12">
                                            <input type="date" class="form-control" name="task_deadline_date">
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                    <button type="submit" class="btn btn-primary">Добавить</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <table class="table table-hover table-striped mt-2">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Наименование</th>
                            <th>Крайний срок</th>
                            <th>Выполнено</th>
                            <th>Детали</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("tasks");
                            if (tasks!=null){
                                for (Tasks task : tasks){
                        %>
                                <tr>
                                    <td><%=task.getId()%></td>
                                    <td><%=task.getName()%></td>
                                    <td><%=task.getDeadlineDate()%></td>
                                    <td><%=task.getDone()%></td>
                                    <td><a href="/details?task_id=<%=task.getId()%>" class="btn btn-primary">Детали</a></td>
                                </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
