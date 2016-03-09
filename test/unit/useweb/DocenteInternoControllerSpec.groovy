package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(DocenteInternoController)
@Mock(DocenteInterno)
class DocenteInternoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.docenteInternoInstanceList
            model.docenteInternoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.docenteInternoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def docenteInterno = new DocenteInterno()
            docenteInterno.validate()
            controller.save(docenteInterno)

        then:"The create view is rendered again with the correct model"
            model.docenteInternoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            docenteInterno = new DocenteInterno(params)

            controller.save(docenteInterno)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/docenteInterno/show/1'
            controller.flash.message != null
            DocenteInterno.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def docenteInterno = new DocenteInterno(params)
            controller.show(docenteInterno)

        then:"A model is populated containing the domain instance"
            model.docenteInternoInstance == docenteInterno
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def docenteInterno = new DocenteInterno(params)
            controller.edit(docenteInterno)

        then:"A model is populated containing the domain instance"
            model.docenteInternoInstance == docenteInterno
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/docenteInterno/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def docenteInterno = new DocenteInterno()
            docenteInterno.validate()
            controller.update(docenteInterno)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.docenteInternoInstance == docenteInterno

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            docenteInterno = new DocenteInterno(params).save(flush: true)
            controller.update(docenteInterno)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/docenteInterno/show/$docenteInterno.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/docenteInterno/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def docenteInterno = new DocenteInterno(params).save(flush: true)

        then:"It exists"
            DocenteInterno.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(docenteInterno)

        then:"The instance is deleted"
            DocenteInterno.count() == 0
            response.redirectedUrl == '/docenteInterno/index'
            flash.message != null
    }
}
