package position.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import position.web.cty.util.IdWorker;
import position.web.dao.UserPositionDao;
import position.web.pojo.UserPosition;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author cty
 * @date 2022/8/23
 */
@Service
public class UserPositionService {

    @Autowired
    private UserPositionDao userPositionDao;

    @Autowired
    private IdWorker idWorker;

    /**
     * 查询全部列表
     * @return
     */
    public List<UserPosition> findAll() {
        return userPositionDao.findAll();
    }


    /**
     * 条件查询+分页
     * @param whereMap
     * @param page
     * @param size
     * @return
     */
    public Page<UserPosition> findSearch(Map whereMap, int page, int size) {
        Specification<UserPosition> specification = createSpecification(whereMap);
        PageRequest pageRequest =  PageRequest.of(page-1, size);
        return userPositionDao.findAll(specification, pageRequest);
    }


    /**
     * 条件查询
     * @param whereMap
     * @return
     */
    public List<UserPosition> findSearch(Map whereMap) {
        Specification<UserPosition> specification = createSpecification(whereMap);
        return userPositionDao.findAll(specification);
    }

    /**
     * 根据ID查询实体
     * @param id
     * @return
     */
    public UserPosition findById(Long id) {
        return userPositionDao.findById(id).get();
    }

    /**
     * 增加
     * @param userPosition
     */
    public void add(UserPosition userPosition) {
        // UserPosition.setId( idWorker.nextId()+"" ); 雪花分布式ID生成器
        userPositionDao.save(userPosition);
    }

    /**
     * 修改
     * @param userPosition
     */
    public void update(UserPosition userPosition) {
        userPositionDao.save(userPosition);
    }

    /**
     * 删除
     * @param id
     */
    public void deleteById(Long id) {
        userPositionDao.deleteById(id);
    }

    /**
     * 动态条件构建
     * @param searchMap
     * @return
     */
    private Specification<UserPosition> createSpecification(Map searchMap) {

        return new Specification<UserPosition>() {

            @Override
            public Predicate toPredicate(Root<UserPosition> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicateList = new ArrayList<Predicate>();

                return cb.and( predicateList.toArray(new Predicate[predicateList.size()]));

            }
        };

    }

}
