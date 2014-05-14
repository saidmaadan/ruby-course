require 'spec_helper'


describe TM::DB do

  let(:db) { TM::DB.new }
  describe 'db as a singleton' do
    it "returns a DB object" do
      expect(db).to be_a(TM::DB)
    end

    it "returns same db object every time" do
      db2 = TM::DB.new
      expect(db).to eq(db2)
    end
  end

  describe "projects inside db" do
    it "contains storage for projects" do
      expect(db.projects).to be_a(Hash)
    end

    describe "#create_project" do
      let(:project) {TM::DB.create_project(:name => "My Project")}

      it "creates a new project entity" do
        expect(project).to be_a(TM::Project)
        expect(project.id).to be_a(Fixnum)
        expect(project.name).to eq("My Project")
      end

      it "stores information in the db" do
        expect(TM.db.projects[project.id]).to eq({
          :name => "My Project",
          :id => project.id
        })
      end

      it "gives a unique id every time" do
        p1 = TM.db.create_project(:name => "p1")
        p2 = TM.db.create_project(:name => "p1")
        expect(p1.id).to_not eq(p2.id)
      end
    end

    describe "#get_project" do
      it "returns a project entity with the proper data" do
        p1 = TM.db.create_project(:name => "p1")
        p2 = TM.db.create_project(:name => "p1")
        project = TM.db.get_project(p1.id)
        expect(project).to be_a(TM::Project)
        expect(p1.id).to eq(project.id)
        expect(p1.name).to eq(project.name)
      end

      it "returns nil if the project doesn't exist" do
        project = TM.db.get_project(3)
        expect(project).to eq(nil)
      end
    end

    describe "#update_project" do
      it "updates the project in the db" do
        p1 = TM.db.create_project(:name => "p1")
        # t1 = TM.db.create_task(:project_id => 1, :description: "blah", :priority_num => 3)
        TM.db.update_project(p1.id, :name => "Hello")
        project = TM.db.get_project(p1.id)
        expect(project.name).to eq("Hello")
        expect(project.id).to eq(p1.id)
      end
    end

    describe "#destroy_project" do
      it "destroys project from db" do
        p1 = TM.db.create_project(:name => "p1")
        TM.db.destroy_project(p1.id)
        project = TM.db.get_project(p1.id)
        expect(project).to eq(nil)
      end
    end

  end
end








