package position.web.cty.redis.listener;

import position.web.cty.util.BaseMap;

/**
 * 自定义消息监听
 */
public interface RedisListener {

    void onMessage(BaseMap message);
}
