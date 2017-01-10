import javax.ejb.EJBHome;
import javax.ejb.FinderException;
import java.rmi.RemoteException;

/**
 * Created by Gabriel Palomino on 11/23/2016.
 */
public interface PessoaHome extends EJBHome {
    Pessoa findByPrimaryKey(Long key) throws RemoteException, FinderException;
}
