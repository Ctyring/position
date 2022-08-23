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

import position.web.dao.PositionsDao;
import position.web.pojo.Positions;

/**
 * positions服务层
 * 
 * @author Administrator
 *
 */
@Service
public class PositionsService {

	@Autowired
	private PositionsDao positionsDao;
	
	@Autowired
	private IdWorker idWorker;

	/**
	 * 查询全部列表
	 * @return
	 */
	public List<Positions> findAll() {
		return positionsDao.findAll();
	}

	
	/**
	 * 条件查询+分页
	 * @param whereMap
	 * @param page
	 * @param size
	 * @return
	 */
	public Page<Positions> findSearch(Map whereMap, int page, int size) {
		Specification<Positions> specification = createSpecification(whereMap);
		PageRequest pageRequest =  PageRequest.of(page-1, size);
		return positionsDao.findAll(specification, pageRequest);
	}

	
	/**
	 * 条件查询
	 * @param whereMap
	 * @return
	 */
	public List<Positions> findSearch(Map whereMap) {
		Specification<Positions> specification = createSpecification(whereMap);
		return positionsDao.findAll(specification);
	}

	/**
	 * 根据ID查询实体
	 * @param id
	 * @return
	 */
	public Positions findById(Long id) {
		return positionsDao.findById(id).get();
	}

	/**
	 * 增加
	 * @param positions
	 */
	public void add(Positions positions) {
		// positions.setId( idWorker.nextId()+"" ); 雪花分布式ID生成器
		positionsDao.save(positions);
	}

	/**
	 * 修改
	 * @param positions
	 */
	public void update(Positions positions) {
		positionsDao.save(positions);
	}

	/**
	 * 删除
	 * @param id
	 */
	public void deleteById(Long id) {
		positionsDao.deleteById(id);
	}

	/**
	 * 动态条件构建
	 * @param searchMap
	 * @return
	 */
	private Specification<Positions> createSpecification(Map searchMap) {

		return new Specification<Positions>() {

			@Override
			public Predicate toPredicate(Root<Positions> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> predicateList = new ArrayList<Predicate>();
				
				return cb.and( predicateList.toArray(new Predicate[predicateList.size()]));

			}
		};

	}

}
