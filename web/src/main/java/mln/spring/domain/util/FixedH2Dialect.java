/**
 * 
 */
package mln.spring.domain.util;

import java.sql.Types;

import org.hibernate.dialect.H2Dialect;

/**
 * @author ZhouWenLong
 *
 */
public class FixedH2Dialect extends H2Dialect {
	
	public FixedH2Dialect() {
		super();
		registerHibernateType( Types.FLOAT, "real" );
	}
}
