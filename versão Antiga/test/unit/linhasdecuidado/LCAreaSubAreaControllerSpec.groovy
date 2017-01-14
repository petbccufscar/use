package linhasdecuidado



import grails.test.mixin.*
import spock.lang.*

@TestFor(LCAreaSubAreaController)
@Mock(LCAreaSubArea)
class LCAreaSubAreaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.LCAreaSubAreaInstanceList
            model.LCAreaSubAreaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.LCAreaSubAreaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def LCAreaSubArea = new LCAreaSubArea()
            LCAreaSubArea.validate()
            controller.save(LCAreaSubArea)

        then:"The create view is rendered again with the correct model"
            model.LCAreaSubAreaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            LCAreaSubArea = new LCAreaSubArea(params)

            controller.save(LCAreaSubArea)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/LCAreaSubArea/show/1'
            controller.flash.message != null
            LCAreaSubArea.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def LCAreaSubArea = new LCAreaSubArea(params)
            controller.show(LCAreaSubArea)

        then:"A model is populated containing the domain instance"
            model.LCAreaSubAreaInstance == LCAreaSubArea
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def LCAreaSubArea = new LCAreaSubArea(params)
            controller.edit(LCAreaSubArea)

        then:"A model is populated containing the domain instance"
            model.LCAreaSubAreaInstance == LCAreaSubArea
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/LCAreaSubArea/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def LCAreaSubArea = new LCAreaSubArea()
            LCAreaSubArea.validate()
            controller.update(LCAreaSubArea)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.LCAreaSubAreaInstance == LCAreaSubArea

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            LCAreaSubArea = new LCAreaSubArea(params).save(flush: true)
            controller.update(LCAreaSubArea)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/LCAreaSubArea/show/$LCAreaSubArea.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/LCAreaSubArea/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def LCAreaSubArea = new LCAreaSubArea(params).save(flush: true)

        then:"It exists"
            LCAreaSubArea.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(LCAreaSubArea)

        then:"The instance is deleted"
            LCAreaSubArea.count() == 0
            response.redirectedUrl == '/LCAreaSubArea/index'
            flash.message != null
    }
}
