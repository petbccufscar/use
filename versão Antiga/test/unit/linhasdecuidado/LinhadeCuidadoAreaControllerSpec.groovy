package linhasdecuidado



import grails.test.mixin.*
import spock.lang.*

@TestFor(LinhadeCuidadoAreaController)
@Mock(LinhadeCuidadoArea)
class LinhadeCuidadoAreaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.linhadeCuidadoAreaInstanceList
            model.linhadeCuidadoAreaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.linhadeCuidadoAreaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def linhadeCuidadoArea = new LinhadeCuidadoArea()
            linhadeCuidadoArea.validate()
            controller.save(linhadeCuidadoArea)

        then:"The create view is rendered again with the correct model"
            model.linhadeCuidadoAreaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            linhadeCuidadoArea = new LinhadeCuidadoArea(params)

            controller.save(linhadeCuidadoArea)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/linhadeCuidadoArea/show/1'
            controller.flash.message != null
            LinhadeCuidadoArea.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def linhadeCuidadoArea = new LinhadeCuidadoArea(params)
            controller.show(linhadeCuidadoArea)

        then:"A model is populated containing the domain instance"
            model.linhadeCuidadoAreaInstance == linhadeCuidadoArea
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def linhadeCuidadoArea = new LinhadeCuidadoArea(params)
            controller.edit(linhadeCuidadoArea)

        then:"A model is populated containing the domain instance"
            model.linhadeCuidadoAreaInstance == linhadeCuidadoArea
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/linhadeCuidadoArea/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def linhadeCuidadoArea = new LinhadeCuidadoArea()
            linhadeCuidadoArea.validate()
            controller.update(linhadeCuidadoArea)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.linhadeCuidadoAreaInstance == linhadeCuidadoArea

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            linhadeCuidadoArea = new LinhadeCuidadoArea(params).save(flush: true)
            controller.update(linhadeCuidadoArea)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/linhadeCuidadoArea/show/$linhadeCuidadoArea.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/linhadeCuidadoArea/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def linhadeCuidadoArea = new LinhadeCuidadoArea(params).save(flush: true)

        then:"It exists"
            LinhadeCuidadoArea.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(linhadeCuidadoArea)

        then:"The instance is deleted"
            LinhadeCuidadoArea.count() == 0
            response.redirectedUrl == '/linhadeCuidadoArea/index'
            flash.message != null
    }
}
