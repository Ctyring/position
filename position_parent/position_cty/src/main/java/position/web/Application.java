package position.web;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;
import position.web.cty.util.IdWorker;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
import xyz.erupt.core.annotation.EruptScan;
@EnableSwagger2
@SpringBootApplication
@EntityScan
@EruptScan
@EnableDiscoveryClient
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Bean
    public IdWorker idWorkker() {
        return new IdWorker(1, 1);
    }

    @Bean
    RestTemplate restTemplate() {
        return new RestTemplate();
    }
}
