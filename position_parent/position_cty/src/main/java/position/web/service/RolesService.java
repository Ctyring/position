package position.web.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import position.web.cty.util.IdWorker;

import position.web.dao.RolesDao;
import position.web.pojo.Roles;

/**
 * roles服务层
 * 
 * @author Administrator
 *
 */
@Service
public class RolesService {

	@Autowired
	private RolesDao rolesDao;
	
	@Autowired
	private IdWorker idWorker;

	/**
	 * 查询全部列表
	 * @return
	 */
	public List<Roles> findAll() {
		return rolesDao.findAll();
	}

	
	/**
	 * 条件查询+分页
	 * @param whereMap
	 * @param page
	 * @param size
	 * @return
	 */
	public Page<Roles> findSearch(Map whereMap, int page, int size) {
		Specification<Roles> specification = createSpecification(whereMap);
		PageRequest pageRequest =  PageRequest.of(page-1, size);
		return rolesDao.findAll(specification, pageRequest);
	}

	
	/**
	 * 条件查询
	 * @param whereMap
	 * @return
	 */
	public List<Roles> findSearch(Map whereMap) {
		Specification<Roles> specification = createSpecification(whereMap);
		return rolesDao.findAll(specification);
	}

	/**
	 * 根据ID查询实体
	 * @param id
	 * @return
	 */
	public Roles findById(Long id) {
		return rolesDao.findById(id).get();
	}

	/**
	 * 增加
	 * @param roles
	 */
	public void add(Roles roles) {
		// roles.setId( idWorker.nextId()+"" ); 雪花分布式ID生成器
		rolesDao.save(roles);
	}

	/**
	 * 修改
	 * @param roles
	 */
	public void update(Roles roles) {
		rolesDao.save(roles);
	}

	/**
	 * 删除
	 * @param id
	 */
	public void deleteById(Long id) {
		rolesDao.deleteById(id);
	}

	/**
	 * 动态条件构建
	 * @param searchMap
	 * @return
	 */
	private Specification<Roles> createSpecification(Map searchMap) {

		return new Specification<Roles>() {

			@Override
			public Predicate toPredicate(Root<Roles> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicateList = new ArrayList<Predicate>();
				
				return cb.and( predicateList.toArray(new Predicate[predicateList.size()]));

			}
		};

	}

}
