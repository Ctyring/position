package position.web.pojo;

import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;
import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.toolkit.handler.SqlChoiceFetchHandler;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * positions实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="positions")
@Erupt(name = "Positions")
public class Positions implements Serializable{

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
			views = @View(title = "职位名"),
			edit = @Edit(title = "职位名", notNull = true, inputType = @InputType, search = @Search(vague = true))
	)
	private String name;//'职位名'

	@EruptField(
			views = @View(title = "用户ID", sortable = true),
			edit = @Edit(title = "用户ID", search = @Search(vague = true), notNull = true)
	)
	private Long userId;//'用户ID'
	@EruptField(
			views = @View(title = "公司ID"),
			edit = @Edit(
					notNull = true,
					search = @Search,
					title = "公司ID",
					type = EditType.CHOICE,
					choiceType = @ChoiceType(
							fetchHandler = SqlChoiceFetchHandler.class,
							//参数一必填，表示sql语句
							//参数二可不填，表示缓存时间，默认为3000毫秒，1.6.10及以上版本支持
							fetchHandlerParams = {"select id, name from companies", "5000"}
					))
	)
	private Long companyId;//'公司ID'
	@EruptField(
			views = @View(title = "最低薪资"),
			edit = @Edit(title = "最低薪资", notNull = true, inputType = @InputType, search = @Search(vague = true))
	)
	private String minSalary;//'最低薪资'
	@EruptField(
			views = @View(title = "最高薪资"),
			edit = @Edit(title = "最高薪资", notNull = true, inputType = @InputType, search = @Search(vague = true))
	)
	private String maxSalary;//'最高薪资'
	@EruptField(
			views = @View(title = "固定薪资"),
			edit = @Edit(title = "固定薪资", notNull = true, inputType = @InputType, search = @Search(vague = true))
	)
	private String fixedSalary;//'固定薪资'
	@EruptField(
			views = @View(title = "职位描述"),
			edit = @Edit(title = "职位描述", notNull = true, inputType = @InputType, search = @Search(vague = true))
	)
	private String detail;//'职位描述'

	@EruptField(
			views = @View(title = "状态"),
			edit = @Edit(title = "状态", type = EditType.CHOICE,
					choiceType = @ChoiceType(
							vl = {
									@VL(label = "未开始", value = "0"),
									@VL(label = "正在招聘", value = "1"),
									@VL(label = "已结束", value = "2"),
							}
					))
	)
	private Long status;//'状态'
	
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

	public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getMinSalary() {
		return minSalary;
	}
	public void setMinSalary(String minSalary) {
		this.minSalary = minSalary;
	}

	public String getMaxSalary() {
		return maxSalary;
	}
	public void setMaxSalary(String maxSalary) {
		this.maxSalary = maxSalary;
	}

	public String getFixedSalary() {
		return fixedSalary;
	}
	public void setFixedSalary(String fixedSalary) {
		this.fixedSalary = fixedSalary;
	}

	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Long getStatus() {
		return status;
	}
	public void setStatus(Long status) {
		this.status = status;
	}


	
}
