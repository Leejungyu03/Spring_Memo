package com.memo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.memo.common.FileManagerService;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
		.addResourceHandler("/images/**")  // http://localhost/images/marobiana_16205748673/sun.png 와 같이 접근가능하게 맵핑해준다.
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);	// MacOS 일 경우엔 file//
	}
}
