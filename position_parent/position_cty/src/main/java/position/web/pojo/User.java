package position.web.pojo;

import xyz.erupt.annotation.Erupt;
import xyz.erupt.annotation.EruptField;
import xyz.erupt.annotation.sub_field.Edit;
import xyz.erupt.annotation.sub_field.EditType;
import xyz.erupt.annotation.sub_field.View;
import xyz.erupt.annotation.sub_field.sub_edit.*;
import xyz.erupt.toolkit.handler.SqlChoiceFetchHandler;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * user实体类
 *
 * @author Administrator
 */
@Entity
@Table(name = "user")
@Erupt(name = "User")
public class User implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	@EruptField(
			views = @View(title = "用户账号")
	)
	private Long id;//id

	@EruptField(
			views = @View(title = "生日"),
			edit = @Edit(title = "生日", type = EditType.DATE, dateType = @DateType(pickerMode = DateType.PickerMode.HISTORY))
	)
	private String birthday;//birthday

	@Lob
	@EruptField(
			edit = @Edit(title = "用户简介", type = EditType.TEXTAREA)
	)
	private String des;//des

	@EruptField(
			views = @View(title = "性别"),
			edit = @Edit(title = "性别", type = EditType.CHOICE,
					choiceType = @ChoiceType(
							vl = {
									@VL(label = "保密", value = "0"),
									@VL(label = "男", value = "1"),
									@VL(label = "女", value = "2"),
							}
					))
	)
	private Integer gender = 0;//gender

	@EruptField(
			views = @View(title = "真实姓名"),
			edit = @Edit(title = "真实姓名", inputType = @InputType, search = @Search(vague = true))
	)
	private String name;//name

	@EruptField(
			edit = @Edit(title = "密码输入", inputType = @InputType(type = "password"))
	)
	private String password;//password

	@EruptField(
			views = @View(title = "头像"),
			edit = @Edit(title = "头像", type = EditType.ATTACHMENT,
					attachmentType = @AttachmentType(type = AttachmentType.Type.IMAGE, maxLimit = 1))
	)
	private String picture;//picture

	@EruptField(
			views = @View(title = "状态"),
			edit = @Edit(title = "状态", type = EditType.CHOICE,
					choiceType = @ChoiceType(
							vl = {
									@VL(label = "正常", value = "0"),
									@VL(label = "冻结", value = "1"),
							}
					))
	)
	private Integer status = 0;//status

	@EruptField(
			views = @View(title = "是否注销"),
			edit = @Edit(title = "是否注销", type = EditType.CHOICE,
					choiceType = @ChoiceType(
							vl = {
									@VL(label = "未注销", value = "0"),
									@VL(label = "已注销", value = "1"),
							}
					))
	)
	private Integer delFlag = 0;//delFlag

	@EruptField(
			views = @View(title = "角色"),
			edit = @Edit(
					notNull = true,
					search = @Search,
					title = "角色",
					type = EditType.CHOICE,
					choiceType = @ChoiceType(
							fetchHandler = SqlChoiceFetchHandler.class,
							//参数一必填，表示sql语句
							//参数二可不填，表示缓存时间，默认为3000毫秒，1.6.10及以上版本支持
							fetchHandlerParams = {"select id, name from roles", "5000"}
					))
	)
	private Long role;

	@EruptField(
			views = @View(title = "openid")
	)
	private String openid;

	@EruptField(
			views = @View(title = "邮箱"),
			edit = @Edit(title = "邮箱", notNull = true, inputType = @InputType, search = @Search(vague = true))
	)
	private String email;

	@EruptField(
			views = @View(title = "用户名"),
			edit = @Edit(title = "用户名", notNull = true, inputType = @InputType, search = @Search(vague = true))
	)
	private String username;

	@EruptField(
			views = @View(title = "创建时间"),
			edit = @Edit(title = "创建时间", type = EditType.DATE, dateType = @DateType(pickerMode = DateType.PickerMode.HISTORY))
	)
	private Date createTime;

	@EruptField(
			views = @View(title = "盐")
	)
	private String salt;

	public Integer getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public Long getRole() {
		return role;
	}

	public void setRole(Long role) {
		this.role = role;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
