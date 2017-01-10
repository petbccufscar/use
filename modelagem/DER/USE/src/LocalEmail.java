import javax.ejb.EJBLocalObject;

/**
 * Created by Gabriel Palomino on 11/9/2016.
 */
public interface LocalEmail extends EJBLocalObject {
    String getEmail();

    void setEmail(String email);
}
