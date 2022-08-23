package position.web.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import position.web.pojo.Positions;
/**
 * positions数据访问接口
 * @author Administrator
 *
 */
public interface PositionsDao extends JpaRepository<Positions,Long>,JpaSpecificationExecutor<Positions>{
	
}
