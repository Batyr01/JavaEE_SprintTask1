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
        <%
            Tasks task = (Tasks) request.getAttribute("task");
            if (task!=null){
        %>
            <div class="row">
                <div class="col-6 mx-auto">
                    <div class="row">
                        <div class="col-12">
                            <label>Наименование : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input value="<%=task.getName()%>" type="text" class="form-control" name="task_name" readonly>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-12">
                            <label>Описание : </label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <textarea type="text" class="form-control" name="task_description" rows="5" readonly><%=task.getDescription()%></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Крайний срок :</label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <input value="<%=task.getDeadlineDate()%>" type="date" class="form-control" name="task_deadline_date" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <label>Выполнено :</label>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <select class="form-select" name="task_done">
                                <option <%=(task.getDone().equals("Да")?"selected":"")%> value="Да">Да</option>
                                <option <%=(task.getDone().equals("Нет")?"selected":"")%> value="Нет">Нет</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-2">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal">
                                Изменить
                            </button>
                        </div>
                        <div class="col-2">
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                                Удалить
                            </button>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Modal Delete -->
            <form action="/delete-task" method="post">
                <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="deleteModalLabel">Подтвердить Удаление</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <input type="hidden" name="task_id" value="<%=task.getId()%>">
                            <div class="modal-body">
                                <h4>Вы Уверены?</h4>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                                <button type="submit" class="btn btn-danger">Да</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- Modal Delete -->

            <!-- Modal Edit -->
            <form action="/save-task" method="post">
                <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="editModalLabel">Изменить Задание</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <input type="hidden" name="task_id" value="<%=task.getId()%>">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-12">
                                        <label>Наименование : </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input value="<%=task.getName()%>" type="text" class="form-control" name="task_name" >
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-12">
                                        <label>Описание : </label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <textarea type="text" class="form-control" name="task_description" rows="5" ><%=task.getDescription()%></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label>Крайний срок :</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <input value="<%=task.getDeadlineDate()%>" type="date" class="form-control" name="task_deadline_date" >
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label>Выполнено :</label>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-12">
                                        <select class="form-select" name="task_done">
                                            <option <%=(task.getDone().equals("Да")?"selected":"")%> value="Да">Да</option>
                                            <option <%=(task.getDone().equals("Нет")?"selected":"")%> value="Нет">Нет</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                <button type="submit" class="btn btn-primary">Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        <!-- Modal Edit -->
        <%
            }else {
        %>
                <h3 class="text-center">Task Not Found</h3>
        <%
            }
        %>
    </div>
</body>
</html>
