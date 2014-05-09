require 'spec_helper'

describe TM::DB do
  it "" do
    # DONT DO THIS (bad)
    # MyApp.db.create_project(...)

    # DO THIS (good)
    db = TM::DB.new
    db.create_project(...)
  end
end
