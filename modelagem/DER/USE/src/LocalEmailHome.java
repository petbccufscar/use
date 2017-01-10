import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;

/**
 * Created by Gabriel Palomino on 11/9/2016.
 */
public interface LocalEmailHome extends EJBLocalHome {
    LocalEmail findByPrimaryKey(String key) throws FinderException;
}
