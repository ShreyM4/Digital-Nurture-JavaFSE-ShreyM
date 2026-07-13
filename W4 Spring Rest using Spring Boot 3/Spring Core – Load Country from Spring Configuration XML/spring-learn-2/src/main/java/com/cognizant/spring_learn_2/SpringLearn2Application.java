package com.cognizant.spring_learn_2;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@SpringBootApplication
public class SpringLearn2Application {

	private static final Logger LOGGER = LoggerFactory.getLogger(SpringLearn2Application.class);

	public static void main(String[] args) {
		SpringApplication.run(SpringLearn2Application.class, args);
		System.out.println(">>> Calling displayCountry()");
		displayCountry();
	}

	public static void displayCountry() {
		System.out.println(">>> Inside displayCountry()");
		LOGGER.debug("START");
		ApplicationContext context = new ClassPathXmlApplicationContext("country.xml");
		Country country = (Country) context.getBean("countryIN", Country.class);
		LOGGER.debug("Country : {}", country.toString());
		Country countryUS = context.getBean("countryUS", Country.class);
		LOGGER.debug("Country US: {}", countryUS);

		Country countryDE = context.getBean("countryDE", Country.class);
		LOGGER.debug("Country DE: {}", countryDE);

		Country countryJP = context.getBean("countryJP", Country.class);
		LOGGER.debug("Country JP: {}", countryJP);

		LOGGER.debug("END");
	}
}
