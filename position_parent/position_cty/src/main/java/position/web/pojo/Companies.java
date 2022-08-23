package position.web.pojo;

import io.swagger.annotations.ApiModel;
import org.hibernate.annotations.GenericGenerator;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.*;

import javax.persistence.*;
import java.io.Serializable;
/**
 * companies实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="companies")
@Erupt(name = "Companies")
public class Companies implements Serializable{

	@Id
	@GeneratedValue(generator = "generator")
	@GenericGenerator(name = "generator", strategy = "native")
	@Column(name = "id")
	@EruptField
	private Long id;//id
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
			views = @View(title = "公司名"),
			edit = @Edit(title = "公司名", notNull = true, inputType = @InputType, search = @Search(vague = true))
	)
	private String name;//'公司名'
	@EruptField(
			views = @View(title = "用户ID"),
			edit = @Edit(title = "用户ID", notNull = true, inputType = @InputType, search = @Search(vague = true))
	)
	private Long userId;//'用户ID'
	@EruptField(
			views = @View(title = "状态"),
			edit = @Edit(title = "状态", type = EditType.CHOICE,
					choiceType = @ChoiceType(
							vl = {
									@VL(label = "未知", value = "0"),
									@VL(label = "已上市", value = "1"),
									@VL(label = "未上市", value = "2"),
							}
					))
	)
	private Long status;//'状态'
	@EruptField(
			views = @View(title = "公司简介"),
			edit = @Edit(title = "公司简介", notNull = true, inputType = @InputType, search = @Search(vague = true))
	)
	private String details;

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

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

	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}


	
}
