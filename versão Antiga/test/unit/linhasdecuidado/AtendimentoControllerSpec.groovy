package linhasdecuidado



import grails.test.mixin.*
import spock.lang.*

@TestFor(AtendimentoController)
@Mock(Atendimento)
class AtendimentoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.atendimentoInstanceList
            model.atendimentoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.atendimentoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def atendimento = new Atendimento()
            atendimento.validate()
            controller.save(atendimento)

        then:"The create view is rendered again with the correct model"
            model.atendimentoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            atendimento = new Atendimento(params)

            controller.save(atendimento)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/atendimento/show/1'
            controller.flash.message != null
            Atendimento.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def atendimento = new Atendimento(params)
            controller.show(atendimento)

        then:"A model is populated containing the domain instance"
            model.atendimentoInstance == atendimento
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def atendimento = new Atendimento(params)
            controller.edit(atendimento)

        then:"A model is populated containing the domain instance"
            model.atendimentoInstance == atendimento
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/atendimento/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def atendimento = new Atendimento()
            atendimento.validate()
            controller.update(atendimento)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.atendimentoInstance == atendimento

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            atendimento = new Atendimento(params).save(flush: true)
            controller.update(atendimento)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/atendimento/show/$atendimento.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/atendimento/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def atendimento = new Atendimento(params).save(flush: true)

        then:"It exists"
            Atendimento.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(atendimento)

        then:"The instance is deleted"
            Atendimento.count() == 0
            response.redirectedUrl == '/atendimento/index'
            flash.message != null
    }
}
