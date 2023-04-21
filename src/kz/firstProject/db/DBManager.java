package kz.firstProject.db;

import java.util.ArrayList;

public class DBManager {

    private static final ArrayList<Tasks> tasks = new ArrayList<>();

    private static long id = 6L;

    static {
        tasks.add(
                new Tasks(1L,
                        "Создать веб приложение",
                        "создать на Java EE",
                        "2022-05-01",
                        "Нет"
                )
        );
        tasks.add(
                new Tasks(2L,
                        "Убраться дома и закупить продукты",
                        "Убраться дома и закупить продукты",
                        "2022-05-01",
                        "Нет"
                )
        );
        tasks.add(
                new Tasks(3L,
                        "Записаться на качку",
                        "Записаться на качку чтобы быть мускулистым",
                        "2022-05-01",
                        "Нет"
                )
        );
        tasks.add(
                new Tasks(4L,
                        "Выполнить домашнее задание",
                        "выполнить все домашнее задание",
                        "2022-05-01",
                        "Нет"
                )
        );
        tasks.add(
                new Tasks(5L,
                        "Учить Итальянский",
                        "Итальянский",
                        "2022-05-01",
                        "Нет"
                )
        );
    }

    public static ArrayList<Tasks> getAllTasks() {
        return tasks;
    }

    public static Tasks getTask(Long id) {
        return tasks.stream().filter(task -> task.getId() == id).findFirst().orElse(null);
    }

    public static void deleteTask(Long id) {
        Tasks deleteTask = tasks.stream().filter(task -> task.getId() == id).findFirst().orElse(null);
        if (deleteTask != null) {
            tasks.remove(deleteTask);
        }
    }

    public static void addTask(Tasks task) {
        task.setId(id);
        tasks.add(task);
        id++;
    }

    public static void updateTask(Tasks task) {
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId() == task.getId()) {
                tasks.set(i, task);
                break;
            }
        }
    }

}
