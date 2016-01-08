package mln.spring.config;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

@Configuration
public class LocaleConfiguration extends WebMvcConfigurerAdapter /*implements EnvironmentAware*/ {

//	private RelaxedPropertyResolver propertyResolver;
//	
//	@Override
//	public void setEnvironment(Environment environment) {
//		propertyResolver = new RelaxedPropertyResolver(environment, "spring.messageSource.");
//	}

	@Bean(name = "localeResolver")
	public LocaleResolver localeResolver() {
//		SessionLocaleResolver resolver = new SessionLocaleResolver();
		CookieLocaleResolver resolver = new CookieLocaleResolver();
		
		resolver.setDefaultLocale(new Locale("zh_CN"));
		resolver.setCookieName("MLN_TRANSLATE_LANG_KEY");
		resolver.setCookieMaxAge(4800);
		
		return resolver;
	}
	
	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
									
		messageSource.setBasename("classpath:/i18n/messages");
		messageSource.setDefaultEncoding("UTF-8");
		//messageSource.setCacheSeconds(propertyResolver.getProperty("cacheSeconds", Integer.class, 1));
		messageSource.setCacheSeconds(360000);
		
		return messageSource;
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		LocaleChangeInterceptor interceptor = new LocaleChangeInterceptor();
		
		interceptor.setParamName("lang");
		registry.addInterceptor(interceptor);
	}
	
	
}
