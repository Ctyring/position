package position.web.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import position.web.pojo.User;

/**
 * user数据访问接口
 *
 * @author Administrator
 */
public interface UserDao extends JpaRepository<User, Long>, JpaSpecificationExecutor<User> {

    User findUserByEmail(String email);

    User findUserByUsername(String email);
}
