package linhasdecuidado



import grails.test.mixin.*
import spock.lang.*

@TestFor(PesquisaController)
@Mock(Pesquisa)
class PesquisaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.pesquisaInstanceList
            model.pesquisaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.pesquisaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def pesquisa = new Pesquisa()
            pesquisa.validate()
            controller.save(pesquisa)

        then:"The create view is rendered again with the correct model"
            model.pesquisaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            pesquisa = new Pesquisa(params)

            controller.save(pesquisa)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/pesquisa/show/1'
            controller.flash.message != null
            Pesquisa.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def pesquisa = new Pesquisa(params)
            controller.show(pesquisa)

        then:"A model is populated containing the domain instance"
            model.pesquisaInstance == pesquisa
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def pesquisa = new Pesquisa(params)
            controller.edit(pesquisa)

        then:"A model is populated containing the domain instance"
            model.pesquisaInstance == pesquisa
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/pesquisa/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def pesquisa = new Pesquisa()
            pesquisa.validate()
            controller.update(pesquisa)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.pesquisaInstance == pesquisa

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            pesquisa = new Pesquisa(params).save(flush: true)
            controller.update(pesquisa)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/pesquisa/show/$pesquisa.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/pesquisa/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def pesquisa = new Pesquisa(params).save(flush: true)

        then:"It exists"
            Pesquisa.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(pesquisa)

        then:"The instance is deleted"
            Pesquisa.count() == 0
            response.redirectedUrl == '/pesquisa/index'
            flash.message != null
    }
}
