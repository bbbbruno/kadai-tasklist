package models;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "tasks")
@NamedQueries({
    @NamedQuery(
            name = "getAllTasks",
            query = "SELECT t FROM Tasks AS t ORDER BY t.id DESC"
            ),
    @NamedQuery(
            name = "getTasksCount",
            query = "SELECT COUNT(t) FROM Tasks AS t"
            ),
})
@Entity
public class Tasks {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "content", length = 15, nullable = false )
    private String content;

    @Column(name = "deadline", nullable = false)
    private Date deadline;

    @Column(name = "progress", nullable = false)
    private Integer progress;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public Integer getProgress() {
        return progress;
    }

    public void setProgress(Integer progress) {
        this.progress = progress;
    }
}
