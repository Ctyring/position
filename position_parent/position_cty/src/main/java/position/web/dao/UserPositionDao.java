package position.web.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import position.web.pojo.User;
import position.web.pojo.UserPosition;

/**
 * @author cty
 * @date 2022/8/23
 */
public interface UserPositionDao extends JpaRepository<UserPosition, Long>, JpaSpecificationExecutor<UserPosition> {

}
