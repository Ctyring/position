package position.web.handler;

import position.web.cty.redis.listener.RedisListener;
import position.web.cty.util.BaseMap;
import position.web.loader.DynamicRouteLoader;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 路由刷新监听
 */
@Slf4j
@Component
public class LoderRouderHandler implements RedisListener {

    @Resource
    private DynamicRouteLoader dynamicRouteLoader;


    @Override
    public void onMessage(BaseMap message) {
        dynamicRouteLoader.refresh(message);
    }

}