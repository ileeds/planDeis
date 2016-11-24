require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @course = Course.new(name: "The Jewish Liturgy", code:"NEJS 127B", requirements:["HUM"], independent_study:false, subjects:[{"id":"1171-5100","segment":"2"},{"id":"1171-6000","segment":"3"}], description:"Prerequisite: A 20-level Hebrew course or the equivalent.\n\nA study of the literature, theology, and history of the daily and Sabbath liturgy. Emphasis will be placed on the interplay between literary structure and ideational content, along with discussion of the philosophical issues involved in prayer. Usually offered every third year.\nMr. Kimelman")
  end
  
  test "should be valid" do
    assert @course.valid?
  end
  
  test "name should be present" do
    @course.name = "     "
    assert_not @course.valid?
  end
  
  test "code should be present" do
    @course.code = "     "
    assert_not @course.valid?
  end
end

=begin
{"term":"1171","type":"course","name":"The Jewish Liturgy","id":"1171-005743","code":"NEJS 127B","requirements":["HUM"],"independent_study":false,"subjects":[{"id":"1171-5100","segment":"2"},{"id":"1171-6000","segment":"3"}],"description":"Prerequisite: A 20-level Hebrew course or the equivalent.\n\nA study of the literature, theology, and history of the daily and Sabbath liturgy. Emphasis will be placed on the interplay between literary structure and ideational content, along with discussion of the philosophical issues involved in prayer. Usually offered every third year.\nMr. Kimelman","continuity_id":"005743","credits":null}
=end