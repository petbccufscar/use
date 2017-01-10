import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;

/**
 * Created by Gabriel Palomino on 11/23/2016.
 */
public interface LocalPessoaHome extends EJBLocalHome {
    LocalPessoa findByPrimaryKey(Long key) throws FinderException;
}
