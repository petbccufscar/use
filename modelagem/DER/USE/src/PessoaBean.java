import javax.ejb.EJBException;
import javax.ejb.EntityBean;
import javax.ejb.EntityContext;
import javax.ejb.RemoveException;
import java.util.Collection;
import java.util.Date;

/**
 * Created by Gabriel Palomino on 11/9/2016.
 */

public abstract class PessoaBean implements EntityBean {
    public PessoaBean() {
    }

    public void setEntityContext(EntityContext entityContext) throws EJBException {
    }

    public void unsetEntityContext() throws EJBException {
    }

    public void ejbRemove() throws RemoveException, EJBException {
    }

    public void ejbActivate() throws EJBException {
    }

    public void ejbPassivate() throws EJBException {
    }

    public void ejbLoad() throws EJBException {
    }

    public void ejbStore() throws EJBException {
    }

    public abstract String getNome();

    public abstract void setNome(String nome);

    public abstract String getNomeSocial();

    public abstract void setNomeSocial(String nomeSocial);

    public abstract Date getDataNascimento();

    public abstract void setDataNascimento(Date dataNascimento);

    public abstract Long getNumeroCadastro();

    public abstract void setNumeroCadastro(Long cadastro);

    public abstract String getSexo();

    public abstract void setSexo(String sexo);

    public abstract String getCpf();

    public abstract void setCpf(String cpf);

    public abstract Date getDataDeCadastro();

    public abstract void setDataDeCadastro(Date dataDeCadastro);

    public abstract Boolean getStatus();

    public abstract void setStatus(Boolean status);

    public abstract String getStatusMotivo();

    public abstract void setStatusMotivo(String statusMotivo);

    public abstract String getStatusOutrosMotivos();

    public abstract void setStatusOutrosMotivos(String statusOutrosMotivos);

    public abstract String getRg();

    public abstract void setRg(String rg);

    public abstract String getOrgaoEmissor();

    public abstract void setOrgaoEmissor(String orgaoEmissor);

    public abstract String getTipoLogradouro();

    public abstract void setTipoLogradouro(String tipoLogradouro);

    public abstract String getLogradouro();

    public abstract void setLogradouro(String logradouro);

    public abstract String getBairro();

    public abstract void setBairro(String bairro);

    public abstract String getCidade();

    public abstract void setCidade(String cidade);

    public abstract String getEstado();

    public abstract void setEstado(String estado);

    public abstract Collection getEmail();

    public abstract String getVinculo();

    public abstract void setEmail(Collection value);

    public abstract void setVinculo(String value);
}
