package com.yhsx.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

//权限表
@Entity
public class Tree implements Serializable {

	private static final long serialVersionUID = -4558472815795894896L;
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO)
	private Integer id; //权限id
	
	private String text; //权限名称
	
	private Integer pid; //权限父id
	
	private String url; //权限路径
	
	@Transient
	//用于控制树是开启状态还是关闭状态
	private String state;
	
	@Transient
	private List<Tree> nodes; //递归查询树

	@Transient
	private Boolean checked; //判断角色拥有的权限拥有选中 true

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<Tree> getNodes() {
		return nodes;
	}

	public void setNodes(List<Tree> nodes) {
		this.nodes = nodes;
	}

	public Boolean getChecked() {
		return checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	@Override
	public String toString() {
		return "Tree{" +
				"id=" + id +
				", text='" + text + '\'' +
				", pid=" + pid +
				", url='" + url + '\'' +
				", state='" + state + '\'' +
				", children="  +
				", checked=" + checked +
				'}';
	}
}
