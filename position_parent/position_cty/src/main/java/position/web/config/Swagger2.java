package position.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @author cty
 * @date 2022/8/15
 */

@Configuration  //开启扫描
@EnableSwagger2 //开启swagger2
public class Swagger2 {
    // 配置swagger2核心配置 docket
    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)  // 指定api类型为swagger2
                .apiInfo(apiInfo())                 // 用于定义api文档汇总信息
                .select()
                .apis(RequestHandlerSelectors
                        .basePackage("position.web.controller"))   // 指定controller包
                .paths(PathSelectors.any())         // 所有controller
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("云职位")        // 文档页标题
                .contact(new Contact("position/web/cty",
                        "https://space.bilibili.com/503646796",
                        "173479693@qq.com"))        // 联系人信息
                .description("云职位api文档")  // 详细信息
                .version("1.0.0")   // 文档版本号
                .termsOfServiceUrl("https://space.bilibili.com/503646796") // 网站地址
                .build();
    }

}
