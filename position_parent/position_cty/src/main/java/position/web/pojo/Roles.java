package position.web.pojo;

import org.hibernate.annotations.GenericGenerator;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.DateType;
import xyz.erupt.annotation.sub_field.sub_edit.InputType;
import xyz.erupt.annotation.sub_field.sub_edit.Search;

import javax.persistence.*;
import java.io.Serializable;

/**
 * roles实体类
 *
 * @author Administrator
 */
@Entity
@Table(name = "roles")
@Erupt(name = "Roles")
public class Roles implements Serializable {

    @Id
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator", strategy = "native")
    @Column(name = "id")
    @EruptField
    private Long id;
    @EruptField(
            views = @View(title = "创建时间"),
            edit = @Edit(title = "创建时间", type = EditType.DATE, dateType = @DateType(pickerMode = DateType.PickerMode.HISTORY))
    )
    private java.util.Date createdAt;//created_at
    @EruptField(
            views = @View(title = "更新时间"),
            edit = @Edit(title = "更新时间", type = EditType.DATE, dateType = @DateType(pickerMode = DateType.PickerMode.HISTORY))
    )
    private java.util.Date updatedAt;//updated_at
    @EruptField(
            views = @View(title = "删除时间"),
            edit = @Edit(title = "删除时间", type = EditType.DATE, dateType = @DateType(pickerMode = DateType.PickerMode.HISTORY))
    )
    private java.util.Date deletedAt;//deleted_at

    @EruptField(
            views = @View(title = "角色名"),
            edit = @Edit(title = "角色名", notNull = true, inputType = @InputType, search = @Search(vague = true))
    )
    private String name;//'角色名'


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public java.util.Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(java.util.Date createdAt) {
        this.createdAt = createdAt;
    }

    public java.util.Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(java.util.Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public java.util.Date getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(java.util.Date deletedAt) {
        this.deletedAt = deletedAt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}
