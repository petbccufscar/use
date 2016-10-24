package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(AlunoExternoController)
@Mock(AlunoExterno)
class AlunoExternoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.alunoExternoInstanceList
            model.alunoExternoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.alunoExternoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def alunoExterno = new AlunoExterno()
            alunoExterno.validate()
            controller.save(alunoExterno)

        then:"The create view is rendered again with the correct model"
            model.alunoExternoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            alunoExterno = new AlunoExterno(params)

            controller.save(alunoExterno)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/alunoExterno/show/1'
            controller.flash.message != null
            AlunoExterno.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def alunoExterno = new AlunoExterno(params)
            controller.show(alunoExterno)

        then:"A model is populated containing the domain instance"
            model.alunoExternoInstance == alunoExterno
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def alunoExterno = new AlunoExterno(params)
            controller.edit(alunoExterno)

        then:"A model is populated containing the domain instance"
            model.alunoExternoInstance == alunoExterno
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/alunoExterno/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def alunoExterno = new AlunoExterno()
            alunoExterno.validate()
            controller.update(alunoExterno)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.alunoExternoInstance == alunoExterno

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            alunoExterno = new AlunoExterno(params).save(flush: true)
            controller.update(alunoExterno)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/alunoExterno/show/$alunoExterno.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/alunoExterno/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def alunoExterno = new AlunoExterno(params).save(flush: true)

        then:"It exists"
            AlunoExterno.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(alunoExterno)

        then:"The instance is deleted"
            AlunoExterno.count() == 0
            response.redirectedUrl == '/alunoExterno/index'
            flash.message != null
    }
}
