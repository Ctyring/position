package position.web.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import position.web.pojo.Tags;
/**
 * tags数据访问接口
 * @author Administrator
 *
 */
public interface TagsDao extends JpaRepository<Tags,Long>,JpaSpecificationExecutor<Tags>{
	
}
