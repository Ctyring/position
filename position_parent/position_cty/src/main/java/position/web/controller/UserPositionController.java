package position.web.controller;

import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.*;
import position.web.cty.entity.PageResult;
import position.web.cty.entity.Result;
import position.web.cty.entity.StatusCode;
import position.web.pojo.UserPosition;
import position.web.service.UserPositionService;

import java.util.Map;

/**
 * @author cty
 * @date 2022/8/23
 */
@RestController
@CrossOrigin
@RequestMapping("/userposition")
@Api(tags = "职位审核管理")
public class UserPositionController {

    @Autowired
    private UserPositionService userPositionService;


    /**
     * 查询全部数据
     * @return
     */
    @RequestMapping(method= RequestMethod.GET)
    public Result findAll(){
        return new Result(true, StatusCode.OK,"查询成功",userPositionService.findAll());
    }

    /**
     * 根据ID查询
     * @param id ID
     * @return
     */
    @RequestMapping(value="/{id}",method= RequestMethod.GET)
    public Result findById(@PathVariable Long id){
        return new Result(true,StatusCode.OK,"查询成功",userPositionService.findById(id));
    }


    /**
     * 分页+多条件查询
     * @param searchMap 查询条件封装
     * @param page 页码
     * @param size 页大小
     * @return 分页结果
     */
    @RequestMapping(value="/search/{page}/{size}",method=RequestMethod.POST)
    public Result findSearch(@RequestBody Map searchMap , @PathVariable int page, @PathVariable int size){
        Page<UserPosition> pageList = userPositionService.findSearch(searchMap, page, size);
        return  new Result(true,StatusCode.OK,"查询成功",  new PageResult<UserPosition>(pageList.getTotalElements(), pageList.getContent()) );
    }

    /**
     * 根据条件查询
     * @param searchMap
     * @return
     */
    @RequestMapping(value="/search",method = RequestMethod.POST)
    public Result findSearch( @RequestBody Map searchMap){
        return new Result(true,StatusCode.OK,"查询成功",userPositionService.findSearch(searchMap));
    }

    /**
     * 增加
     * @param userPosition
     */
    @RequestMapping(method=RequestMethod.POST)
    public Result add(@RequestBody UserPosition userPosition  ){
        userPositionService.add(userPosition);
        return new Result(true,StatusCode.OK,"增加成功");
    }

    /**
     * 修改
     * @param userPosition
     */
    @RequestMapping(value="/{id}",method= RequestMethod.PUT)
    public Result update(@RequestBody UserPosition userPosition, @PathVariable Long id ){
        userPosition.setId(id);
        userPositionService.update(userPosition);
        return new Result(true,StatusCode.OK,"修改成功");
    }

    /**
     * 删除
     * @param id
     */
    @RequestMapping(value="/{id}",method= RequestMethod.DELETE)
    public Result delete(@PathVariable Long id){
        userPositionService.deleteById(id);
        return new Result(true,StatusCode.OK,"删除成功");
    }

}
