package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(DocenteExternoController)
@Mock(DocenteExterno)
class DocenteExternoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.docenteExternoInstanceList
            model.docenteExternoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.docenteExternoInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def docenteExterno = new DocenteExterno()
            docenteExterno.validate()
            controller.save(docenteExterno)

        then:"The create view is rendered again with the correct model"
            model.docenteExternoInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            docenteExterno = new DocenteExterno(params)

            controller.save(docenteExterno)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/docenteExterno/show/1'
            controller.flash.message != null
            DocenteExterno.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def docenteExterno = new DocenteExterno(params)
            controller.show(docenteExterno)

        then:"A model is populated containing the domain instance"
            model.docenteExternoInstance == docenteExterno
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def docenteExterno = new DocenteExterno(params)
            controller.edit(docenteExterno)

        then:"A model is populated containing the domain instance"
            model.docenteExternoInstance == docenteExterno
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/docenteExterno/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def docenteExterno = new DocenteExterno()
            docenteExterno.validate()
            controller.update(docenteExterno)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.docenteExternoInstance == docenteExterno

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            docenteExterno = new DocenteExterno(params).save(flush: true)
            controller.update(docenteExterno)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/docenteExterno/show/$docenteExterno.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/docenteExterno/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def docenteExterno = new DocenteExterno(params).save(flush: true)

        then:"It exists"
            DocenteExterno.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(docenteExterno)

        then:"The instance is deleted"
            DocenteExterno.count() == 0
            response.redirectedUrl == '/docenteExterno/index'
            flash.message != null
    }
}
