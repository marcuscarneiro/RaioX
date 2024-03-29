package br.com.marcus.config;

import java.io.File;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import br.com.marcus.dao.AvaliacaoPublicaDao;
import br.com.marcus.dao.CrecheDao;
import br.com.marcus.dao.DadosIdebDao;
import br.com.marcus.dao.EscolaDao;
import br.com.marcus.dao.MedicaoCrecheDao;
import br.com.marcus.dao.MedicaoEscolaDao;
import br.com.marcus.dao.NotasCrecheDao;
import br.com.marcus.dao.ProvaBrasilDao;
import br.com.marcus.dao.RpaDao;
import br.com.marcus.dao.UserDao;
import br.com.marcus.dao.VisitaDao;
import br.com.marcus.dao.VistoriaCrecheDao;
import br.com.marcus.dao.impl.AvaliacaoPublicaDaoImpl;
import br.com.marcus.dao.impl.CrecheDaoImpl;
import br.com.marcus.dao.impl.DadosIdebDaoImpl;
import br.com.marcus.dao.impl.EscolaDaoImpl;
import br.com.marcus.dao.impl.MedicaoCrecheDaoImpl;
import br.com.marcus.dao.impl.MedicaoEscolaDaoImpl;
import br.com.marcus.dao.impl.NotasCrecheDaoImpl;
import br.com.marcus.dao.impl.ProvaBrasilDaoImpl;
import br.com.marcus.dao.impl.RpaDaoImpl;
import br.com.marcus.dao.impl.UserDaoImpl;
import br.com.marcus.dao.impl.VisitaDaoImpl;
import br.com.marcus.dao.impl.VistoriaCrecheDaoImpl;

@EnableWebMvc
@Configuration
@ComponentScan("br.com.marcus")
@EnableTransactionManagement
public class ApplicationContextConfig extends WebMvcConfigurerAdapter {
	@Bean(name = "viewResolver")
	public InternalResourceViewResolver getViewResolver() {
	    InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
	    viewResolver.setPrefix("/WEB-INF/views/");
	    viewResolver.setSuffix(".jsp");
	    return viewResolver;
	}

	
	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
	 
	    LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
	 
	    sessionBuilder.scanPackages("br.com.marcus.modelo");
	    
	    sessionBuilder.setProperty("hibernate.show_sql", "true");
	 
	    return sessionBuilder.buildSessionFactory();
	}	
	 
	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(
	        SessionFactory sessionFactory) {
	    HibernateTransactionManager transactionManager = new HibernateTransactionManager(
	            sessionFactory);
	 
	    return transactionManager;
	}
	
	@Autowired
	@Bean(name = "escolaDao")
	public EscolaDao getEscolaDao(SessionFactory sessionFactory) {
	    return new EscolaDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "visitaDao")
	public VisitaDao getVisitaDao(SessionFactory sessionFactory) {
		return new VisitaDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "avaliacaoPublicaDao")
	public AvaliacaoPublicaDao getAvaliacaoPublicaDao(SessionFactory sessionFactory) {
		return new AvaliacaoPublicaDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "dadosIdebDao")
	public DadosIdebDao getDadosIdebDao(SessionFactory sessionFactory) {
		return new DadosIdebDaoImpl(sessionFactory);
	}

	@Autowired
	@Bean(name = "notasCrecheDao")
	public NotasCrecheDao getNotasCrecheDao(SessionFactory sessionFactory) {
		return new NotasCrecheDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "rpaDao")
	public RpaDao getRpaDao(SessionFactory sessionFactory) {
		return new RpaDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "provaBrasilDao")
	public ProvaBrasilDao getProvaBrasilDao(SessionFactory sessionFactory) {
		return new ProvaBrasilDaoImpl(sessionFactory);
	}
	
	@Autowired
	@Bean(name = "userDao")
	public UserDao getUserDao(SessionFactory sessionFactory) {
		return new UserDaoImpl(sessionFactory);
	}

	@Autowired
	@Bean(name = "crecheDao")
	public CrecheDao getCrecheDao(SessionFactory sessionFactory) {
		return new CrecheDaoImpl(sessionFactory);
	}

	@Autowired
	@Bean(name = "vistoriaCrecheDao")
	public VistoriaCrecheDao getVistoriaCrecheDao(SessionFactory sessionFactory) {
		return new VistoriaCrecheDaoImpl(sessionFactory);
	}

	@Autowired
	@Bean(name = "medicaoEscolaDao")
	public MedicaoEscolaDao getMedicaoEscolaDao(SessionFactory sessionFactory) {
		return new MedicaoEscolaDaoImpl(sessionFactory);
	}

	@Autowired
	@Bean(name = "medicaoCrecheDao")
	public MedicaoCrecheDao getMedicaoCrecheDao(SessionFactory sessionFactory) {
		return new MedicaoCrecheDaoImpl(sessionFactory);
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
	    CommonsMultipartResolver resolver=new CommonsMultipartResolver();
	    resolver.setDefaultEncoding("utf-8");
	    return resolver;
	}
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		String rootPath = System.getProperty("catalina.base");
		String fotosPath = "file:"+rootPath + File.separator + "ArquivosRaioX/";
		String relatoriosPath = fotosPath + "Relatorios/";
		String relatoriosCrechesPath = fotosPath + "RelatoriosCreches/";
	    
	    System.out.println(fotosPath);
	    System.out.println(relatoriosPath);
  
	    registry.addResourceHandler("/css/**").addResourceLocations("/views/assets/css/");
	    registry.addResourceHandler("/js/**").addResourceLocations("/views/assets/js/");
		registry.addResourceHandler("/fotos/**").addResourceLocations(fotosPath);
		registry.addResourceHandler("/relatorios/**").addResourceLocations(relatoriosPath);
		registry.addResourceHandler("/relatoriosCreches/**").addResourceLocations(relatoriosCrechesPath);
	}
}
