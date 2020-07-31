package sample.library;

import java.util.Date;

public class TodoItem {

    private long id;
    private String description;
    private boolean done;

    public TodoItem(String description) {
        this.id = new Date().getTime();
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }
}

