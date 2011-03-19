require 'spec_helper'
require 'sunspot/rails/spec_helper'

describe SubjectHeadingTypeHasSubjectsController do
  fixtures :all
  disconnect_sunspot

  describe "GET index" do
    before(:each) do
      Factory.create(:subject_heading_type_has_subject)
    end

    describe "When logged in as Administrator" do
      before(:each) do
        sign_in Factory(:admin)
      end

      it "assigns all subject_heading_type_has_subjects as @subject_heading_type_has_subjects" do
        get :index
        assigns(:subject_heading_type_has_subjects).should eq(SubjectHeadingTypeHasSubject.all)
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in Factory(:librarian)
      end

      it "assigns all subject_heading_type_has_subjects as @subject_heading_type_has_subjects" do
        get :index
        assigns(:subject_heading_type_has_subjects).should eq(SubjectHeadingTypeHasSubject.all)
      end
    end

    describe "When logged in as Subject" do
      before(:each) do
        sign_in Factory(:user)
      end

      it "assigns all subject_heading_type_has_subjects as @subject_heading_type_has_subjects" do
        get :index
        assigns(:subject_heading_type_has_subjects).should be_empty
        response.should be_forbidden
      end
    end

    describe "When not logged in" do
      it "assigns all subject_heading_type_has_subjects as @subject_heading_type_has_subjects" do
        get :index
        assigns(:subject_heading_type_has_subjects).should be_empty
        response.should redirect_to(new_user_session_url)
      end
    end
  end

  describe "GET show" do
    describe "When logged in as Administrator" do
      before(:each) do
        sign_in Factory(:admin)
      end

      it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        subject_heading_type_has_subject = Factory.create(:subject_heading_type_has_subject)
        get :show, :id => subject_heading_type_has_subject.id
        assigns(:subject_heading_type_has_subject).should eq(subject_heading_type_has_subject)
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in Factory(:librarian)
      end

      it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        subject_heading_type_has_subject = Factory.create(:subject_heading_type_has_subject)
        get :show, :id => subject_heading_type_has_subject.id
        assigns(:subject_heading_type_has_subject).should eq(subject_heading_type_has_subject)
      end
    end

    describe "When logged in as Subject" do
      before(:each) do
        sign_in Factory(:user)
      end

      it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        subject_heading_type_has_subject = Factory.create(:subject_heading_type_has_subject)
        get :show, :id => subject_heading_type_has_subject.id
        assigns(:subject_heading_type_has_subject).should eq(subject_heading_type_has_subject)
      end
    end

    describe "When not logged in" do
      it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        subject_heading_type_has_subject = Factory.create(:subject_heading_type_has_subject)
        get :show, :id => subject_heading_type_has_subject.id
        assigns(:subject_heading_type_has_subject).should eq(subject_heading_type_has_subject)
      end
    end
  end

  describe "GET new" do
    describe "When logged in as Administrator" do
      before(:each) do
        sign_in Factory(:admin)
      end

      it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        get :new
        assigns(:subject_heading_type_has_subject).should_not be_valid
        response.should be_success
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in Factory(:librarian)
      end

      it "should not assign the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        get :new
        assigns(:subject_heading_type_has_subject).should_not be_valid
        response.should be_forbidden
      end
    end

    describe "When logged in as Subject" do
      before(:each) do
        sign_in Factory(:user)
      end

      it "should not assign the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        get :new
        assigns(:subject_heading_type_has_subject).should_not be_valid
        response.should be_forbidden
      end
    end

    describe "When not logged in" do
      it "should not assign the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        get :new
        assigns(:subject_heading_type_has_subject).should_not be_valid
        response.should redirect_to(new_user_session_url)
      end
    end
  end

  describe "GET edit" do
    describe "When logged in as Administrator" do
      before(:each) do
        sign_in Factory(:admin)
      end

      it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        subject_heading_type_has_subject = Factory.create(:subject_heading_type_has_subject)
        get :edit, :id => subject_heading_type_has_subject.id
        assigns(:subject_heading_type_has_subject).should eq(subject_heading_type_has_subject)
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in Factory(:librarian)
      end

      it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        subject_heading_type_has_subject = Factory.create(:subject_heading_type_has_subject)
        get :edit, :id => subject_heading_type_has_subject.id
        assigns(:subject_heading_type_has_subject).should eq(subject_heading_type_has_subject)
      end
    end

    describe "When logged in as Subject" do
      before(:each) do
        sign_in Factory(:user)
      end

      it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        subject_heading_type_has_subject = Factory.create(:subject_heading_type_has_subject)
        get :edit, :id => subject_heading_type_has_subject.id
        response.should be_forbidden
      end
    end

    describe "When not logged in" do
      it "should not assign the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
        subject_heading_type_has_subject = Factory.create(:subject_heading_type_has_subject)
        get :edit, :id => subject_heading_type_has_subject.id
        response.should redirect_to(new_user_session_url)
      end
    end
  end

  describe "POST create" do
    before(:each) do
      @attrs = Factory.attributes_for(:subject_heading_type_has_subject)
      @invalid_attrs = {:subject_heading_type_id => ''}
    end

    describe "When logged in as Administrator" do
      before(:each) do
        sign_in Factory(:admin)
      end

      describe "with valid params" do
        it "assigns a newly created subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          post :create, :subject_heading_type_has_subject => @attrs
          assigns(:subject_heading_type_has_subject).should be_valid
        end

        it "redirects to the created patron" do
          post :create, :subject_heading_type_has_subject => @attrs
          response.should redirect_to(assigns(:subject_heading_type_has_subject))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          post :create, :subject_heading_type_has_subject => @invalid_attrs
          assigns(:subject_heading_type_has_subject).should_not be_valid
        end

        it "re-renders the 'new' template" do
          post :create, :subject_heading_type_has_subject => @invalid_attrs
          response.should render_template("new")
        end
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in Factory(:librarian)
      end

      describe "with valid params" do
        it "assigns a newly created subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          post :create, :subject_heading_type_has_subject => @attrs
          assigns(:subject_heading_type_has_subject).should be_valid
        end

        it "should be forbidden" do
          post :create, :subject_heading_type_has_subject => @attrs
          response.should be_forbidden
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          post :create, :subject_heading_type_has_subject => @invalid_attrs
          assigns(:subject_heading_type_has_subject).should_not be_valid
        end

        it "should be forbidden" do
          post :create, :subject_heading_type_has_subject => @invalid_attrs
          response.should be_forbidden
        end
      end
    end

    describe "When logged in as Subject" do
      before(:each) do
        sign_in Factory(:user)
      end

      describe "with valid params" do
        it "assigns a newly created subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          post :create, :subject_heading_type_has_subject => @attrs
          assigns(:subject_heading_type_has_subject).should be_valid
        end

        it "should be forbidden" do
          post :create, :subject_heading_type_has_subject => @attrs
          response.should be_forbidden
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          post :create, :subject_heading_type_has_subject => @invalid_attrs
          assigns(:subject_heading_type_has_subject).should_not be_valid
        end

        it "should be forbidden" do
          post :create, :subject_heading_type_has_subject => @invalid_attrs
          response.should be_forbidden
        end
      end
    end

    describe "When not logged in" do
      describe "with valid params" do
        it "assigns a newly created subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          post :create, :subject_heading_type_has_subject => @attrs
          assigns(:subject_heading_type_has_subject).should be_valid
        end

        it "should be forbidden" do
          post :create, :subject_heading_type_has_subject => @attrs
          response.should redirect_to(new_user_session_url)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          post :create, :subject_heading_type_has_subject => @invalid_attrs
          assigns(:subject_heading_type_has_subject).should_not be_valid
        end

        it "should be forbidden" do
          post :create, :subject_heading_type_has_subject => @invalid_attrs
          response.should redirect_to(new_user_session_url)
        end
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      @subject_heading_type_has_subject = Factory(:subject_heading_type_has_subject)
      @attrs = Factory.attributes_for(:subject_heading_type_has_subject)
      @invalid_attrs = {:subject_heading_type_id => ''}
    end

    describe "When logged in as Administrator" do
      before(:each) do
        sign_in Factory(:admin)
      end

      describe "with valid params" do
        it "updates the requested subject_heading_type_has_subject" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @attrs
        end

        it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @attrs
          assigns(:subject_heading_type_has_subject).should eq(@subject_heading_type_has_subject)
          response.should redirect_to(@subject_heading_type_has_subject)
        end
      end

      describe "with invalid params" do
        it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @invalid_attrs
          response.should render_template("edit")
        end
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in Factory(:librarian)
      end

      describe "with valid params" do
        it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @attrs
        end

        it "should be forbidden" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @attrs
          response.should be_forbidden
        end
      end

      describe "with invalid params" do
        it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @invalid_attrs
          assigns(:subject_heading_type_has_subject).should eq(@subject_heading_type_has_subject)
        end

        it "should be forbidden" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @invalid_attrs
          response.should be_forbidden
        end
      end
    end

    describe "When logged in as Subject" do
      before(:each) do
        sign_in Factory(:user)
      end

      describe "with valid params" do
        it "updates the requested subject_heading_type_has_subject" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @attrs
        end

        it "should be forbidden" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @attrs
          assigns(:subject_heading_type_has_subject).should eq(@subject_heading_type_has_subject)
          response.should be_forbidden
        end
      end

      describe "with invalid params" do
        it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @invalid_attrs
          response.should be_forbidden
        end
      end
    end

    describe "When not logged in" do
      describe "with valid params" do
        it "updates the requested subject_heading_type_has_subject" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @attrs
        end

        it "should be forbidden" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @attrs
          response.should redirect_to(new_user_session_url)
        end
      end

      describe "with invalid params" do
        it "assigns the requested subject_heading_type_has_subject as @subject_heading_type_has_subject" do
          put :update, :id => @subject_heading_type_has_subject.id, :subject_heading_type_has_subject => @invalid_attrs
          response.should redirect_to(new_user_session_url)
        end
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @subject_heading_type_has_subject = Factory(:subject_heading_type_has_subject)
    end

    describe "When logged in as Administrator" do
      before(:each) do
        sign_in Factory(:admin)
      end

      it "destroys the requested subject_heading_type_has_subject" do
        delete :destroy, :id => @subject_heading_type_has_subject.id
      end

      it "redirects to the subject_heading_type_has_subjects list" do
        delete :destroy, :id => @subject_heading_type_has_subject.id
        response.should redirect_to(subject_heading_type_has_subjects_url)
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in Factory(:librarian)
      end

      it "destroys the requested subject_heading_type_has_subject" do
        delete :destroy, :id => @subject_heading_type_has_subject.id
      end

      it "redirects to the subject_heading_type_has_subjects list" do
        delete :destroy, :id => @subject_heading_type_has_subject.id
        response.should be_forbidden
      end
    end

    describe "When logged in as Subject" do
      before(:each) do
        sign_in Factory(:user)
      end

      it "destroys the requested subject_heading_type_has_subject" do
        delete :destroy, :id => @subject_heading_type_has_subject.id
      end

      it "should be forbidden" do
        delete :destroy, :id => @subject_heading_type_has_subject.id
        response.should be_forbidden
      end
    end

    describe "When not logged in" do
      it "destroys the requested subject_heading_type_has_subject" do
        delete :destroy, :id => @subject_heading_type_has_subject.id
      end

      it "should be forbidden" do
        delete :destroy, :id => @subject_heading_type_has_subject.id
        response.should redirect_to(new_user_session_url)
      end
    end
  end
end
