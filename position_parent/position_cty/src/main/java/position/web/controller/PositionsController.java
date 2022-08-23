package position.web.controller;
import java.util.Map;

import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import position.web.cty.entity.PageResult;
import position.web.cty.entity.Result;
import position.web.cty.entity.StatusCode;
import position.web.pojo.Positions;
import position.web.service.PositionsService;

/**
 * positions控制器层
 * @author Administrator
 *
 */
@RestController
@CrossOrigin
@RequestMapping("/positions")
@Api(tags = "职位管理")
public class PositionsController {

	@Autowired
	private PositionsService positionsService;
	
	
	/**
	 * 查询全部数据
	 * @return
	 */
	@RequestMapping(method= RequestMethod.GET)
	public Result findAll(){
		return new Result(true, StatusCode.OK,"查询成功",positionsService.findAll());
	}
	
	/**
	 * 根据ID查询
	 * @param id ID
	 * @return
	 */
	@RequestMapping(value="/{id}",method= RequestMethod.GET)
	public Result findById(@PathVariable Long id){
		return new Result(true,StatusCode.OK,"查询成功",positionsService.findById(id));
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
		Page<Positions> pageList = positionsService.findSearch(searchMap, page, size);
		return  new Result(true,StatusCode.OK,"查询成功",  new PageResult<Positions>(pageList.getTotalElements(), pageList.getContent()) );
	}

	/**
     * 根据条件查询
     * @param searchMap
     * @return
     */
    @RequestMapping(value="/search",method = RequestMethod.POST)
    public Result findSearch( @RequestBody Map searchMap){
        return new Result(true,StatusCode.OK,"查询成功",positionsService.findSearch(searchMap));
    }
	
	/**
	 * 增加
	 * @param positions
	 */
	@RequestMapping(method=RequestMethod.POST)
	public Result add(@RequestBody Positions positions  ){
		positionsService.add(positions);
		return new Result(true,StatusCode.OK,"增加成功");
	}
	
	/**
	 * 修改
	 * @param positions
	 */
	@RequestMapping(value="/{id}",method= RequestMethod.PUT)
	public Result update(@RequestBody Positions positions, @PathVariable Long id ){
		positions.setId(id);
		positionsService.update(positions);
		return new Result(true,StatusCode.OK,"修改成功");
	}
	
	/**
	 * 删除
	 * @param id
	 */
	@RequestMapping(value="/{id}",method= RequestMethod.DELETE)
	public Result delete(@PathVariable Long id){
		positionsService.deleteById(id);
		return new Result(true,StatusCode.OK,"删除成功");
	}
	
}
