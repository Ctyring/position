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
import position.web.dao.CompaniesDao;
import position.web.pojo.Companies;

/**
 * companies服务层
 * 
 * @author Administrator
 *
 */
@Service
public class CompaniesService {

	@Autowired
	private CompaniesDao companiesDao;
	
	@Autowired
	private IdWorker idWorker;

	/**
	 * 查询全部列表
	 * @return
	 */
	public List<Companies> findAll() {
		return companiesDao.findAll();
	}

	
	/**
	 * 条件查询+分页
	 * @param whereMap
	 * @param page
	 * @param size
	 * @return
	 */
	public Page<Companies> findSearch(Map whereMap, int page, int size) {
		Specification<Companies> specification = createSpecification(whereMap);
		PageRequest pageRequest =  PageRequest.of(page-1, size);
		return companiesDao.findAll(specification, pageRequest);
	}

	
	/**
	 * 条件查询
	 * @param whereMap
	 * @return
	 */
	public List<Companies> findSearch(Map whereMap) {
		Specification<Companies> specification = createSpecification(whereMap);
		return companiesDao.findAll(specification);
	}

	/**
	 * 根据ID查询实体
	 * @param id
	 * @return
	 */
	public Companies findById(Long id) {
		return companiesDao.findById(id).get();
	}

	/**
	 * 增加
	 * @param companies
	 */
	public void add(Companies companies) {
		// companies.setId( idWorker.nextId()+"" ); 雪花分布式ID生成器
		companiesDao.save(companies);
	}

	/**
	 * 修改
	 * @param companies
	 */
	public void update(Companies companies) {
		companiesDao.save(companies);
	}

	/**
	 * 删除
	 * @param id
	 */
	public void deleteById(Long id) {
		companiesDao.deleteById(id);
	}

	/**
	 * 动态条件构建
	 * @param searchMap
	 * @return
	 */
	private Specification<Companies> createSpecification(Map searchMap) {

		return new Specification<Companies>() {

			@Override
			public Predicate toPredicate(Root<Companies> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicateList = new ArrayList<Predicate>();
				
				return cb.and( predicateList.toArray(new Predicate[predicateList.size()]));

			}
		};

	}

}
