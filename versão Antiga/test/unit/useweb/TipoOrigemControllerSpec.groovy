package useweb



import grails.test.mixin.*
import spock.lang.*

@TestFor(TipoOrigemController)
@Mock(TipoOrigem)
class TipoOrigemControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.tipoOrigemInstanceList
            model.tipoOrigemInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.tipoOrigemInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def tipoOrigem = new TipoOrigem()
            tipoOrigem.validate()
            controller.save(tipoOrigem)

        then:"The create view is rendered again with the correct model"
            model.tipoOrigemInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            tipoOrigem = new TipoOrigem(params)

            controller.save(tipoOrigem)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/tipoOrigem/show/1'
            controller.flash.message != null
            TipoOrigem.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def tipoOrigem = new TipoOrigem(params)
            controller.show(tipoOrigem)

        then:"A model is populated containing the domain instance"
            model.tipoOrigemInstance == tipoOrigem
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def tipoOrigem = new TipoOrigem(params)
            controller.edit(tipoOrigem)

        then:"A model is populated containing the domain instance"
            model.tipoOrigemInstance == tipoOrigem
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/tipoOrigem/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def tipoOrigem = new TipoOrigem()
            tipoOrigem.validate()
            controller.update(tipoOrigem)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.tipoOrigemInstance == tipoOrigem

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            tipoOrigem = new TipoOrigem(params).save(flush: true)
            controller.update(tipoOrigem)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/tipoOrigem/show/$tipoOrigem.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/tipoOrigem/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def tipoOrigem = new TipoOrigem(params).save(flush: true)

        then:"It exists"
            TipoOrigem.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(tipoOrigem)

        then:"The instance is deleted"
            TipoOrigem.count() == 0
            response.redirectedUrl == '/tipoOrigem/index'
            flash.message != null
    }
}
