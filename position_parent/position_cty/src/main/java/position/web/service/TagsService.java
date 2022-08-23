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

import position.web.dao.TagsDao;
import position.web.pojo.Tags;

/**
 * tags服务层
 * 
 * @author Administrator
 *
 */
@Service
public class TagsService {

	@Autowired
	private TagsDao tagsDao;
	
	@Autowired
	private IdWorker idWorker;

	/**
	 * 查询全部列表
	 * @return
	 */
	public List<Tags> findAll() {
		return tagsDao.findAll();
	}

	
	/**
	 * 条件查询+分页
	 * @param whereMap
	 * @param page
	 * @param size
	 * @return
	 */
	public Page<Tags> findSearch(Map whereMap, int page, int size) {
		Specification<Tags> specification = createSpecification(whereMap);
		PageRequest pageRequest =  PageRequest.of(page-1, size);
		return tagsDao.findAll(specification, pageRequest);
	}

	
	/**
	 * 条件查询
	 * @param whereMap
	 * @return
	 */
	public List<Tags> findSearch(Map whereMap) {
		Specification<Tags> specification = createSpecification(whereMap);
		return tagsDao.findAll(specification);
	}

	/**
	 * 根据ID查询实体
	 * @param id
	 * @return
	 */
	public Tags findById(Long id) {
		return tagsDao.findById(id).get();
	}

	/**
	 * 增加
	 * @param tags
	 */
	public void add(Tags tags) {
		// tags.setId( idWorker.nextId()+"" ); 雪花分布式ID生成器
		tagsDao.save(tags);
	}

	/**
	 * 修改
	 * @param tags
	 */
	public void update(Tags tags) {
		tagsDao.save(tags);
	}

	/**
	 * 删除
	 * @param id
	 */
	public void deleteById(Long id) {
		tagsDao.deleteById(id);
	}

	/**
	 * 动态条件构建
	 * @param searchMap
	 * @return
	 */
	private Specification<Tags> createSpecification(Map searchMap) {

		return new Specification<Tags>() {

			@Override
			public Predicate toPredicate(Root<Tags> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicateList = new ArrayList<Predicate>();
				
				return cb.and( predicateList.toArray(new Predicate[predicateList.size()]));

			}
		};

	}

}
