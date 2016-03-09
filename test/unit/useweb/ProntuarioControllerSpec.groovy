package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(ProntuarioController)
@Mock(Prontuario)
class ProntuarioControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.prontuarioInstanceList
            model.prontuarioInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.prontuarioInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def prontuario = new Prontuario()
            prontuario.validate()
            controller.save(prontuario)

        then:"The create view is rendered again with the correct model"
            model.prontuarioInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            prontuario = new Prontuario(params)

            controller.save(prontuario)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/prontuario/show/1'
            controller.flash.message != null
            Prontuario.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def prontuario = new Prontuario(params)
            controller.show(prontuario)

        then:"A model is populated containing the domain instance"
            model.prontuarioInstance == prontuario
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def prontuario = new Prontuario(params)
            controller.edit(prontuario)

        then:"A model is populated containing the domain instance"
            model.prontuarioInstance == prontuario
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/prontuario/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def prontuario = new Prontuario()
            prontuario.validate()
            controller.update(prontuario)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.prontuarioInstance == prontuario

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            prontuario = new Prontuario(params).save(flush: true)
            controller.update(prontuario)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/prontuario/show/$prontuario.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/prontuario/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def prontuario = new Prontuario(params).save(flush: true)

        then:"It exists"
            Prontuario.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(prontuario)

        then:"The instance is deleted"
            Prontuario.count() == 0
            response.redirectedUrl == '/prontuario/index'
            flash.message != null
    }
}
