package cam.listeners;

import org.apache.maven.model.Model;
import org.apache.maven.model.io.xpp3.MavenXpp3Reader;
import org.codehaus.plexus.util.xml.pull.XmlPullParserException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.bridge.SLF4JBridgeHandler;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import static java.lang.ClassLoader.*;

public class InitVersionContextListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {
	private Logger log = LoggerFactory.getLogger(InitVersionContextListener.class);
	private final static String VERSION="0.0.1-SNAPSHOT";

	// Public constructor is required by servlet spec
	public InitVersionContextListener() {
	}

	// -------------------------------------------------------
	// ServletContextListener implementation
	// -------------------------------------------------------
	public void contextInitialized(ServletContextEvent ctx){
		ServletContext context = ctx.getServletContext();

		if(log.isDebugEnabled()){
			SLF4JBridgeHandler.install();
		}
		context.setAttribute("applicationVersion", VERSION);

			/*final Properties properties = new Properties();
			properties.load( InitVersionContextListener.class.getResourceAsStream("application.properties"));
			System.out.println(properties.getProperty("version"));
*/
	}

	public void contextDestroyed(ServletContextEvent sce) {
      /* This method is invoked when the Servlet Context 
         (the Web application) is undeployed or 
         Application Server shuts down.
      */
	}

	// -------------------------------------------------------
	// HttpSessionListener implementation
	// -------------------------------------------------------
	public void sessionCreated(HttpSessionEvent se) {
		/* Session is created. */
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		/* Session is destroyed. */
	}

	// -------------------------------------------------------
	// HttpSessionAttributeListener implementation
	// -------------------------------------------------------

	public void attributeAdded(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute 
         is added to a session.
      */
	}

	public void attributeRemoved(HttpSessionBindingEvent sbe) {
      /* This method is called when an attribute
         is removed from a session.
      */
	}

	public void attributeReplaced(HttpSessionBindingEvent sbe) {
      /* This method is invoked when an attibute
         is replaced in a session.
      */
	}
}
